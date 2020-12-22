import 'package:EsquireCallCenterExecutiveApp/blocs/auth/auth_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/auth/auth_event.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/auth/auth_state.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/filter/filter_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/initial/intial_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/presentation/widgets/ticket_card.dart';
import 'package:EsquireCallCenterExecutiveApp/core/configs/config.dart';
import 'package:EsquireCallCenterExecutiveApp/mocks/repo.dart';
import 'package:EsquireCallCenterExecutiveApp/core/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:openapi/api.dart';
import 'package:openapi/model/login_vm.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);
    final IntialBloc _initialBloc = BlocProvider.of<IntialBloc>(context);
    final FilterBloc _filterBloc = BlocProvider.of<FilterBloc>(context);
    _initialBloc.add(GetIntialdataEvent());
    _filterBloc.add(GetTicketByStatusEvent(status: 'OPEN'));

    return Scaffold(
      appBar: AppBar(
        title: Text('Tickets'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.filter_list),
            itemBuilder: (context) {
              return _initialBloc.ticketStatus
                  .map((e) => PopupMenuItem(value: e, child: Text(e)))
                  .toList();
            },
            onSelected: (value) {
              _filterBloc.add(GetTicketByStatusEvent(status: value));
            },
          ),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(30, 100, 0, 0),
                    items: [
                      PopupMenuItem(
                          child: FlatButton.icon(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.person),
                              label: Text('My Profile'))),
                      PopupMenuItem(
                          child: FlatButton.icon(
                              onPressed: () {
                                _authBloc.add(LogoutAuthEvent(LoginVM()));
                                Get.back();
                              },
                              icon: Icon(Icons.exit_to_app),
                              label: Text('Log out')))
                    ]);
              })
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorAuthState) {
            Util.showSnackBar('Failed',
                'Error: ' + (Config.DEBUG_ENABLED_SNACKBAR ? state.error : ''));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                return state is FilteredState
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return TicketCard(
                            ticket: state.tickets[index],
                          );
                        },
                        itemCount: state.tickets.length,
                      )
                    : Container();
              },
            );
          },
        ),
      ),
    );
  }
}

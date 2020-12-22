import 'dart:async';

import 'package:EsquireCallCenterExecutiveApp/core/configs/config.dart';
import 'package:bloc/bloc.dart';
import 'package:openapi/api.dart';
import 'package:openapi/model/ticket.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial());
  final Openapi _openapi = Openapi();
  List<Ticket> tickets;
  @override
  Stream<FilterState> mapEventToState(
    FilterEvent event,
  ) async* {
    Map<String, String> token =
        Config.TOKEN != null ? Config.TOKEN : {'Authorization': null};
    if (event is GetTicketByStatusEvent) {
      try {
        await _openapi
            .getTicketResourceApi()
            .getAllTicketsByServiceExecutiveIdAndServiceStatusUsingGET(
                Config.SERVICEEXECUTIVE.id, event.status,
                headers: token)
            .then((value) => tickets = value.data);
        print(tickets);
        yield FilteredState(tickets: tickets);
      } on Exception catch (e) {
        print('getAllTicketsByServiceExecutiveIdAndServiceStatusUsingGET' +
            e.toString());
      }
    }
  }
}

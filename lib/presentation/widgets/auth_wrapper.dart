import 'package:EsquireCallCenterExecutiveApp/blocs/auth/auth_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/auth/auth_state.dart';
import 'package:EsquireCallCenterExecutiveApp/presentation/pages/home.dart';
import 'package:EsquireCallCenterExecutiveApp/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoggedInAuthState) {
        return Home();
      } else {
        return LoginPage();
      }
    }));
  }
}

import 'package:EsquireCallCenterExecutiveApp/blocs/auth/auth_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/auth/auth_event.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/auth/auth_state.dart';
import 'package:EsquireCallCenterExecutiveApp/core/configs/config.dart';
import 'package:EsquireCallCenterExecutiveApp/main.dart';
import 'package:EsquireCallCenterExecutiveApp/core/utils/util.dart';
import 'package:EsquireCallCenterExecutiveApp/presentation/widgets/auth_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:openapi/model/login_vm.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKeyLoginPage =
      GlobalKey<FormBuilderState>();

  final ValueChanged _onChanged = (val) => print(val);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoggedInAuthState) {
          Util.showSnackBar("Successful", "Successfully Logged In");
        }

        if (state is ErrorAuthState) {
          Util.showSnackBar(
              'Failed',
              'Invalid Username or Password ' +
                  (Config.DEBUG_ENABLED_SNACKBAR ? state.error : ''));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is CheckingAuthState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is LoggedInAuthState) {
            return AuthWrapper();
          }

          if (state is ErrorAuthState) {
            _authBloc.add(LogoutAuthEvent(LoginVM()));
          }

          return _buildMainWidget(context, _fbKeyLoginPage);
        },
      ),
    );
  }

  Widget _buildMainWidget(
      BuildContext context, GlobalKey<FormBuilderState> _fbKeyLoginPage) {
    // ignore: close_sinks
    final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              FormBuilder(
                key: _fbKeyLoginPage,
                readOnly: false,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome Back,',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                Text(
                                  'Log In !',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .2,
                          width: MediaQuery.of(context).size.width * .2,
                          child: Image.asset('assets/images/esquirelogo.png'),
                        ),
                      ],
                    ),
                    Text(
                      'Esquire Service Executive App',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark),
                    ),
                    SizedBox(height: 15),
                    FormBuilderTextField(
                      attribute: 'email',
                      decoration: const InputDecoration(
                        labelText: 'Email or Mobile Phone',
                      ),
                      initialValue: 'user',
                      onChanged: _onChanged,
                      validators: [
                        FormBuilderValidators.required(),
                        //FormBuilderValidators.email(),
                        //FormBuilderValidators.max(70),
                      ],
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 15),
                    FormBuilderTextField(
                      maxLines: 1,
                      obscureText: true,
                      attribute: 'password',
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      initialValue: 'user',
                      onChanged: _onChanged,
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(4),

                        //FormBuilderValidators.max(70),
                      ],
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 15),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              MaterialButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'Submit',
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {
                  print(_fbKeyLoginPage.currentState.value);
                  if (_fbKeyLoginPage.currentState.saveAndValidate()) {
                    var login = LoginVM().toBuilder()
                      ..username = _fbKeyLoginPage.currentState.value['email']
                      ..password =
                          _fbKeyLoginPage.currentState.value['password'];
                    _authBloc.add(LoginAuthEvent(login.build()));
                  } else {
                    print(_fbKeyLoginPage.currentState.value);
                    Util.showSnackBar('Validation', 'Validation Failed',
                        duration: Duration(
                            seconds: Config.SNACKBAR_WAIT_FOR_DISPLAY));

                    print('validation failed');
                  }
                },
              ),
            ]),
          );
        },
      ),
    );
  }
}

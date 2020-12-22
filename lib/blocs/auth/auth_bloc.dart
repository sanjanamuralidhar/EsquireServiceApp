import 'dart:async';
import 'dart:math';

import 'package:EsquireCallCenterExecutiveApp/core/configs/config.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:openapi/api.dart';
import 'package:openapi/model/login_vm.dart';
import 'package:openapi/model/managed_user_vm.dart';
import 'package:openapi/model/user_dto.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final openApi = Openapi();

  UserDTO loggedInUser = null;

  String idToken = null;

  String otpReference = null;

  AuthBloc() : super(LoggedOutAuthState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is GuestAuthEvent) return;

    if (event is GoToGuestHomeEvent) yield ShowGuestHomeState();

    if (event is SuccessfullyLoggedInAuthEvent) yield LoggedInAuthState();

    if (event is LoginAuthEvent) {
      try {
        yield CheckingAuthState();
        yield await _loginCheck(event.loginUser);
      } catch (e) {
        yield ErrorAuthState(e.toString());
      }
    }

    if (event is LogoutAuthEvent) {
      try {
        yield CheckingAuthState();
        this.loggedInUser = null;
        Config.TOKEN = null;
        Config.USER = null;
        yield LoggedOutAuthState();
      } catch (e) {
        yield ErrorAuthState(e.toString());
      }
    }

    if (event is RegisterAuthEvent) {
      try {
        yield CheckingAuthState();
        yield await _registerUser(event.registerUser);
      } catch (e) {
        yield ErrorAuthState(e.toString());
      }
    }

    if (event is UpdateUserAuthEvent) {
      try {
        yield CheckingAuthState();
        yield await _updateUser(event.updateUser);
        this.loggedInUser = event.updateUser;
      } catch (e) {
        yield ErrorAuthState(e.toString());
      }
    }

    if (event is OTPAuthEvent) {
      try {
        yield CheckingAuthState();
        yield await _generateOTP();
      } catch (e) {
        yield ErrorAuthState(e.toString());
      }
    }

    if (event is OTPVerifyAuthEvent) {
      try {
        yield CheckingAuthState();
        yield await _verifyOTP(event.otp);
      } catch (e) {
        yield ErrorAuthState(e.toString());
      }
    }
  }

  Future<AuthState> _loginCheck(LoginVM loginUser) async {
    debugPrint('AuthBloc -> Check Login for user: $loginUser');
    // return LoggedInAuthState();
    try {
      var token =
          await openApi.getUserJwtControllerApi().authorizeUsingPOST(loginUser);

      debugPrint("AuthBloc -> Authorize called" + e.toString());

      this.idToken = token.data.idToken;
      Config.TOKEN = {'Authorization': 'Bearer ${this.idToken}'};
      var loggedInUserFromServer = await openApi
          .getAccountResourceApi()
          .getAccountUsingGET(
              headers: {'Authorization': 'Bearer ${this.idToken}'});

      this.loggedInUser = loggedInUserFromServer.data;
      Config.USER = loggedInUserFromServer.data;
      debugPrint('AuthBloc -> ${this.loggedInUser}');
      try {
        var serviceExecutive = await openApi
            .getServiceExecutiveResourceApi()
            .getServiceExecutiveByUserLoginUsingGET(loginUser.username,
                headers: Config.TOKEN);
        Config.SERVICEEXECUTIVE = serviceExecutive.data;
      } on Exception catch (e) {
        print('getServiceExecutiveByUserLoginUsingGET ' + e.toString());
      }
      return LoggedInAuthState();
    } catch (e) {
      debugPrint('AuthBloc -> Inside Exception  e*: ${e.toString()} ');

      return ErrorAuthState(e.toString());
    }
  }

  Future<AuthState> _registerUser(ManagedUserVM registerUser) async {
    debugPrint('AuthBloc -> $registerUser');

    try {
      var user = await openApi
          .getAccountResourceApi()
          .registerAccountUsingPOST(registerUser);
      return RegisterSuccessAuthState();
    } catch (e) {
      return ErrorAuthState(e.toString());
    }
  }

  Future<AuthState> _updateUser(UserDTO updateUser) async {
    debugPrint('AuthBloc -> $updateUser');

    try {
      var user = await openApi.getAccountResourceApi().saveAccountUsingPOST(
          updateUser,
          headers: {'Authorization': 'Bearer ${this.idToken}'});

      return UpdateSuccessAuthState();
    } catch (e) {
      if (e.response.statusCode != null && e.response.statusCode == 400) {
        debugPrint('AuthBloc -> Inside Status Code 400');
        // TODO Create app user credentials for looking up background details
        return ErrorAuthState("Profile Pic is too Large  ${e}");
      }

      return ErrorAuthState(e.toString());
    }
  }

  Future<AuthState> _generateOTP() async {
    try {
      var result = await openApi.getOtpResourceApi().getOtpToRegisterUsingGET(
          loggedInUser.login,
          headers: {'Authorization': 'Bearer ${this.idToken}'});

      this.otpReference = result.data.details;
      debugPrint('AuthBloc -> OTP Details: ${result.data.details}');
      debugPrint('AuthBloc -> OTP Status ${result.data.status}');

      return SuccessFullyGeneratedOTPAuthState();
    } catch (e) {
      return ErrorAuthState(e.toString());
    }
  }

  Future<AuthState> _verifyOTP(String otp) async {
    try {
      var result = await openApi.getOtpResourceApi().verifyOtpUsingGET(
          loggedInUser.login, otp, otpReference,
          headers: {'Authorization': 'Bearer ${this.idToken}'});

      return SuccessFullyVerifiedOTPAuthState();
    } catch (e) {
      return ErrorAuthState(e.toString());
    }
  }
}

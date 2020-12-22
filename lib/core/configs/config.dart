import 'package:openapi/model/user_dto.dart';
import 'package:openapi/model/service_executive.dart';

class Config {
  static final SERVER_BASE_PATH = 'http://35.209.40.232:8083';

  static final APP_USER = 'admin';
  static final APP_PASSWORD = 'admin';
  static final SNACKBAR_WAIT_FOR_DISPLAY = 3;
  static final DEBUG_ENABLED_SNACKBAR = true;
  static Map<String, String> TOKEN;
  static UserDTO USER;
  static ServiceExecutive SERVICEEXECUTIVE;
}

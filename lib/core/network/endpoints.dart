// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:getx_clean_architecture/core/network/network_constants.dart';

class Endpoints {
  static const String BASE_URL = NetworkContants.PROD_BASE_URL;

  static const String GET_TOKEN = "/rest/v1/auth/tokens";
  static const String SIGN_IN = "/rest/v1/account/checkLogin";
}

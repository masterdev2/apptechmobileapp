import 'package:apptech/bloc/apptechapi.dart';
import 'package:flutter/foundation.dart';

import 'authentication.dart';

class DataBloc {
  final AppTechApi _api;
  final Authentication auth;

  DataBloc.instance({this.auth})
      : _api = AppTechApi.instance();

  void dispose() {

  }




}

class Values {
  static const int updateTime =
      !kReleaseMode ? 5000 : 30 * 60 * 1000; //30 * 60 * 1000
}

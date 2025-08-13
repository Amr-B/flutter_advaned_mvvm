// ignore_for_file: constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:advanced_flutter_tutorial/app/constants.dart';
import 'package:dio/dio.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "langauge";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    Duration _timeOut =
        const Duration(milliseconds: 60 * 1000); // > time out as minimum

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: ACCEPT,
      AUTHORIZATION: "put token here",
      DEFAULT_LANGUAGE: "en", // > TODO get language from app prefs
    };

    dio.options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        headers: headers,
        receiveTimeout: _timeOut,
        sendTimeout: _timeOut);
    return dio;
  }
}

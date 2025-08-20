// ignore_for_file: constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:advanced_flutter_tutorial/app/app_prefs.dart';
import 'package:advanced_flutter_tutorial/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "langauge";

class DioFactory {
  final AppPrefs _appPrefs;
  DioFactory(this._appPrefs);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    String language = await _appPrefs.getAppLanguage() ?? "en";
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: ACCEPT,
      AUTHORIZATION: "put token here",
      DEFAULT_LANGUAGE: "en",
    };

    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: AppConstants.apiTimeOut),
      sendTimeout: const Duration(milliseconds: AppConstants.apiTimeOut),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}

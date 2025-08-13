// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error
      failure = _handleError(error);
    } else {
      // > unkown error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    // connectionTimeout
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();

    // sendTimeout
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();

    // receiveTimeout
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();

    // badCertificate
    case DioExceptionType.badCertificate:
      throw UnimplementedError();

    // badResponse
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }

    // cancel
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();

    // connectionError
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();

    // unknown
    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTNET,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  CACHE_ERROR,
  SEND_TIMEOUT,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

// > cases
extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      // SUCCESS
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);

      // NO_CONTENT
      case DataSource.NO_CONTNET:
        return Failure(ResponseCode.NO_CONTNET, ResponseMessage.NO_CONTNET);

      // BAD_REQUEST
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);

      // FORBIDDEN
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);

      // UNAUTHORISED
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);

      // NOT_FOUND
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);

      // INTERNAL_SERVER_ERROR
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);

      // CONNECT_TIMEOUT
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);

      // CANCEL
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);

      // RECEIVE_TIMEOUT
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);

      // CACHE_ERROR
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);

      // SEND_TIMEOUT
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);

      // NO_INTERNET_CONNECTION
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);

      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // > success
  static const int NO_CONTNET = 201; // > success with no data
  static const int BAD_REQUEST = 400; // > failure, api rejected request
  static const int UNAUTHORISED = 401; // > failure, user not authorized
  static const int FORBIDDEN = 403; // > failure, api rejected request
  static const int NOT_FOUND = 200;
  static const int INTERNAL_SERVER_ERROR = 500;

  // > local status codes < //
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int CACHE_ERROR = -4;
  static const int SEND_TIMEOUT = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

// > response messages
class ResponseMessage {
  static const String SUCCESS = "Success";
  static const String NO_CONTNET = "Success";
  static const String BAD_REQUEST = "Bad Request, try again later";
  static const String UNAUTHORISED = "user is unauthorised";
  static const String FORBIDDEN = "Forbidden request, try again later";
  static const String NOT_FOUND = "not found";
  static const String INTERNAL_SERVER_ERROR =
      "internal server error, try again later";

  // > local response messages < //
  static const String CONNECT_TIMEOUT = "connection time out, try again later";
  static const String CANCEL = "canelled";
  static const String RECIEVE_TIMEOUT = "recieve time out, try again later";
  static const String CACHE_ERROR = "cache error, try again later";
  static const String SEND_TIMEOUT = "send time out, try again later";
  static const String NO_INTERNET_CONNECTION =
      "no internet connection, check your internet connection and try again";
  static const String DEFAULT = "default error";
}

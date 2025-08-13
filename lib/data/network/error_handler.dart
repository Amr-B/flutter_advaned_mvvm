// ignore_for_file: constant_identifier_names

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
  static const int UNKNOWN = -7;
}

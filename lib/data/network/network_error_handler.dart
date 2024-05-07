// ignore_for_file: deprecated_member_use, constant_identifier_names

import 'package:dio/dio.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/network/failure.dart';
import 'package:gradproject/presentation/ui/common/resources/strings_manager.dart';

class NetworkErrorHandler implements Exception {
  late Failure failure;

  NetworkErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleApiError(error); // handle
    } else {
      try {
        failure = error.getFailure();
      } catch (e) {
        failure = DataSource.none.getFailure();
      }
    }
  }
}

String serverErrorHandler(int errorCode) {
  switch (errorCode) {
    case ResponseCode.noContent:
      return ResponseMessage.noContent;
    case ResponseCode.badRequest:
      return ResponseMessage.badRequest;
    case ResponseCode.unauthorized:
      return ResponseMessage.unauthorized;
    // return DataSource.unauthorized.getFailure();
    // Failure(errorCode, ResponseMessage.unauthorized);
    case ResponseCode.forbidden:
      return ResponseMessage.forbidden;

    case ResponseCode.notFound:
      return ResponseMessage.notFound;

    case ResponseCode.serverSendError:
      return ResponseMessage.serverSendError;

    case ResponseCode.SSLCertificateError:
      return ResponseMessage.SSLCertificateError;

    case ResponseCode.internalServerError:
      return ResponseMessage.internalServerError;

    case ResponseCode.badGateway:
      return ResponseMessage.badGateway;
    default:
      return ResponseMessage.noContent;
  }
}

Failure _handleApiError(DioError error) {
  securePrint("_handleApiError");
  securePrint("error.response: ${error.response}");
  securePrint("error.type: ${error.type}");
  securePrint("error.response?.statusCode: ${error.response?.statusCode}");
  securePrint(
      "error.response?.statusMessage: ${error.response?.statusMessage}");
  switch (error.type) {
    case DioErrorType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        if (error.response?.statusCode == 409) {
          return Failure(error.response?.statusCode! ?? 0,
              error.response?.data["errorMessage"] ?? "");
        } else {
          final String handleResponse =
              serverErrorHandler(error.response!.statusCode!);
          return Failure(error.response!.statusCode!, handleResponse);
          // Failure(error.response?.statusCode! ?? 0,error.response?.statusMessage ?? "");
          // return
        }
      } else {
        return DataSource.none.getFailure();
      }
    case DioErrorType.connectionTimeout:
      return DataSource.connectionTimeOut.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.receiveTimeOut.getFailure();
    case DioErrorType.cancel:
      return DataSource.cancel.getFailure();
    case DioErrorType.connectionError:
      return DataSource.connectionError.getFailure();
    case DioErrorType.badCertificate:
      return DataSource.SSLCertificateError.getFailure();
    case DioErrorType.unknown:
      return DataSource.none.getFailure();
  }
}

enum DataSource {
  none,
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectionTimeOut,
  connectionError,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  SSLCertificateError,
  WifiAndMobileDataAreOff,
  CannotReachToTheServer;

  Failure getFailure() {
    switch (this) {
      case success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case connectionError:
        return Failure(ResponseCode.badGateway, ResponseMessage.badGateway);
      case SSLCertificateError:
        return Failure(ResponseCode.SSLCertificateError,
            ResponseMessage.SSLCertificateError);
      case badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case connectionTimeOut:
        return Failure(
            ResponseCode.connectionTimeOut, ResponseMessage.connectionTimeOut);
      case cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case receiveTimeOut:
        return Failure(
            ResponseCode.receiveTimeOut, ResponseMessage.receiveTimeOut);
      case sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case WifiAndMobileDataAreOff:
        return Failure(ResponseCode.wifiAndMobileDataAreOff,
            ResponseMessage.wifiAndMobileDataAreOff);
      case CannotReachToTheServer:
        return Failure(ResponseCode.cannotReachToTheServer,
            ResponseMessage.cannotReachToTheServer);

      case none:
        return Failure(ResponseCode.none, ResponseMessage.none);
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorized = 401; // failure, user is not authorized
  static const int forbidden = 403; //  failure, API rejected request
  static const int notFound = 404; // failure, Not found important
  static const int serverSendError = 409; // failure, Not found important
  static const int SSLCertificateError = 495; // failure, badCertificate
  static const int internalServerError = 500; // failure, crash in server side
  static const int badGateway = 502; // failure, connection error

  // local status code
  static const int none = -1; //
  static const int connectionTimeOut = -2; //
  static const int cancel = -3; //
  static const int receiveTimeOut = -4; //
  static const int sendTimeOut = -5; //
  static const int cacheError = -6; //
  static const int noInternetConnection = -7; //
  static const int wifiAndMobileDataAreOff = -8; //
  static const int cannotReachToTheServer = -9; //
  static const int patientNotFound = -10; //
  static const int deviceNotFound = -11; //
}

class ResponseMessage {
  static const String none = AppStrings.serverNotFound; //
  static const String success = AppStrings.success; // success with data
  static const String noContent =
      AppStrings.success; // success with no data (no content)
  static const String badRequest =
      AppStrings.badRequestError; // failure, API rejected request
  static const String unauthorized =
      AppStrings.unauthorizedError; // failure, user is not authorized
  static const String forbidden =
      AppStrings.forbiddenError; //  failure, API rejected request
  static const String notFound =
      AppStrings.internalServerError; // failure, crash in server side
  static const String internalServerError =
      AppStrings.notFoundError; // failure, crash in server side
  static const String badGateway =
      AppStrings.badGateway; // failure, connection error
  static const String SSLCertificateError =
      AppStrings.SSLCertificateError; // failure, connection error
  static const String serverSendError = AppStrings.serverSendError;
  // local status code
  static const String connectionTimeOut = AppStrings.timeoutError; //
  static const String cancel = AppStrings.defaultError; //
  static const String receiveTimeOut = AppStrings.timeoutError; //
  static const String sendTimeOut = AppStrings.timeoutError; //
  static const String cacheError = AppStrings.cacheError; //
  static const String noInternetConnection = AppStrings.noInternetError; //
  static const String wifiAndMobileDataAreOff =
      AppStrings.wifiAndMobileDataAreOff; //
  static const String cannotReachToTheServer =
      AppStrings.cannotReachToTheServer; //
  static const String patientNotFound = AppStrings.patientNotFound; //
  static const String deviceNotFound = AppStrings.deviceNotFound; //
}

class ApiInternalStatus {
  static const success = 0;
  static const failure = 1;
}

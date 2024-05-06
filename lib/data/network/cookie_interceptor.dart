// ignore_for_file: unused_import, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:gradproject/app/constants/network_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    securePrint("onResponse");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    securePrint("onError");
    securePrint("err: $err");
    securePrint("err.response: ${err.response}");
    securePrint("err.response?.statusCode: ${err.response?.statusCode}");
    securePrint("err.response?.statusMessage: ${err.response?.statusMessage}");
    securePrint("err path: ${err.requestOptions.path}");
    if (err.requestOptions.path != ServerPaths.loginPath) {
      securePrint("err: err.response?.statusCode: ${err.response?.statusCode}");
      if (err.response?.statusCode == 401) {
      } else {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    securePrint("onRequest");
    securePrint("data: ${options.data}");
    securePrint("baseUrl: ${options.baseUrl}");
    securePrint("path: ${options.path}");
    if (options.path != ServerPaths.loginPath) {
      // String cookie = DI.getItInstance<AppCache>().getCookie();
      // securePrint("cookie : $cookie");
      // options.headers['Cookie'] = cookie;
    }
    super.onRequest(options, handler);
  }
}

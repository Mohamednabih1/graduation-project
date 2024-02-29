import 'package:dio/dio.dart';
// import 'package:rimpulseandroidwatch/data/network/requests.dart';
// import 'package:rimpulseandroidwatch/data/network/rest_api/app_api.dart';
import 'package:gradproject/data/network/requests.dart';
import 'package:gradproject/data/network/rest_api/app_api.dart';

abstract class RemoteNetworkDataSource {
  Future<Response<Map<String, dynamic>>> login(LoginRequest loginRequest);
}

class RemoteNetworkDataSourceImpl implements RemoteNetworkDataSource {
  final RestClient _restClient;

  RemoteNetworkDataSourceImpl(this._restClient);
  @override
  Future<Response<Map<String, dynamic>>> login(
      LoginRequest loginRequest) async {
    return await _restClient.login(
        loginRequest.username, loginRequest.password);
  }
}

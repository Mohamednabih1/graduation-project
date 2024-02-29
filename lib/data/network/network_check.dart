import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gradproject/app/global_functions.dart';

abstract class NetworkInfo {
  Future<ConnectionState> get getConnectionState;
}

enum ConnectionState {
  WifiAndMobileDataAreOff,
  CannotReachToTheServer,
  ConnectionEstablished
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;
  NetworkInfoImpl(
    this._connectivity,
  );
  Future<ConnectionState> _isConnectedToTheServer() async {
    // try {
    // String url =
    //     DI.getItInstance<ServerRoutesManager>().serverRoutes.chosenServer;
    // url = "$url/rest/auth/check";
    // securePrint("url: $url");
    // final response =
    //     await http.get(Uri.parse(url)).timeout(const Duration(seconds: 40));
    // securePrint("checkConnectivity response: ${response.headers}");
    // if (response.statusCode == 200) {
    return ConnectionState.ConnectionEstablished;
    //   } else {
    //     return ConnectionState.CannotReachToTheServer;
    //   }
    // } catch (e) {
    //   securePrint("checkConnectivity error: $e");
    //   return ConnectionState.CannotReachToTheServer;
    // }
  }

  @override
  Future<ConnectionState> get getConnectionState async {
    ConnectivityResult connectivityResult =
        await (_connectivity.checkConnectivity());
    securePrint(
        "checkConnectivity: connectivityResult: $connectivityResult ...");
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.bluetooth:
        return await _isConnectedToTheServer();
      case ConnectivityResult.ethernet:
      case ConnectivityResult.none:
      case ConnectivityResult.vpn:
      case ConnectivityResult.other:
        return ConnectionState.WifiAndMobileDataAreOff;
    }
  }
}

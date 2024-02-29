import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/presentation/ui/common/snack_bar/snack_bar_manager.dart';

abstract class ConnectivityManager {
  void start();
  void dispose();
}

class ConnectivityManagerImpl implements ConnectivityManager {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void start() {
    _listenToConnectivity();
  }

  String _getConnectivityStateString(ConnectivityResult state) {
    String returnedString = "";
    switch (state) {
      case ConnectivityResult.bluetooth:
        returnedString = "Connected to Bluetooth.";
        break;
      case ConnectivityResult.wifi:
        returnedString = "Connected to Wi-Fi.";
        break;
      case ConnectivityResult.ethernet:
        returnedString = "Connected to Ethernet.";
        break;
      case ConnectivityResult.mobile:
        returnedString = "Connected to mobile data.";
        break;

      case ConnectivityResult.vpn:
        returnedString = "Connected to VPN.";
        break;

      case ConnectivityResult.other:
        returnedString = "Connected to unknown network.";
        break;
      case ConnectivityResult.none:
        returnedString = "Device not connected to any network.";
    }
    return returnedString;
  }

  void handleConnectivityState(ConnectivityResult state) {
    switch (state) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
        {
          // DI.connectionRestore();
          break;
        }
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.none:
      case ConnectivityResult.other:
        break;
    }
  }

  void _listenToConnectivity() {
    bool firstTime = true;
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((state) {
      if (firstTime) {
        firstTime = false;
      } else {
        securePrint("ConnectivityResult state: $state");
        DI
            .getItInstance<SnackBarManager>()
            .showTextSnackBar(_getConnectivityStateString(state));
        handleConnectivityState(state);
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
  }
}

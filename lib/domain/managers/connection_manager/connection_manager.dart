import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/presentation/ui/common/snack_bar/snack_bar_manager.dart';

abstract class ConnectionManager {
  void setConnectionState(ConnectionStateToServer state);
  ConnectionStateToServer get getConnectionState;
  void showConnectionStateToUserIfOffline();
  Stream<ConnectionStateToServer> get outputServerConnectionState;
}

enum ConnectionStateToServer { Online, Offline }

class ConnectionManagerImpl implements ConnectionManager {
  ConnectionStateToServer _connectionState = ConnectionStateToServer.Offline;
  final StreamController<ConnectionStateToServer> connectionStateSC =
      StreamController<ConnectionStateToServer>.broadcast();
  @override
  ConnectionStateToServer get getConnectionState => _connectionState;

  void _onlineStateHandler() {
    DI
        .getItInstance<SnackBarManager>()
        .showTextSnackBar("You are Online.", backgroundColor: Colors.green);
  }

  void _offlineStateHandler() {
    DI
        .getItInstance<SnackBarManager>()
        .showTextSnackBar("You are offline.", backgroundColor: Colors.red);
  }

  @override
  void setConnectionState(ConnectionStateToServer state) {
    _connectionState = state;
    print("[WatchConnectionState] state: $state");
    connectionStateSC.sink.add(state);
    switch (state) {
      case ConnectionStateToServer.Online:
        {
          _onlineStateHandler();
          break;
        }
      case ConnectionStateToServer.Offline:
        {
          _offlineStateHandler();
          break;
        }
    }
  }

  @override
  void showConnectionStateToUserIfOffline() {
    if (_connectionState == ConnectionStateToServer.Offline) {
      _offlineStateHandler();
    }
  }

  @override
  Stream<ConnectionStateToServer> get outputServerConnectionState =>
      connectionStateSC.stream;
}

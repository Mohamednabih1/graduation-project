import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart' as BS;
import 'package:permission_handler/permission_handler.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/presentation/ui/common/toast/toast_manager.dart';

abstract class BluetoothManager {
  Future<bool> checkDeviceBluetoothIsOn();
  Map<String, BluetoothDevice> get getDevices;
  Stream<BluetoothDevice?> get onGetNewDevice;
}

class BluetoothManagerImpl implements BluetoothManager {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  /// deviceMac : BluetoothDevice
  Map<String, BluetoothDevice> _devices = {};
  BluetoothDevice? connectedDevice;
  StreamController<_StreamDataType> _streamController =
      StreamController<_StreamDataType>();
  @override
  Future<bool> checkDeviceBluetoothIsOn() async {
    return await flutterBlue.isOn;
  }

  @override

  /// deviceMac : BluetoothDevice
  Map<String, BluetoothDevice> get getDevices => _devices;
  Future<void> startScanning() async {
    try {
      flutterBlue.stopScan();
    } catch (e) {}
    List<BluetoothDevice> scannedDevices = [];
    if (await checkDeviceBluetoothIsOn()) {
      if (await isPermissionEnabled()) {
        flutterBlue
            .scan(timeout: const Duration(seconds: 5))
            .listen((scanResult) {
          if (scanResult.device.name.isNotEmpty) {
            if (!_devices.containsKey(scanResult.device.id.id)) {
              _devices.addAll({scanResult.device.id.id: scanResult.device});
              _streamController.sink
                  .add(_StreamDataType(DataType.device, scanResult.device));
            }
          }
        }).onDone(() {});
      } else {
        ToastManager.showTextToast("Cant scan duo to Permission is disabled");
      }
    } else {
      ToastManager.showTextToast("Please open Bluetooth");
    }
  }

  Future<bool> isPermissionEnabled() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();

    securePrint(
        "statuses[Permission.bluetoothScan]!.isGranted: ${statuses[Permission.bluetoothScan]!.isGranted}");
    securePrint(
        "statuses[Permission.bluetoothConnect]!.isGranted: ${statuses[Permission.bluetoothConnect]!.isGranted}");
    securePrint(
        "statuses[Permission.bluetooth]!.isGranted: ${statuses[Permission.bluetooth]!.isGranted}");
    securePrint(
        "statuses[Permission.location]!.isGranted: ${statuses[Permission.location]!.isGranted}");

    if (statuses[Permission.bluetoothScan]!.isDenied) {
      permissionDenied();
      return false;
    } else if (statuses[Permission.bluetoothConnect]!.isDenied) {
      permissionDenied();
      return false;
    } else {
      return true;
    }
  }

  void permissionDenied() async {
    await openAppSettings();
  }

  void connectToDevice(BluetoothDevice device) async {
    if (await isPermissionEnabled()) {
      try {
        await device.connect(timeout: const Duration(seconds: 10));
        try {
          var connection =
              await BS.BluetoothConnection.toAddress("${device.id}");
          ToastManager.showTextToast("$connection");
        } catch (e) {}

        connectedDevice = device;
        ToastManager.showTextToast('$connectedDevice');
      } catch (e) {
        ToastManager.showTextToast('Error connecting to device: $e');
      }
    }
  }

  @override
  Stream<BluetoothDevice?> get onGetNewDevice =>
      _streamController.stream.map((event) {
        if (event.dataType == DataType.device) {
          return event.data as BluetoothDevice;
        }
      });
}

enum DataType {
  device,
  connectionState,
}

class _StreamDataType {
  dynamic data;
  DataType dataType;
  _StreamDataType(this.dataType, data);
}

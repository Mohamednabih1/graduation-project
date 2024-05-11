// ignore_for_file: unused_import
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:gradproject/domain/managers/fireBase/fireBase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradproject/app/global_functions.dart';

import 'package:gradproject/presentation/ui/common/snack_bar/snack_bar_manager.dart';
import '../data/shared_preferences.dart';

final _instance = GetIt.instance;

class DI {
  static GetIt get getItInstance => _instance;

  static Future<void> initAppModule() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (!getItInstance.isRegistered<SharedPreferences>()) {
      getItInstance
          .registerLazySingleton<AppCache>(() => AppCache(sharedPreferences));
    }
    // repository
    getItInstance
        .registerLazySingleton<FireBaseManger>(() => FireBaseMangerImpl());
  }
}

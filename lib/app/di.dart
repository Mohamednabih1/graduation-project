import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/data_source/remote_data_source/remote_network_data_source.dart';
import 'package:gradproject/data/network/dio_factory.dart';
import 'package:gradproject/data/network/network_check.dart';
import 'package:gradproject/data/network/rest_api/app_api.dart';
import 'package:gradproject/data/repository/repository_impl.dart';
import 'package:gradproject/domain/managers/bluetooth_manager/bluetooth_manager.dart';
import 'package:gradproject/domain/managers/connection_manager/connection_manager.dart';
import 'package:gradproject/domain/repository/repository.dart';
import 'package:gradproject/domain/usecase/login_usecase.dart';
import 'package:gradproject/presentation/ui/common/snack_bar/snack_bar_manager.dart';

import '../data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';

final _instance = GetIt.instance;

class DI {
  static GetIt get getItInstance => _instance;

  static Future<void> initAppModule() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (!getItInstance.isRegistered<SharedPreferences>()) {
      getItInstance
          .registerLazySingleton<AppCache>(() => AppCache(sharedPreferences));
    }
    if (getItInstance.isRegistered<DioFactory>()) {
      await getItInstance.unregister<DioFactory>();
      await getItInstance.unregister<RestClient>();
      await getItInstance.unregister<RemoteNetworkDataSource>();
      await getItInstance.unregister<Repository>();
      await getItInstance.unregister<NetworkInfo>();
      await getItInstance.unregister<SnackBarManager>();
      await getItInstance.unregister<LoginUseCase>();
    }

    String serverUrl = "http://192.168.1.22:8080/HI_GF";
    securePrint("serverUrl: $serverUrl");

    // dio factory
    getItInstance.registerLazySingleton<DioFactory>(() => DioFactory());
    // app service client
    final dio = await getItInstance<DioFactory>().getDio;

    getItInstance.registerLazySingleton<RestClient>(
        () => RestClient(dio, baseUrl: serverUrl));

    // remote data source
    getItInstance.registerLazySingleton<RemoteNetworkDataSource>(
        () => RemoteNetworkDataSourceImpl(getItInstance<RestClient>()));

    // repository
    getItInstance.registerLazySingleton<Repository>(
      () => RepositoryImpl(
        getItInstance<RemoteNetworkDataSource>(),
      ),
    );
    getItInstance.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(getItInstance<Repository>()));

    final AppCache appPreferences = getItInstance<AppCache>();
    await appPreferences.initUserData();
    getItInstance.registerLazySingleton<ConnectionManager>(
        () => ConnectionManagerImpl());

    getItInstance
        .registerLazySingleton<BluetoothManager>(() => BluetoothManagerImpl());
  }
}

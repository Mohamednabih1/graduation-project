// import 'package:pulse_app/App/constants.dart';
// import 'package:pulse_app/domain/classes_from_data.dart/patient/patient_class.dart';
// import 'package:pulse_app/data/network/network_error_handler.dart';
// import 'package:pulse_app/domain/classes_from_data.dart/classes.dart';
// import 'package:rimpulseandroidwatch/app/constants/global_constants.dart';

// abstract class TemporaryLocalDataSource {
//   void saveUserData(Authentication userData);
//   Authentication getUserData();

//   void savePatientList(List<Patient> patientList);
//   List<Patient> getPatientList();

//   void saveDevices(List<Device> deviceList);
//   List<Device> getDevices();

//   void saveStaff(List<Staff> staffList);
//   List<Staff> getStaff();

//   void saveLiveMonitorConfigurationData(
//       LiveMonitorConfiguration liveMonitorConfiguration);
//   LiveMonitorConfiguration getLiveMonitorConfigurationData();

//   void clearCache();
//   void removeFromCache(CacheKeys key);
// }

// enum CacheKeys {
//   PatientList,
//   Staff,
//   Devices,
//   UserData,
//   LiveMonitorConfiguration
// }

// class _CacheItemsInterval {
//   static const patientList = Constants.defaultCacheInterval;
//   static const staff = Constants.defaultCacheInterval;
//   static const devices = Constants.defaultCacheInterval;
//   static const userData = Constants.defaultCacheInterval;
//   static const liveMonitorConfiguration = Constants.defaultCacheInterval;
// }

// int _getCacheInterval(CacheKeys key) {
//   switch (key) {
//     case CacheKeys.PatientList:
//       return _CacheItemsInterval.patientList;
//     case CacheKeys.Staff:
//       return _CacheItemsInterval.staff;
//     case CacheKeys.Devices:
//       return _CacheItemsInterval.devices;
//     case CacheKeys.UserData:
//       return _CacheItemsInterval.userData;
//     case CacheKeys.LiveMonitorConfiguration:
//       return _CacheItemsInterval.liveMonitorConfiguration;
//   }
// }

// class TemporaryLocalDataSourceImpl implements TemporaryLocalDataSource {
//   // run time cache
//   final Map<CacheKeys, CachedItem> _cacheMap = {};

//   void _saveToCache(CacheKeys key, CachedItem item) => _cacheMap[key] = item;

//   T _getData<T>(CacheKeys key) {
//     CachedItem? cachedItem = _cacheMap[key];
//     if (cachedItem != null && cachedItem.isValid(_getCacheInterval(key))) {
//       // return the response from cache
//       return cachedItem.data as T;
//     } else {
//       // return an error that cache is not there or its not valid
//       throw NetworkErrorHandler.handle(DataSource.cacheError);
//     }
//   }

//   @override
//   // HomeResponse getHomeData() => _getData<HomeResponse>(CacheKeys.home);

//   @override
//   // void saveHomeToCache(HomeResponse homeResponse) => _saveToCache(CacheKeys.home, CachedItem(homeResponse));
//   @override
//   void saveDevices(List<Device> deviceList) =>
//       _saveToCache(CacheKeys.Devices, CachedItem(deviceList));

//   @override
//   void saveLiveMonitorConfigurationData(
//           LiveMonitorConfiguration liveMonitorConfiguration) =>
//       _saveToCache(CacheKeys.LiveMonitorConfiguration,
//           CachedItem(liveMonitorConfiguration));

//   @override
//   void savePatientList(List<Patient> patientList) =>
//       _saveToCache(CacheKeys.PatientList, CachedItem(patientList));

//   @override
//   void saveStaff(List<Staff> staffList) =>
//       _saveToCache(CacheKeys.Staff, CachedItem(staffList));

//   @override
//   void saveUserData(Authentication userData) =>
//       _saveToCache(CacheKeys.UserData, CachedItem(userData));

//   @override
//   void clearCache() => _cacheMap.clear();

//   @override
//   void removeFromCache(CacheKeys key) => _cacheMap.remove(key);

//   @override
//   List<Device> getDevices() => _getData<List<Device>>(CacheKeys.Devices);

//   @override
//   LiveMonitorConfiguration getLiveMonitorConfigurationData() =>
//       _getData<LiveMonitorConfiguration>(CacheKeys.LiveMonitorConfiguration);

//   @override
//   List<Patient> getPatientList() =>
//       _getData<List<Patient>>(CacheKeys.PatientList);

//   @override
//   List<Staff> getStaff() => _getData<List<Staff>>(CacheKeys.Staff);

//   @override
//   Authentication getUserData() => _getData<Authentication>(CacheKeys.UserData);
// }

// class CachedItem {
//   dynamic data;
//   int cacheTime = DateTime.now().millisecondsSinceEpoch;
//   CachedItem(this.data);
// }

// extension CachedItemExtension on CachedItem {
//   bool isValid(int expirationTime) {
//     int currentTime = DateTime.now().millisecondsSinceEpoch;
//     bool returnValue = (currentTime - cacheTime) <= expirationTime;
//     return returnValue;
//   }
// }

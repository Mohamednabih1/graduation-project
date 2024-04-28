import 'package:shared_preferences/shared_preferences.dart';

class AppCacheKeys {
  static const darkMode = "darkMode";
  static const isUserLoggedIn = "isUserLoggedIn";
  static const userID = "userID";
  static const userName = "username";
  static const userEmail = "userEmail";
  static const password = "password";
  static const userHeight = "userHeight";
  static const userWeight = "userWeight";
  static const userAge = "userAge";
  static const userGender = "userGender";
  static const userPhoneNum = "userPhoneNum";
  static const isOpenedOnce = "isOpenedOnce";
  static const isUserPatient = "isUserPatient";
}

class AppCache {
  final SharedPreferences _sharedPreferences;
  AppCache(this._sharedPreferences);

  Future<void> setUserId(int userID) async =>
      await _sharedPreferences.setInt(AppCacheKeys.userID, userID);

  Future<void> setUserName(String userName) async =>
      await _sharedPreferences.setString(AppCacheKeys.userName, userName);

  Future<void> setDarkMode(bool darkMode) async =>
      await _sharedPreferences.setBool(AppCacheKeys.darkMode, darkMode);

  Future<void> setIsOpenedOnce(bool isOpenedOnce) async =>
      await _sharedPreferences.setBool(AppCacheKeys.isOpenedOnce, isOpenedOnce);

  void setIsUserLoggedIn(bool value) =>
      _sharedPreferences.setBool(AppCacheKeys.isUserLoggedIn, value);

  void setUserHeight(String value) =>
      _sharedPreferences.setString(AppCacheKeys.userHeight, value);

  void setUserPhoneNum(String value) =>
      _sharedPreferences.setString(AppCacheKeys.userPhoneNum, value);

  void setUserWeight(String value) =>
      _sharedPreferences.setString(AppCacheKeys.userWeight, value);

  void setUserAge(String value) =>
      _sharedPreferences.setString(AppCacheKeys.userAge, value);

  void setUserEmail(String value) =>
      _sharedPreferences.setString(AppCacheKeys.userEmail, value);

  void setUserPassword(String value) =>
      _sharedPreferences.setString(AppCacheKeys.password, value);

  void setIsUserPatient(bool value) =>
      _sharedPreferences.setBool(AppCacheKeys.isUserPatient, value);

  void setUserGender(String value) =>
      _sharedPreferences.setString(AppCacheKeys.userGender, value);
// end of set
  int get getUserId => _sharedPreferences.getInt(AppCacheKeys.userID) ?? -1;

  bool get getDarkMode =>
      _sharedPreferences.getBool(AppCacheKeys.darkMode) ?? false;

  bool getIsUserLoggedIn() =>
      _sharedPreferences.getBool(AppCacheKeys.isUserLoggedIn) ?? false;

  String getUsername() =>
      _sharedPreferences.getString(AppCacheKeys.userName) ?? "";

  String getPassword() =>
      _sharedPreferences.getString(AppCacheKeys.password) ?? "";

  bool getIsOpenedOnce() =>
      _sharedPreferences.getBool(AppCacheKeys.isOpenedOnce) ?? false;

  String getUserEmail() =>
      _sharedPreferences.getString(AppCacheKeys.userEmail) ?? "";

  String getUserHeight() =>
      _sharedPreferences.getString(AppCacheKeys.userHeight) ?? "";

  String getUserWeight() =>
      _sharedPreferences.getString(AppCacheKeys.userWeight) ?? "";

  String getUserAge() =>
      _sharedPreferences.getString(AppCacheKeys.userAge) ?? "";

  String getUserPhoneNum() =>
      _sharedPreferences.getString(AppCacheKeys.userPhoneNum) ?? "";

  String getUserGender() =>
      _sharedPreferences.getString(AppCacheKeys.userGender) ?? "";

  bool getIsUserPatient() =>
      _sharedPreferences.getBool(AppCacheKeys.isUserPatient) ?? false;

  setUserData({
    required int userID,
    required String username,
    required String password,
    required String email,
    required String phoneNum,
    required String age,
    required String weight,
    required String height,
    required String gender,
    required String role,
  }) {
    setUserId(userID);
    setUserName(username);
    setUserPassword(password);
    setUserEmail(email);
    setUserPhoneNum(phoneNum);
    setUserAge(age);
    setUserWeight(weight);
    setUserHeight(height);
    setUserGender(gender);
    if (role == "patient") {
      setIsUserPatient(true);
    } else {
      setIsUserPatient(false);
    }
  }

  void logOutUser() {
    _sharedPreferences.remove(AppCacheKeys.userName);
    _sharedPreferences.remove(AppCacheKeys.password);
    _sharedPreferences.remove(AppCacheKeys.isOpenedOnce);
    _sharedPreferences.remove(AppCacheKeys.userAge);
    _sharedPreferences.remove(AppCacheKeys.userHeight);
    _sharedPreferences.remove(AppCacheKeys.userWeight);
    _sharedPreferences.remove(AppCacheKeys.userID);
    _sharedPreferences.remove(AppCacheKeys.userEmail);
    _sharedPreferences.remove(AppCacheKeys.password);
    _sharedPreferences.remove(AppCacheKeys.userPhoneNum);
    _sharedPreferences.remove(AppCacheKeys.isUserLoggedIn);
  }
}

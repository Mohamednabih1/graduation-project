// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/presentation/ui/common/base/base_view_model.dart';
import 'package:go_router/go_router.dart';

class ProfileViewModel extends BaseViewModel with ChangeNotifier {
  //example of functions
  // void logOut(BuildContext ctx) {
  //   DI.getItInstance<AppCache>().setIsUserLoggedIn(false);
  //   ctx.pushReplacementNamed(RoutesName.splash);
  // }

  late final AppCache _sharedPreferences;
  late final String username;
  late final String email;
  late final String password;
  late final String gender;
  late final String height;
  late final String weight;
  late final String phoneNum;
  late final String age;

  void logOut() {
    _sharedPreferences.setUserName("");
    _sharedPreferences.setUserEmail("");
    _sharedPreferences.setUserPassword("");
    _sharedPreferences.setUserGender("");
    _sharedPreferences.setUserHeight("");
    _sharedPreferences.setUserWeight("");
    _sharedPreferences.setUserPhoneNum("");
    _sharedPreferences.setUserAge("");
    _sharedPreferences.setIsUserLoggedIn(false);
  }

  @override
  void start() {
    _sharedPreferences = DI.getItInstance<AppCache>();
    username = _sharedPreferences.getUsername();
    email = _sharedPreferences.getUserEmail();
    password = _sharedPreferences.getPassword();
    gender = _sharedPreferences.getUserGender();
    height = _sharedPreferences.getUserHeight();
    weight = _sharedPreferences.getUserWeight();
    phoneNum = _sharedPreferences.getUserPhoneNum();
    age = _sharedPreferences.getUserAge();
  }
}

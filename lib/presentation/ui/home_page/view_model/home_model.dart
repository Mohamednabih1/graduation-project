import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/data/shared_preferences.dart';
import 'package:gradproject/presentation/ui/common/base/base_view_model.dart';

class HomeViewModel extends BaseViewModel with ChangeNotifier {
  late final AppCache sharedPreferences;
  late final String username;
  late final String email;
  late final String password;
  late final String gender;
  late final String height;
  late final String weight;
  late final String phoneNum;
  late final String age;
  late final bool isUserPatient;

  void logOut(BuildContext ctx) {
    sharedPreferences.setIsUserLoggedIn(false);
    ctx.pushReplacementNamed(RoutesName.splash);
  }

  void onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  @override
  void start() {
    sharedPreferences = DI.getItInstance<AppCache>();

    username = sharedPreferences.getUsername();
    email = sharedPreferences.getUserEmail();
    password = sharedPreferences.getPassword();
    gender = sharedPreferences.getUserGender();
    height = sharedPreferences.getUserHeight();
    weight = sharedPreferences.getUserWeight();
    phoneNum = sharedPreferences.getUserPhoneNum();
    age = sharedPreferences.getUserAge();
    isUserPatient = sharedPreferences.getIsUserPatient();
  }
}

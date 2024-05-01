import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/domain/classes/user.dart';
import 'package:gradproject/domain/managers/fireBase/fireBase.dart';
import 'package:gradproject/presentation/ui/common/base/base_view_model.dart';

class DrHPageViewModel extends BaseViewModel with ChangeNotifier {
  late final AppCache _sharedPreferences;
  late final String username;
  late final String email;
  late final String password;
  late final String gender;
  late final String height;
  late final String weight;
  late final String phoneNum;
  late final String age;
  late final Future<List<UserData>> users;
  late final FireBaseManger fireBaseManger;

  void logOut(BuildContext ctx) {
    _sharedPreferences.setIsUserLoggedIn(false);
    ctx.pushReplacementNamed(RoutesName.splash);
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
    fireBaseManger = DI.getItInstance<FireBaseManger>();
    users = fireBaseManger.getAllUserData();
    //  users = [
    //   UserData(
    //       username: "orsa1",
    //       id: "1",
    //       email: "orsa.so@salamtk.com",
    //       password: "123password",
    //       gender: "male",
    //       height: "180",
    //       weight: "180",
    //       phoneNum: "0123",
    //       age: "20",
    //       role: "doctor"),
    //   UserData(
    //       username: "orsa2",
    //       id: "2",
    //       email: "orsa.so@salamtk.com",
    //       password: "123password",
    //       gender: "female",
    //       height: "180",
    //       weight: "180",
    //       phoneNum: "0123",
    //       age: "20",
    //       role: "doctor"),
    //   UserData(
    //       username: "orsa3",
    //       id: "3",
    //       email: "orsa.so@salamtk.com",
    //       password: "123password",
    //       gender: "male",
    //       height: "180",
    //       weight: "180",
    //       phoneNum: "0123",
    //       age: "20",
    //       role: "doctor"),
    //   UserData(
    //       username: "orsa4",
    //       id: "4",
    //       email: "orsa.so@salamtk.com",
    //       password: "123password",
    //       gender: "female",
    //       height: "180",
    //       weight: "180",
    //       phoneNum: "0123",
    //       age: "20",
    //       role: "doctor"),
    //   UserData(
    //       username: "orsa5",
    //       id: "5",
    //       email: "orsa.so@salamtk.com",
    //       password: "123password",
    //       gender: "male",
    //       height: "180",
    //       weight: "180",
    //       phoneNum: "0123",
    //       age: "20",
    //       role: "doctor"),
    // ];
  }
}

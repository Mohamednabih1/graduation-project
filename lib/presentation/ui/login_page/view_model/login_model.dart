import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/domain/classes/user.dart';
import 'package:gradproject/domain/managers/fireBase/fireBase.dart';
import 'package:gradproject/presentation/ui/common/base/base_view_model.dart';
import 'package:gradproject/presentation/ui/common/toast/toast_manager.dart';

class LoginViewModel extends BaseViewModel with ChangeNotifier {
  final AppCache _appPreferences = DI.getItInstance<AppCache>();
  String email = '';
  String password = '';

  void setUserName(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }

  void goToSignUp(BuildContext context) {
    context.pushNamed(RoutesName.signUp);
  }


  Future<void> login(BuildContext context) async {
    securePrint("hello");
    if (isValidInput()) {
      securePrint("[login] username : $email ");
      securePrint("[login] password : $password ");
      FireBaseManger fireBaseManger = DI.getItInstance<FireBaseManger>();
      User? user = await fireBaseManger.loginUsingEmailPassword(
          email: email, password: password, ctx: context);
      if (user != null) {
        _appPreferences.setIsUserLoggedIn(true);

        List<UserData> users = await fireBaseManger.getAllUserData();

        securePrint(users);

        UserData? loginUserData = findByEmail(users, email);
        if (loginUserData != null) {
          _appPreferences.setUserData(
            userID: 1,
            username: loginUserData.username,
            password: loginUserData.password,
            email: loginUserData.email,
            phoneNum: loginUserData.phoneNum,
            age: loginUserData.age,
            weight: loginUserData.weight,
            gender: loginUserData.gender,
            height: loginUserData.height,
            role: loginUserData.role,
          );
          if (loginUserData.role == "patient") {
            context.pushReplacementNamed(RoutesName.home);
          } else {
            context.pushReplacementNamed(RoutesName.rtc);
          }
        }
      } else {
        ToastManager.showTextToast("wrong username or password");
      }
    } else {
      ToastManager.showTextToast("please enter username and password");
    }
  }

  bool isValidInput() {
    return email.isNotEmpty && password.isNotEmpty;
  }

  @override
  void start() {}
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/managers/fireBase/fireBase.dart';
import 'package:gradproject/presentation/ui/common/toast/toast_manager.dart';

class SignUpViewModel extends ChangeNotifier {
  String username = '';
  String password = '';
  String email = '';
  String phoneNum = '';
  String weight = '';
  String height = '';
  String age = '';
  String gender = '';

  void setUserName(String value) {
    username = value;
  }

  void setPassword(String value) {
    password = value;
  }

  void setEmail(String value) {
    email = value;
  }

  void setPhoneNum(String value) {
    phoneNum = value;
  }

  void setWeight(String value) {
    weight = value;
  }

  void setHeight(String value) {
    height = value;
  }

  void setAge(String value) {
    age = value;
  }

  void setGender(String value) {
    gender = value;
    securePrint(gender);
  }

  Future<void> signUp(BuildContext context) async {
    if (dataValidInput()) {
      FireBaseManger fireBaseManger = DI.getItInstance<FireBaseManger>();

      securePrint("[login] username : $email ");
      securePrint("[login] password : $password ");

      await fireBaseManger.signUpWithUserAndPassword(
        email: email,
        password: password,
        ctx: context,
      );
      ToastManager.showTextToast("sign up successfully");
      await addUserData(fireBaseManger);

      // ignore: use_build_context_synchronously
      context.pop();
    } else {
      ToastManager.showTextToast("please enter all fields");
    }
  }

  Future<void> addUserData(FireBaseManger fireBaseManger) async {
    securePrint("[signUp] username : $username ");
    securePrint("[signUp] password : $password ");
    securePrint("[signUp] email : $email ");
    securePrint("[signUp] phoneNum : $phoneNum ");
    securePrint("[signUp] age : $age ");
    securePrint("[signUp] weight : $weight ");
    securePrint("[signUp] height : $height ");

    fireBaseManger.addUserData(
      username: username,
      password: password,
      email: email,
      phoneNum: phoneNum,
      age: age,
      weight: weight,
      height: height,
      gender: gender,
    );
  }

  bool dataValidInput() {
    return email.isNotEmpty &&
        phoneNum.isNotEmpty &&
        age.isNotEmpty &&
        weight.isNotEmpty &&
        username.isNotEmpty &&
        password.isNotEmpty &&
        gender.isNotEmpty &&
        height.isNotEmpty;
  }

  void start() {}
}

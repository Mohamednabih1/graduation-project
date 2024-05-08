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
  List<UserData> users = [];
  List<UserData> originalList = [];
  List<UserData> patientList = [];
  List<UserData> doctorList = [];
  late final FireBaseManger fireBaseManger;

  void logOut(BuildContext ctx) {
    _sharedPreferences.setIsUserLoggedIn(false);
    ctx.pushReplacementNamed(RoutesName.splash);
  }

  void sortList(String type) {
    switch (type) {
      case "Patient":
        users = patientList;
        notifyListeners();
        break;
      case "Doctor":
        users = doctorList;
        notifyListeners();
        break;
      case "All":
        users = originalList;
        notifyListeners();
        break;
      default:
    }
  }

  void getUsers() async {
    originalList = users = await fireBaseManger.getAllUserData();
    doctorList = users.where((user) => user.role == 'Doctor').toList();
    patientList = users.where((user) => user.role == 'patient').toList();
    notifyListeners();
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
    getUsers();
  }

}

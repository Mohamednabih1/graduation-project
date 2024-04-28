import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/presentation/ui/common/base/base_view_model.dart';

class DrHPageViewModel extends BaseViewModel with ChangeNotifier {
  late final AppCache _sharedPreferences;
  late final String username;
  late final String email;
  late final String password;

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
  }
}
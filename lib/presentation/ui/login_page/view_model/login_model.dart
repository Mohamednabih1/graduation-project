import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/domain/managers/fireBase/fireBase.dart';
import 'package:gradproject/presentation/ui/common/base/base_view_model.dart';
import 'package:gradproject/presentation/ui/common/toast/toast_manager.dart';

class LoginViewModel extends BaseViewModel with ChangeNotifier {
  final AppCache _appPreferences = DI.getItInstance<AppCache>();
  String username = '';
  String password = '';

  void setUserName(String value) {
    username = value;
  }

  void setPassword(String value) {
    password = value;
  }

  Future<void> login(BuildContext context) async {
    securePrint("hello");
    if (isValidInput()) {
      securePrint("[login] username : $username ");
      securePrint("[login] password : $password ");
      FireBaseManger fireBaseManger = DI.getItInstance<FireBaseManger>();
      User? user = await fireBaseManger.loginUsingEmailPassword(
          email: username, password: password, ctx: context);
      if (user != null) {
        // ignore: use_build_context_synchronously
        _appPreferences.setIsUserLoggedIn(true);
        context.pushReplacementNamed(RoutesName.home);
      } else {
        ToastManager.showTextToast("wrong username or password");
      }
      // (await DI
      //         .getItInstance<LoginUseCase>()
      //         .execute(LoginRequest(username.trim(), password.trim())))
      //     .fold(
      //   (left) {
      //     securePrint("left response: $left");
      //     dismissDialog(context);
      //     ErrorState(
      //             stateRendererType: StateRendererType.popupErrorState,
      //             message: left.message)
      //         .showPopup(context);
      //   },
      //   (right) async {
      //     dismissDialog(context);
      //     context.pushReplacementNamed(RoutesName.home);
      //   },
      // );
    }
  }

  bool isValidInput() {
    return username.isNotEmpty && password.isNotEmpty;
  }

  @override
  void start() {}
}

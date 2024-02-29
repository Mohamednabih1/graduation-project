import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/data/network/requests.dart';
import 'package:gradproject/domain/usecase/login_usecase.dart';
import 'package:gradproject/presentation/ui/common/state_renderer/state_renderer.dart';
import 'package:gradproject/presentation/ui/common/state_renderer/state_renderer_impl.dart';
import 'package:gradproject/presentation/ui/common/base/base_view_model.dart';

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
    // context.pushReplacementNamed(RoutesName.home);

    if (isValidInput()) {
      securePrint("[login] username : $username ");
      securePrint("[login] password : $password ");

      (await DI
              .getItInstance<LoginUseCase>()
              .execute(LoginRequest(username.trim(), password.trim())))
          .fold(
        (left) {
          securePrint("left response: $left");
          dismissDialog(context);
          ErrorState(
                  stateRendererType: StateRendererType.popupErrorState,
                  message: left.message)
              .showPopup(context);
        },
        (right) async {
          _appPreferences.setIsUserLoggedIn(true);
          dismissDialog(context);
          context.pushReplacementNamed(RoutesName.home);
          // DI.initMainViewModel();
          // _appPreferences.setIsUserLoggedIn(true);
          // // navigate to home screen
        },
      );
    }
  }

  bool isValidInput() {
    return username.isNotEmpty && password.isNotEmpty;
  }

  @override
  void start() {}
}

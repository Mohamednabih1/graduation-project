import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/network/requests.dart';
import 'package:gradproject/domain/usecase/login_usecase.dart';
import 'package:gradproject/presentation/ui/common/state_renderer/state_renderer.dart';
import 'package:gradproject/presentation/ui/common/state_renderer/state_renderer_impl.dart';

class SignUpViewModel extends ChangeNotifier {
  String username = '';
  String password = '';

  void setUserName(String value) {
    username = value;
  }

  void setPassword(String value) {
    password = value;
  }

  Future<void> signUp(BuildContext context) async {
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
          context.pushReplacementNamed(RoutesName.splash);
        },
      );
    }
  }

  bool isValidInput() {
    // Implement your validation logic here (e.g., length check, regex, etc.)
    return username.isNotEmpty && password.isNotEmpty;
  }

  void start() {}
}

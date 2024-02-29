import 'package:flutter/material.dart';

import 'package:gradproject/presentation/navigation/app_router.dart';

class SnackBarManager {
  void _removeCurrentSnackBar() {
    if (ScaffoldMessenger.of(navigatorKey.currentContext!).mounted) {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .removeCurrentSnackBar();
    }
  }

  void showTextSnackBar(String text, {Color? backgroundColor}) {}

  bool get isAppActive {
    return navigatorKey.currentContext != null;
  }

  void showWidgetSnackBar(Widget child) {}
}

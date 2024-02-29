import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/common/resources/strings_manager.dart';
import 'package:gradproject/presentation/ui/common/resources/values_manager.dart';
import 'package:gradproject/presentation/ui/common/state_renderer/state_renderer.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
  void showPopup(
    BuildContext context, {
    double height = AppSizeConstants.s100,
    double width = AppSizeConstants.s100,
    Function? tryAgain,
  });
}

/// Loading state (popup, full screen)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState(
      {required this.stateRendererType, this.message = AppStrings.loading});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  void showPopup(
    BuildContext context, {
    double height = AppSizeConstants.s40,
    double width = AppSizeConstants.s40,
    Function? tryAgain,
  }) {
    _showPopup(
      context,
      getStateRendererType(),
      getMessage(),
      height: height,
      width: width,
      tryAgain: tryAgain,
    );
  }
}

/// Error state (popup, full screen)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState({required this.stateRendererType, required this.message});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  void showPopup(
    BuildContext context, {
    double height = AppSizeConstants.s100,
    double width = AppSizeConstants.s100,
    Function? tryAgain,
  }) {
    _showPopup(context, getStateRendererType(), getMessage(),
        height: height, width: width, tryAgain: tryAgain);
  }
}

/// Error state (popup, full screen)
class SuccessState extends FlowState {
  String message;

  SuccessState([this.message = AppStrings.success]);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.popupSuccessState;

  @override
  void showPopup(
    BuildContext context, {
    double height = AppSizeConstants.s100,
    double width = AppSizeConstants.s100,
    Function? tryAgain,
  }) {
    _showPopup(context, getStateRendererType(), getMessage(),
        height: height, width: width, tryAgain: tryAgain);
  }
}

/// Content state ( full screen)
// class ContentState extends FlowState {
//   ContentState();

//   @override
//   String getMessage() => Constants.empty;

//   @override
//   StateRendererType getStateRendererType() => StateRendererType.contentState;

//   @override
//   void showDialog(BuildContext context) {
//     showPopup(context, getStateRendererType(), getMessage());
//   }
// }

/// Empty state (popup, full screen)
class EmptyState extends FlowState {
  String message;
  EmptyState({required this.message});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;

  @override
  void showPopup(
    BuildContext context, {
    double height = AppSizeConstants.s100,
    double width = AppSizeConstants.s100,
    Function? tryAgain,
  }) {
    _showPopup(context, getStateRendererType(), getMessage(),
        height: height, width: width, tryAgain: tryAgain);
  }
}

extension FlowStateExtension on FlowState {
  // Widget getScreenWidget(BuildContext context, Widget contentScreenWidget, Function retryActionFunction) {
  //   switch (runtimeType) {
  //     case LoadingState:
  //       {
  //         if (getStateRendererType() == StateRendererType.popupLoadingState) {
  //           // show popup loading dialog
  //           // _showPopup(context, getStateRendererType(), getMessage());
  //           // show content ui of the screen
  //           return contentScreenWidget;
  //         } else {
  //           return StateRenderer(
  //               stateRendererType: getStateRendererType(),
  //               message: getMessage(),
  //               retryAction: retryActionFunction);
  //         }
  //       }

  //     case ErrorState:
  //       {
  //         dismissDialog(context);
  //         securePrint("ErrorState");
  //         if (getStateRendererType() == StateRendererType.popupErrorState) {
  //           // show popup loading dialog
  //           // _showPopup(context, getStateRendererType(), getMessage());
  //           // show content ui of the screen
  //           return contentScreenWidget;
  //         } else {
  //           return StateRenderer(
  //               stateRendererType: getStateRendererType(),
  //               message: getMessage(),
  //               retryAction: retryActionFunction);
  //         }
  //       }
  //     case SuccessState:
  //       {
  //         dismissDialog(context);
  //         // if (getStateRendererType() == StateRendererType.popupSuccessState) {
  //         // show popup loading dialog
  //         // _showPopup(context, getStateRendererType(), getMessage(), title: AppStrings.success);
  //         // show content ui of the screen
  //         return contentScreenWidget;
  //         // }
  //         //  else {
  //         //   return StateRenderer(
  //         //       stateRendererType: getStateRendererType(),
  //         //       message: getMessage(),
  //         //       retryAction: retryActionFunction);
  //         // }
  //       }
  //     case EmptyState:
  //       {
  //         return StateRenderer(
  //             stateRendererType: getStateRendererType(),
  //             message: getMessage(),
  //             retryAction: retryActionFunction);
  //       }
  //     // case ContentState:
  //     //   {
  //     //     dismissDialog(context);
  //     //     return contentScreenWidget;
  //     //   }
  //     default:
  //       {
  //         dismissDialog(context);
  //         return contentScreenWidget;
  //       }
  //   }
  // }

  _showPopup(
    BuildContext context,
    StateRendererType stateRendererType,
    String message, {
    required double width,
    required double height,
    String title = "",
    Function? tryAgain,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (BuildContext context) => StateRenderer(
              stateRendererType: stateRendererType,
              message: message,
              title: title,
              retryAction: tryAgain ?? () {},
              width: width,
              height: height),
        ));
  }
}

bool isCurrentDialogShowing(BuildContext context) =>
    ModalRoute.of(context)?.isCurrent != true;

void dismissDialog(BuildContext context) {
  if (Navigator.canPop(context) && isCurrentDialogShowing(context)) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }
}

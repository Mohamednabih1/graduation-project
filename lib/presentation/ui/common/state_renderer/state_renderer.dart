import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/common/resources/assets_manager.dart';
import 'package:gradproject/presentation/ui/common/resources/color_manager.dart';
import 'package:gradproject/presentation/ui/common/resources/font_manager.dart';
import 'package:gradproject/presentation/ui/common/resources/strings_manager.dart';
import 'package:gradproject/presentation/ui/common/resources/styles_manager.dart';
import 'package:gradproject/presentation/ui/common/resources/values_manager.dart';

enum StateRendererType {
  // popup states (Dialog)
  popupLoadingState,
  popupErrorState,
  popupSuccessState,
  // full screen states
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  // general
  contentState,
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function retryAction;
  final double? height;
  final double? width;

  const StateRenderer({
    required this.stateRendererType,
    required this.retryAction,
    this.message = AppStrings.loading,
    this.title = "",
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(""),
          _getMessage(message),
        ]);
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(""),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context),
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([
          _getAnimatedImage("", width: 200, height: 200),
          _getMessage(message),
        ]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(""),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgain, context),
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn([
          _getAnimatedImage(""),
          _getMessage(message),
        ]);
      case StateRendererType.popupSuccessState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(""),
          _getMessage(title),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context),
        ]);
      case StateRendererType.contentState:
        return Container();
    }
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Scrollbar(
      thumbVisibility: true,
      child: ListView(
        shrinkWrap: true,
        children: children,
      ),
    );
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: children,
    // );
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizeConstants.s14),
      ),
      elevation: AppSizeConstants.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorConstants.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSizeConstants.s14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName,
      {double? width, double? height}) {
    return SizedBox(
        height: height ?? AppSizeConstants.s40,
        width: width ?? AppSizeConstants.s40,
        child: Text("data"));
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10),
          padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 174, 171, 171)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
          ),
        ),
        onPressed: () {
          if (stateRendererType == StateRendererType.fullScreenErrorState) {
            // call retry function

            retryAction.call();
          } else {
            // popup error state
            retryAction.call();
            Navigator.of(context).pop();
          }
        },
        child: Text(
          buttonTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPaddingConstants.p8),
        child: Text(
          message,
          style: getRegularStyle(
            fontSize: FontSizeConstants.s12,
            color: ColorConstants.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

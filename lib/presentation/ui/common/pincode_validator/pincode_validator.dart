// import 'package:flutter/material.dart';
// import 'package:pulse_app/App/constants.dart';
// import 'package:pulse_app/CommonClasses/commonClasses.dart';
// import 'package:pulse_app/CommonWidgets/commonWidgets.dart';
// import 'package:pulse_app/Styles/colors.dart';
// import 'package:pulse_app/components/resources/strings_manager.dart';

// Future<bool> checkUserPinCode(
//   BuildContext context,
// ) async {
//   var orientation = MediaQuery.of(context).orientation;
//   Map<String, double> screenSize = getScreenSize(
//     context: context,
//     orientation: orientation,
//   );
//   var screenWidth = screenSize["screenWidth"]!;

//   String pinCode = "";
//   bool returnValue = await showDialog<bool>(
//         context: context,
//         builder: (ctx) => AlertDialog(
//           title: Text(AppStrings.checkUserPinCodeDialogTitle),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 onChanged: (val) {
//                   pinCode = val;
//                 },
//                 decoration: InputDecoration(hintText: AppStrings.checkUserPinCodeHintText),
//               ),
//               buttonContainer(
//                 btnColor: blueGreyColor,
//                 onPressed: () {
//                   if (pinCode == Constants.pinCodConstant) {
//                     Navigator.pop(context, true);
//                   } else {
//                     Navigator.pop(context, false);

//                     PlatformAlertDialog(
//                       title: AppStrings.checkUserPinCodeErrorDialogTitle,
//                       content: AppStrings.checkUserPinCodeErrorDialogContent,
//                       defaultActionText: AppStrings.ok,
//                       color: offlineColor,
//                       icon: Icons.close,
//                     ).show(ctx);
//                   }
//                 },
//                 screenWidth: screenWidth,
//                 textColor: offWhiteColor,
//                 title: AppStrings.checkUserPinCodeButtonText,
//               ),
//             ],
//           ),
//         ),
//       ) ??
//       false;
//   return returnValue;
// }

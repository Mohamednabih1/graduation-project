import 'package:flutter/material.dart';

/*
the app custom rounded button
 */
Widget buttonContainer({
  required double screenWidth,
  required String title,
  Function()? onPressed,
  Color? btnColor,
  Color? textColor,
}) {
  return SizedBox(
    width: screenWidth * 0.45,
    // ignore: deprecated_member_use
    child: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(btnColor)),
      // color: btnColor,
      onPressed: onPressed,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(15),
      // ),
      child: Text(
        title,
        style: TextStyle(color: textColor, fontSize: (screenWidth / 100) * 5),
      ),
    ),
  );
}

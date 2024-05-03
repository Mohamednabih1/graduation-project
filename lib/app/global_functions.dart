import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void securePrint(messageToPrint) {
  if (kDebugMode) {
    print(messageToPrint);
  }
}

Widget getBackButton(
    {required BuildContext ctx, required screenHeight, required screenWidth}) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    margin: EdgeInsets.only(
      top: screenHeight * 0.03,
      left: screenWidth * 0.01,
    ),
    child: IconButton(
        onPressed: () {
          ctx.pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        )),
  );
}

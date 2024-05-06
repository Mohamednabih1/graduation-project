import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void securePrint(messageToPrint) {
  if (kDebugMode) {
    print(messageToPrint);
  }
}

Widget getBackButton({
  required BuildContext ctx,
  required screenHeight,
  required screenWidth,
  bool? useMargin,
}) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    margin: EdgeInsets.only(
      top: useMargin != null && useMargin
          ? screenHeight * 0.03
          : screenHeight * 0.0,
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

String sortID(String id1, String id2) {
  String originalString = id1 + id2;
  List<String> chars = originalString.split('');
  chars.sort();
  String sortedString = chars.join();
  return sortedString;
}

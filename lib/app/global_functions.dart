import 'package:flutter/foundation.dart';

void securePrint(messageToPrint) {
  if (kDebugMode) {
  print(messageToPrint);
  }
}

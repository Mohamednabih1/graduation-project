import 'package:gradproject/app/app.dart';
import 'package:flutter/material.dart';

import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.initAppModule();
  runApp(MyApp());
}
import 'package:gradproject/app/app.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/domain/managers/fireBase/fireBase.dart';

import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.initAppModule();
  await DI.getItInstance<FireBaseManger>().fireBaseInit();
  runApp(MyApp());
}
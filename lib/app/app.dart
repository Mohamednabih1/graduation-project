import 'package:flutter/material.dart';
import 'package:gradproject/presentation/navigation/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal(); // to use singleton pattern to instantiate the class just one time and no one outside of the class can use the default constructor

  static const MyApp _instant = MyApp._internal();

  factory MyApp() => _instant;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

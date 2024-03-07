// ignore_for_file: unused_import

import 'dart:async';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import '../../../../data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  final AppCache _appPreferences = DI.getItInstance<AppCache>();
  void _startDelay() {
    _timer = Timer(
      const Duration(seconds: 8),
      goNext,
    );
  }

  void goNext() async {
    bool isUserLoggedIn = _appPreferences.getIsUserLoggedIn();
    securePrint("isUserLoggedIn: $isUserLoggedIn");
    bool isOpenedOnce = _appPreferences.getIsOpenedOnce();
    // context.pushReplacementNamed(RoutesName.profile);

    if (isUserLoggedIn) {
      context.pushReplacementNamed(RoutesName.home);
    } else {
      if (isOpenedOnce) {
        context.pushReplacementNamed(RoutesName.login);
      } else {
        context.pushReplacementNamed(RoutesName.getStarted);
      }

      // context.pushReplacementNamed(RoutesName.getStarted);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  Widget getBody(screenWidth, screenHeight) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // SizedBox(
            //   height: screenHeight * 0.3,
            //   child: Image.asset('assets/images/logoSmall.png'),
            // ),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.2),
              height: screenHeight * 0.5,
              width: double.infinity,
              child: Image.asset(
                'assets/gif/loading.gif',
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    'Be',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(
                    width: screenWidth * 0.34,
                    height: screenHeight * 0.1,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 25.0,
                        // fontFamily: 'Horizon',
                        color: Colors.black,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          RotateAnimatedText('AWESOME'),
                          RotateAnimatedText('PowerFull'),
                          RotateAnimatedText('DIFFERENT'),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    'with orsa',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(
              top: screenHeight * 0.05,
            ),
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {
                  goNext();
                },
                child: const Text(
                  "Skip Intro",
                  style: TextStyle(
                    // fontFamily: 'Horizon',
                    color: Colors.black,
                  ),
                )))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      body: getBody(screenWidth, screenHeight),
      backgroundColor: Colors.white,
    );
  }
}

//cool app bar
// AppBar get _getAppBar {
//   return AppBar(
//     centerTitle: true,
//     title: RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//         text: 'cool appbar ',
//         style: TextStyle(color: Colors.white, fontSize: 20),
//         children: <TextSpan>[
//           TextSpan(
//             text: 'orsa',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     ),
//     flexibleSpace: Container(
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: <Color>[Colors.red, Colors.blue])),
//     ),
//     backgroundColor: Colors.transparent,
//     elevation: 0.0,
//   );
// }

// Widget get _animatedButtonUI => Container(
//       margin: new EdgeInsets.only(top: 15.0),
//       height: 50,
//       width: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(100.0),
//         color: Colors.blue,
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x80000000),
//             blurRadius: 30.0,
//             offset: Offset(0.0, 5.0),
//           ),
//         ],
//       ),
//       child: const Center(
//         child: Text(
//           'Hide/Show',
//           style: TextStyle(fontSize: 15.0, color: Colors.white),
//         ),
//       ),
//     );

// void _onTapDown(TapDownDetails details) {
//   _controller.forward();
//   setState(() {
//     _visible = !_visible;
//   });
// }

// void _onTapUp(TapUpDetails details) {
//   _controller.reverse();
// }


import 'dart:async';
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
      const Duration(seconds: 3),
      goNext,
    );
  }

  void goNext() async {
    bool isUserLoggedIn = _appPreferences.getIsUserLoggedIn();
    securePrint("isUserLoggedIn: $isUserLoggedIn");

    context.pushReplacementNamed(RoutesName.profile);

    // if (isUserLoggedIn) {
    //   context.pushReplacementNamed(RoutesName.home);
    // } else {
    //   // context.pushReplacementNamed(RoutesName.login);
    //   context.pushReplacementNamed(RoutesName.getStarted);
    // }
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

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashScreenTest());
  }
}

class SplashScreenTest extends StatefulWidget {
  const SplashScreenTest({super.key});

  @override
  _SplashScreenTestState createState() => _SplashScreenTestState();
}

class _SplashScreenTestState extends State<SplashScreenTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Change to your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Start.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 20.0,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('orsa works'),
                ],
                isRepeatingAnimation: true,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
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


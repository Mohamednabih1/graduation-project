import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../libold/constants.dart';
import '../../../libold/login/screens/auth/log_in.dart';
import '../../../libold/login/screens/auth/sign_up.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: const Scaffold(
          body: Body(),
        ));
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body> {
  List<String> imgs = [
    'assets/images/stratImg2.png',
    'assets/images/stratImg1.png',
    'assets/images/stratImg2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 85,
        ),
        CarouselSlider(
          items: imgs
              .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          e,
                          width: 318,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            height: 508,
          ),
        ),
        const SizedBox(height: 49),
        // Get Started Button
        SizedBox(
          width: 237, // Adjust width as needed
          height: 54, // Adjust height as needed
          child: ElevatedButton(
            onPressed: () {
              // Add onPressed action here
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SignUpScreen()), // Navigate to SignupPage
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              textStyle: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              "Get Started",
              style: TextStyle(color: text),
            ),
          ),
        ),
/////////////////////////
        const SizedBox(height: 23), // Add some space
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account? ",
              style: TextStyle(
                  color: text,
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            TextButton(
              onPressed: () {
                // Add onPressed action for "Log in" here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginScreen()), // Navigate to login page
                );
              },
              child: const Text(
                " Log in",
                style: TextStyle(
                    color: loginText,
                    fontFamily: 'Lato',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

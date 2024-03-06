import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/presentation/ui/getStarted/view_model/getStart_model.dart';
import 'package:provider/provider.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetStartedViewModel>(
      create: (context) => GetStartedViewModel(),
      builder: (context, child) {
        return const GetStartedContent();
      },
    );
  }
}

class GetStartedContent extends StatefulWidget {
  const GetStartedContent({super.key});

  @override
  State<GetStartedContent> createState() => _GetStartedContentState();
}

class _GetStartedContentState extends State<GetStartedContent> {
  late final GetStartedViewModel _GetStartedViewModel;

  void _bind(BuildContext context) {
    _GetStartedViewModel =
        Provider.of<GetStartedViewModel>(context, listen: false);
    _GetStartedViewModel.start();
  }

  AppBar get appBar {
    return AppBar(title: const Text("GetStarted"));
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: appBar,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body> {
  List<String> images = [
    'assets/images/Start.jpg',
    'assets/images/Start.jpg',
    'assets/images/Start.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 85,
          ),
          CarouselSlider(
            items: images
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
                context.pushReplacementNamed(RoutesName.signUp);
                // Add onPressed action here
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => SignUpScreenContent()),
                // );
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
                style: TextStyle(color: textColor),
              ),
            ),
          ),
          const SizedBox(height: 23), // Add some space
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account? ",
                style: TextStyle(
                    color: textColor,
                    fontFamily: 'Lato',
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              TextButton(
                onPressed: () {
                  context.pushReplacementNamed(RoutesName.login);
                  // Add onPressed action for "Log in" here
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           LoginScreen()), // Navigate to login page
                  // );
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
      ),
    );
  }
}

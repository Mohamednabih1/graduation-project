import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
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
  final AppCache _appPreferences = DI.getItInstance<AppCache>();

  void setIsOpenedOnce() {
    _appPreferences.setIsOpenedOnce(true);
  }

  void _bind(BuildContext context) {
    _GetStartedViewModel =
        Provider.of<GetStartedViewModel>(context, listen: false);
    _GetStartedViewModel.start();
    setIsOpenedOnce();
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
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.04),
            child: CarouselSlider(
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
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.05),
            width: 237,
            height: screenHeight * 0.07,
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(RoutesName.signUp);
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
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.02),
            child: Row(
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
          ),
        ],
      ),
    );
  }
}

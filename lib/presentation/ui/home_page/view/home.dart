import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/header/header_function.dart';
import 'package:gradproject/presentation/ui/common/colors.dart';
import 'package:gradproject/presentation/ui/common/header.dart';
import 'package:gradproject/presentation/ui/doctor_home_page/view/doctor_home_page.dart';
import 'package:gradproject/presentation/ui/profile/view/profile.dart';
import 'package:gradproject/presentation/ui/report/view/report.dart';
import 'package:provider/provider.dart';
import 'package:gradproject/presentation/ui/home_page/view_model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      builder: (context, child) {
        return const HomeContent();
      },
    );
  }
}

int selectedIndex = 0;

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late final HomeViewModel _homeViewModel;

  void _bind(BuildContext context) {
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    _homeViewModel.start();
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  @override
  void dispose() {
    selectedIndex = 0;
    super.dispose();
  }

  bool orsaIsDoctor = false;
  Widget bottomNav() {
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    if (orsaIsDoctor) {
      //_appPreferences.getIsUserPatient()
      return BottomNavigationBar(
        backgroundColor: navBarColor,
        // fixedColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: bottomClicked,
        onTap: onItemTapped,
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: navBarColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined),
                label: 'Report',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: bottomClicked,
            // unselectedItemColor: Color.fromARGB(255, 62, 37, 37),
            onTap: onItemTapped,
          ),
        ),
      );
    }
  }

  List<Widget> getImageSliderImages() {
    return trainings
        .map((exercise) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: InkWell(
                onTap: () {
                  securePrint(exercise.exercises);
                  context.pushNamed(RoutesName.exercise, extra: exercise);
                },
                child: Stack(
                  children: [
                    Image.asset(
                      height: double.infinity,
                      fit: BoxFit.fitHeight,
                      width: double.infinity,
                      exercise.imageUrl,
                    ),
                    // Image.network(
                    //   exercise.imageUrl,
                    //   height: double.infinity,
                    //   fit: BoxFit.fitHeight,
                    // ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          exercise.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  Widget getExerciseDifficulty() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF93469F)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Beginner',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFF93469F),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Intermediate',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF93469F)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Advanced',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    ]);
  }

  // image_slider.
  Widget getHomeBody(screenWidth, screenHeight) {
    // List<Widget> myList = [];
    // for (var i = 0; i < 5; i++) {
    //   myList.add(InkWell(
    //     onTap: () {
    //       // context.pushNamed(RoutesName.exercise);
    //     },
    //     child: ImageCard(
    //       imageName: 'Image $i',
    //       imageUrl: 'assets/images/Start.jpg',
    //     ),
    //   ));
    // }
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.05),
              child: Header(
                name: "Morning, ${_homeViewModel.username}",
                myIconsList: [
                  HeaderIconsFunctions(
                    icon: const Icon(Icons.access_alarm_outlined),
                    iconFunction: () {
                      //securePrint("messageToPrint");
                    },
                  ),
                  HeaderIconsFunctions(
                    icon: const Icon(Icons.account_box_rounded),
                    iconFunction: () {
                      //securePrint("orsa");
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight * 0.00,
              left: screenWidth * 0.05,
              right: screenHeight * 0.03,
              bottom: screenHeight * 0.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.01),
            height: screenHeight * 0.4,
            width: double.infinity,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 1.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                // autoPlayInterval: const Duration(seconds: 6),
              ),
              items: getImageSliderImages(),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          //   child: getExerciseDifficulty(),
          // ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight * 0.02,
              left: screenWidth * 0.05,
              right: screenHeight * 0.03,
              bottom: screenHeight * 0.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Recommended',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03, vertical: screenHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ExerciseCard(
                  imageName: 'Squat Movement Exercise',
                  imageUrl: 'assets/images/Picture1.jpg',
                ),
                ExerciseCard(
                  imageName: 'Full Body Stretching',
                  imageUrl: 'assets/images/Picture2.jpg',
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03, vertical: screenHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ExerciseCard(
                  imageName: 'Squat Movement Exercise',
                  imageUrl: 'assets/images/Picture3.jpg',
                ),
                ExerciseCard(
                  imageName: 'Abdominal Exercise',
                  imageUrl: 'assets/images/Picture4.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody(screenWidth, screenHeight) {
    if (orsaIsDoctor) {
      //_appPreferences.getIsUserPatient()
      if (selectedIndex == 0) {
        return const DrHomePage();
      } else {
        return const Profile();
      }
    } else {
      if (selectedIndex == 0) {
        return getHomeBody(screenWidth, screenHeight);
      } else if (selectedIndex == 1) {
        return const Report();
      } else {
        return const Profile();
      }
    }
  }

  @override
  Widget build(context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      backgroundColor: pageBackGroundColor,
      body: getBody(screenWidth, screenHeight),
      bottomNavigationBar: bottomNav(),
    );
  }
}

// int pageNum = 1;

// class ImageModel {
//   final String name;
//   final String url;
//   ImageModel({required this.name, required this.url});
// }

class ExerciseCard extends StatelessWidget {
  final String imageName;
  final String imageUrl;

  const ExerciseCard({
    super.key,
    required this.imageName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 1),
      width: screenWidth * 0.45,
      height: screenHeight * 0.2,
      // color: Colors.black,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
              height: screenHeight * 0.199,
              width: double.infinity,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              )),
          Container(
            margin: EdgeInsets.only(left: screenWidth * 0.02),
            child: Text(
              imageName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

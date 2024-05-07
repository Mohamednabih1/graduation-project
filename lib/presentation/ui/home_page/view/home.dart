import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/trainings/training.dart';
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
            unselectedItemColor: const Color.fromARGB(255, 57, 57, 57),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
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
            unselectedItemColor: const Color.fromARGB(255, 57, 57, 57),
            showUnselectedLabels: true,
            backgroundColor: navBarColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
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

  List<Widget> getRecommended(screenWidth, screenHeight) {
    TrainingExercise pieceFullThoughts = TrainingExercise(
        exerciseImg: "assets/images/piecefull_thoughts.jpg",
        exerciseName: "Piecefull thoughts",
        have3DModel: false,
        haveVideo: true,
        exerciseDuration: "30",
        description: "");
    TrainingExercise selfConfidence = TrainingExercise(
        exerciseImg: "assets/images/self_confidence.jpg",
        exerciseName: "Self Confidence",
        have3DModel: false,
        haveVideo: true,
        exerciseDuration: "30",
        description: "");
    TrainingExercise relaxing = TrainingExercise(
        exerciseImg: "assets/images/relaxing.jpg",
        exerciseName: "relaxing",
        have3DModel: false,
        haveVideo: true,
        exerciseDuration: "30",
        description: "");
    TrainingExercise calmDay = TrainingExercise(
        exerciseImg: "assets/images/calm_day.jpg",
        exerciseName: "Calm day",
        have3DModel: false,
        haveVideo: true,
        exerciseDuration: "30",
        description: "");
    TrainingExercise happiness = TrainingExercise(
        exerciseImg: "assets/images/happiness.jpg",
        exerciseName: "happiness",
        have3DModel: false,
        haveVideo: true,
        exerciseDuration: "30",
        description: "");

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.5,
            height: screenHeight * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ExerciseCard(
                  exerciseTraining: pieceFullThoughts,
                  cardHight: screenHeight * 0.19,
                  cardWidth: screenWidth * 0.43,
                  imageUrl: "assets/images/piecefull_thoughts.jpg",
                  text: "Piecefull thoughts",
                ),
                ExerciseCard(
                  exerciseTraining: selfConfidence,
                  cardHight: screenHeight * 0.19,
                  cardWidth: screenWidth * 0.43,
                  imageUrl: "assets/images/self_confidence.jpg",
                  text: "Self Confidence",
                ),
                ExerciseCard(
                  exerciseTraining: relaxing,
                  cardHight: screenHeight * 0.19,
                  cardWidth: screenWidth * 0.43,
                  imageUrl: "assets/images/relaxing.jpeg",
                  text: "relaxing",
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenWidth * 0.5,
            height: screenHeight * 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ExerciseCard(
                    exerciseTraining: calmDay,
                    cardHight: screenHeight * 0.27,
                    cardWidth: screenWidth * 0.43,
                    imageUrl: "assets/images/calm_day.jpg",
                    text: "Calm day",
                  ),
                ),
                ExerciseCard(
                  exerciseTraining: happiness,
                  cardHight: screenHeight * 0.31,
                  cardWidth: screenWidth * 0.43,
                  imageUrl: "assets/images/happiness.jpg",
                  text: "Happiness",
                ),
              ],
            ),
          ),
        ],
      ),
    ];
  }

  Widget getHomeBody(screenWidth, screenHeight) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.05),
              child: Header(name: "Morning, ${_homeViewModel.username}"),
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
              ),
              items: getImageSliderImages(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight * 0.02,
              left: screenWidth * 0.05,
              right: screenHeight * 0.03,
              bottom: screenHeight * 0.0,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
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
          ),
          ...getRecommended(screenWidth, screenHeight),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget getBody(screenWidth, screenHeight) {
    if (orsaIsDoctor) {
      switch (selectedIndex) {
        case 0:
          return const DrHomePage();
        case 2:
          return const Profile();
        default:
          return const DrHomePage();
      }
    } else {
      switch (selectedIndex) {
        case 0:
          return getHomeBody(screenWidth, screenHeight);
        case 1:
          return const DrHomePage();
        case 2:
          return const Report();
        case 3:
          return const Profile();
        default:
          return getHomeBody(screenWidth, screenHeight);
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

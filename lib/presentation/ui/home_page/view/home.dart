// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/trainings/training.dart';
import 'package:gradproject/presentation/ui/common/colors.dart';
import 'package:gradproject/presentation/ui/common/header.dart';
import 'package:gradproject/presentation/ui/dashboard_page/view/dash.dart';
import 'package:gradproject/presentation/ui/doctor_home_page/view/doctor_home_page.dart';
import 'package:gradproject/presentation/ui/profile/view/profile.dart';
import 'package:gradproject/presentation/ui/report/view/report.dart';
import 'package:provider/provider.dart';
import 'package:gradproject/presentation/ui/home_page/view_model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:permission_handler/permission_handler.dart';

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

  Widget bottomNav() {
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    if (!_homeViewModel.isUserPatient) {
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
    //  done
    TrainingExercise breathing = TrainingExercise(
        exerciseImg: "assets/images/piecefull_thoughts.jpg",
        exerciseName: "Mindful Breathing Exercise",
        have3DModel: false,
        haveVideo: true,
        exerciseDuration: "breathing.mp4",
        description:
            "Take a deep breath in and a long exhale out feels good, doesn't it? Try our mindful breathing exercise video to help you feel more calm and present.");
    //  done
    TrainingExercise relaxing = TrainingExercise(
        exerciseImg: "assets/images/relaxing.jpg",
        exerciseName: "Relaxing",
        have3DModel: false,
        haveVideo: true,
        exerciseDuration: "relaxing.mp4",
        description:
            "This is a gentle 6 minute yoga for stress and anxiety relief. The stretches in this yoga class are focusing on the hips to help release tension within the lower body.Being super calm and restorative, this class can be done anytime of the day but i think it makes a great bedtime yoga routine");

//  done
    TrainingExercise cardio = TrainingExercise(
        exerciseImg: "assets/images/cardio.jpg",
        exerciseName: "Cardio",
        have3DModel: false,
        haveVideo: true,
        exerciseDuration: "cardio.mp4",
        description:
            "This workout is for beginners and great for families that want to burn calories with a home workout. Complete up to four times for a full workout or once for a quick way to get your heart rate and metabolism going.");
//right colum
//  done
    TrainingExercise stretch = TrainingExercise(
        exerciseImg: "assets/images/stretch_long.jpg",
        exerciseName: "Morning Stretches",
        have3DModel: false,
        haveVideo: true,
        exerciseDuration: "stretch_video.mp4",
        description:
            "Welcome to your Yoga inspired 5 Minute Morning Stretch for Beginner. This is a great way to start your day and create a mindful, but active morning routine.Get your daily dose of flexibility & mobility and have an amazing start into the day!");
    TrainingExercise strength = TrainingExercise(
        exerciseImg: "assets/images/strength.mp4.jpg",
        exerciseName: "Strength",
        have3DModel: false,
        haveVideo: true,
        exerciseDuration: "strength.mp4",
        description:
            "A strength training exercise routine doesn't require weights or a gym membership. In this video, MD Anderson wellness specialist Evan Thoman demonstrates simple strength training exercises you can do at home. Do these exercises twice a week to help lower your cancer risk.");

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //left colum
          SizedBox(
            width: screenWidth * 0.5,
            height: screenHeight * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ExerciseCard(
                  exerciseTraining: breathing,
                  cardHight: screenHeight * 0.19,
                  cardWidth: screenWidth * 0.43,
                  imageUrl: "assets/images/breath.jpg",
                  text: "Mindful Breathing",
                ),
                ExerciseCard(
                  exerciseTraining: relaxing,
                  cardHight: screenHeight * 0.19,
                  cardWidth: screenWidth * 0.43,
                  imageUrl: "assets/images/relaxing.jpg",
                  text: "Relaxing",
                ),
                ExerciseCard(
                  exerciseTraining: cardio,
                  cardHight: screenHeight * 0.19,
                  cardWidth: screenWidth * 0.43,
                  imageUrl: "assets/images/cardio.jpg",
                  text: "Cardio",
                ),
              ],
            ),
          ),
          //right colum
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
                    exerciseTraining: stretch,
                    cardHight: screenHeight * 0.27,
                    cardWidth: screenWidth * 0.43,
                    imageUrl: "assets/images/stretch_long.jpg",
                    text: "stretch",
                  ),
                ),
                ExerciseCard(
                  exerciseTraining: strength,
                  cardHight: screenHeight * 0.31,
                  cardWidth: screenWidth * 0.43,
                  imageUrl: "assets/images/strength.jpg",
                  text: "Strength",
                ),
              ],
            ),
          ),
        ],
      ),
    ];
  }

  Widget getHomeBody(screenWidth, screenHeight) {
    // Permission.storage.request();

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
                // Text(
                //   "See all",
                //   style: TextStyle(
                //     fontSize: 17,
                //   ),
                // )
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
                    'Extra service',
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
    if (!_homeViewModel.isUserPatient) {
      switch (selectedIndex) {
        case 0:
          return const DrHomePage();
        case 1:
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
          return const Dash();
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

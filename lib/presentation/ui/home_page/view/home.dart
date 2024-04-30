import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/domain/classes/header/header_function.dart';
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

  BottomNavigationBar bottomNav() {
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    if (true) {
      //_appPreferences.getIsUserPatient()
      return BottomNavigationBar(
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
        selectedItemColor: const Color(0xFF207790),
        onTap: onItemTapped,
      );
    } else {
      return BottomNavigationBar(
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
        selectedItemColor: const Color(0xFF207790),
        onTap: onItemTapped,
      );
    }
  }

  List<Widget> getImageSliderImages() {
    return trainings
        .map((item) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: InkWell(
                onTap: () {
                  securePrint(item.exercises);
                  context.pushNamed(RoutesName.exercise, extra: item);
                },
                child: Stack(
                  children: [
                    Image.network(
                      item.imageUrl,
                      height: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
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
                          item.category,
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
    List<Widget> myList = [];
    for (var i = 0; i < 5; i++) {
      myList.add(InkWell(
        onTap: () {
          // context.pushNamed(RoutesName.exercise);
        },
        child: ImageCard(
          imageName: 'Image $i',
          imageUrl: 'assets/images/Start.jpg',
        ),
      ));
    }
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
                      securePrint("messageToPrint");
                    },
                  ),
                  HeaderIconsFunctions(
                    icon: const Icon(Icons.account_box_rounded),
                    iconFunction: () {
                      securePrint("orsa");
                    },
                  ),
                ],
              ),
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
          GestureDetector(
            onTap: () {
              ///////
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(
                      child: Column(
                        children: const [
                          Text(
                            'Leg',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'No equipment',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    content: const Text(
                        'keep leg healthy and strong help you recover faster'),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 60,
                        icon: const Icon(
                          Icons.arrow_circle_right_rounded,
                          color: Color.fromRGBO(8, 42, 58, 0.9),
                        ),
                      ),
                    ],
                    actionsAlignment: MainAxisAlignment.center,
                  );
                },
              );

              //////
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(8, 42, 58, 0.9),
              ),
              //3ayz a3m border radius

              height: 387,
              width: 330,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  // 3ayzha tbd2 mn awl al container
                  const Text(
                    'The Next Exercise',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 220,
                    width: 220,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        // put the image here
                        image: AssetImage('assets/images/Picture1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  // 3ayz tbd2 mn awl al container
                  const Text(
                    'Duration',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: 10, horizontal: screenWidth * 0.1),
            height: screenHeight * 0.4,
            width: double.infinity,
            color: Colors.blue,
            child: Center(child: Text("data")),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight * 0.05,
              left: screenWidth * 0.05,
              right: screenHeight * 0.03,
              bottom: screenHeight * 0.02,
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
          // Container(
          //     margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          //     child: getExerciseDifficulty()),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: screenWidth * 0.85,
            height: screenHeight * 0.2,
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                Image.asset('assets/images/Picture1.jpg'),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  // color: Colors.black.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Squat Movement Exercise',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Icon(
                      //   Icons.save,
                      //   color: Colors.white,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: screenWidth * 0.85,
            height: screenHeight * 0.2,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset('assets/images/Picture2.jpg'),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Full Body Stretching',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: screenWidth * 0.85,
            height: screenHeight * 0.2,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Center(
                    child: Image.asset('assets/images/Picture3.jpg',
                        fit: BoxFit.fill)),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Yoga Movement Exercise',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: screenWidth * 0.85,
            height: screenHeight * 0.2,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset('assets/images/Picture4.jpg'),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Abdominal Exercise',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody(screenWidth, screenHeight) {
    if (false) {
      //_appPreferences.getIsUserPatient()
      if (selectedIndex == 0) {
        return getHomeBody(screenWidth, screenHeight);
      } else if (selectedIndex == 1) {
        return const Report();
      } else {
        return const Profile();
      }
    } else {
      if (selectedIndex == 0) {
        return const DrHomePage();
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
      body: getBody(screenWidth, screenHeight),
      bottomNavigationBar: bottomNav(),
    );
  }
}

int pageNum = 1;

class ImageModel {
  final String name;
  final String url;
  ImageModel({required this.name, required this.url});
}

class ImageCard extends StatelessWidget {
  final String imageName;
  final String imageUrl;

  const ImageCard({
    super.key,
    required this.imageName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              imageName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

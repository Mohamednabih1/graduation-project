// ignore_for_file: unused_import, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/header/header_function.dart';
import 'package:gradproject/presentation/ui/common/header.dart';
import 'package:gradproject/presentation/ui/profile/view/profile.dart';
import 'package:gradproject/presentation/ui/report/view/report.dart';
import 'package:gradproject/presentation/ui/home_page/view/home.dart';
import 'package:provider/provider.dart';
import 'package:gradproject/presentation/ui/drHpage/view_model/dr_h_page_view_model.dart';

class DrHomePage extends StatelessWidget {
  const DrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return ChangeNotifierProvider<DrHPageViewModel>(
      create: (context) => DrHPageViewModel(),
      builder: (context, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.05),
                  child: Header(
                    name: "Morning, Dr Orsa",
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
                UserCard(
                  profilePicture: 'assets/images/man.png',
                  username: 'John Doe',
                  age: 25,
                  gender: 'Male',
                  weight: 75.5,
                  height: 180.0,
                  onTap: () {
                    // Handle onTap for this user card
                    print('Tapped on John Doe');
                  },
                ),
                UserCard(
                  profilePicture: 'assets/images/man.png',
                  username: 'Marwan Sry',
                  age: 22,
                  gender: 'Male',
                  weight: 75.5,
                  height: 180.0,
                  onTap: () {
                    // Handle onTap for this user card
                    print('Tapped on John Doe');
                  },
                ),
                UserCard(
                  profilePicture: 'assets/images/woman.png',
                  username: 'Roby Doe',
                  age: 25,
                  gender: 'Female',
                  weight: 75.5,
                  height: 180.0,
                  onTap: () {
                    // Handle onTap for this user card
                    print('Tapped on John Doe');
                  },
                ),
                UserCard(
                  profilePicture: 'assets/images/woman.png',
                  username: 'mira melvoka',
                  age: 30,
                  gender: 'Female',
                  weight: 60.0,
                  height: 165.0,
                  onTap: () {
                    // Handle onTap for this user card
                    print('Tapped on mhamed beh al qa7tani');
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: bottomNav(),
        );
      },
    );
  }
}

BottomNavigationBar bottomNav() {
  void onItemTapped(int index) {}

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

class UserCard extends StatelessWidget {
  final String profilePicture;
  final String username;
  final int age;
  final String gender;
  final double weight;
  final double height;
  final Function()? onTap;

  const UserCard({
    super.key,
    required this.profilePicture,
    required this.username,
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(profilePicture),
                    radius: 45,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            username,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: const [
                                //Text('user Age: $age'),
                                //Text('Gender: $gender'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: const [
                                //Text('Weight: $weight kg'),
                                //Text('Height: $height cm'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

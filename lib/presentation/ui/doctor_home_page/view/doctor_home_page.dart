import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/domain/classes/user.dart';
import 'package:gradproject/presentation/ui/common/header.dart';
import 'package:gradproject/presentation/ui/doctor_home_page/view_model/doctor_view_model.dart';
import 'package:provider/provider.dart';

class DrHomePage extends StatelessWidget {
  const DrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DrHPageViewModel>(
      create: (context) => DrHPageViewModel(),
      builder: (context, child) {
        return const DoctorHome();
      },
    );
  }
}

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  late final DrHPageViewModel drHPageViewModel;
  final AppCache appPreferences = DI.getItInstance<AppCache>();

  void _bind(BuildContext context) {
    drHPageViewModel = Provider.of<DrHPageViewModel>(context, listen: false);
    drHPageViewModel.start();
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  List<Widget> getUsers(List<UserData>? users) {
    List<Widget> myUsers = [];
    if (users == null) {
      return myUsers;
    }
    for (var user in users) {
      String userId;
      try {
        var x = appPreferences.getUserId;
        userId = x;
      } catch (e) {
        securePrint(e);
        return [];
      }
      if (user.id == userId) {
        continue;
      }
      myUsers.add(UserCard(
        drHPageViewModel: drHPageViewModel,
        profilePicture: user.gender == "male"
            ? 'assets/images/man.png'
            : 'assets/images/woman.png',
        username: user.username,
        age: int.parse(user.age),
        gender: user.gender,
        weight: double.infinity,
        height: 120.0,
        onTap: () {
          securePrint(user);
          context.pushNamed(RoutesName.rtc, extra: user);
        },
      ));
    }

    return myUsers;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.05),
              child: const Header(
                name: "home",
              ),
            ),
            FutureBuilder<List<UserData>>(
              future: drHPageViewModel.users,
              builder: (BuildContext context,
                  AsyncSnapshot<List<UserData>> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = getUsers(snapshot.data);
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ];
                } else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                );
              },
            ),
            // ...getUsers()
            // UserCard(
            //   drHPageViewModel: drHPageViewModel,
            //   profilePicture: 'assets/images/man.png',
            //   username: 'John Doe',
            //   age: 25,
            //   gender: 'Male',
            //   weight: 75.5,
            //   height: 120.0,
            //   onTap: () {
            //     // Handle onTap for this user card
            //     securePrint('Tapped on John Doe');
            //     context.pushNamed(RoutesName.rtc);
            //   },
            // ),
            // UserCard(
            //   drHPageViewModel: drHPageViewModel,
            //   // userID: ,
            //   profilePicture: 'assets/images/man.png',
            //   username: 'Marwan Sry',
            //   age: 22,
            //   gender: 'Male',
            //   weight: 75.5,
            //   height: 120.0,
            //   onTap: () {
            //     // Handle onTap for this user card
            //     securePrint('Tapped on John Doe');
            //   },
            // ),
            // UserCard(
            //   drHPageViewModel: drHPageViewModel,
            //   profilePicture: 'assets/images/woman.png',
            //   username: 'Robe Doe',
            //   age: 25,
            //   gender: 'Female',
            //   weight: 75.5,
            //   height: 120.0,
            //   onTap: () {
            //     // Handle onTap for this user card
            //     securePrint('Tapped on John Doe');
            //   },
            // ),
            // UserCard(
            //   drHPageViewModel: drHPageViewModel,
            //   profilePicture: 'assets/images/woman.png',
            //   username: 'mira melva',
            //   age: 30,
            //   gender: 'Female',
            //   weight: 60.0,
            //   height: 120.0,
            //   onTap: () {
            //     // Handle onTap for this user card
            //     securePrint('Tapped on mohamed beh al ');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final DrHPageViewModel drHPageViewModel;

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
    required this.drHPageViewModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      minRadius: 100,
                      maxRadius: 100,
                      child: Image.asset(
                        profilePicture,
                        scale: 0.2,
                      )),
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

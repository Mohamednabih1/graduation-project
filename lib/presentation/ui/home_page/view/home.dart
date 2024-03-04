import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/common/header.dart';
import 'package:gradproject/presentation/ui/common/resources/image_manager.dart';
import 'package:gradproject/presentation/ui/profile/view/profile.dart';
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

  // AppBar get appBar {
  //   return AppBar(
  //     title: const Text("Hom2e"),
  //     actions: [
  //       Container(
  //         margin: const EdgeInsets.only(right: 10),
  //         child: IconButton(
  //           icon: const Icon(
  //             Icons.logout,
  //             color: Colors.black,
  //           ),
  //           onPressed: () {
  //             _homeViewModel.logOut(context);
  //           },
  //         ),
  //       )
  //     ],
  //   );
  // }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  BottomNavigationBar bottomNav() {
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

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
      selectedItemColor: const Color.fromARGB(255, 32, 119, 144),
      onTap: onItemTapped,
    );
  }

  List<Widget> getImageSliderImages() {
    return imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(3.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: [
                    Image.network(
                      item.url,
                      height: double.infinity,
                      // width: double.infinity,
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
                          item.name,
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

  Widget get getHomeBody {
    List<Widget> myList = [];
    for (var i = 0; i < 5; i++) {
      myList.add(ImageCard(
        imageName: 'Image $i',
        imageUrl: 'assets/images/Start.jpg',
      ));
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Header(name: "Home")),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            child: const Text(
              "Morning, Orsa",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.2,
              enlargeCenterPage: true,
            ),
            items: getImageSliderImages(),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text("Workout levels",
                    style: TextStyle(fontSize: 23)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ...myList,
        ]),
      ),
    );
  }

  Widget get getBody {
    if (selectedIndex == 0) {
      return getHomeBody;
    } else if (selectedIndex == 1) {
      return const Text("report");
    } else {
      return const Profile();
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: getBody,
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

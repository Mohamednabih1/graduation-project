import 'package:flutter/material.dart';
// import 'package:myapp/favorit.dart';
import 'package:carousel_slider/carousel_slider.dart';

int pageNum = 1;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPageContent();
  }
}

class MainPageContent extends StatefulWidget {
  const MainPageContent({super.key});

  @override
  State<MainPageContent> createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  AppBar appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 152, 67, 67),
      leading: Container(
        margin: const EdgeInsets.only(left: 20),
        child: const Icon(
          Icons.sports_gymnastics,
          size: 50,
          // color: Color.fromARGB(255, 136, 170, 229),
        ),
      ),

      //Image.asset('assets/images/small_logo.png'),
      title: const Text(
        'home',
        style: TextStyle(
            // color: Color.fromARGB(255, 136, 170, 229),
            ),
      ),

      actions: [
        const Icon(
          Icons.notifications,
        ),
        IconButton(
            onPressed: () {
              pageNum = 2;
              setState(() {});
            },
            icon: const Icon(Icons.bookmark_outline_sharp))
      ],
    );
  }

  BottomNavigationBar bottomNav() {
    int selectedIndex = 0;

    void onItemTapped(int index) {
      // setState(() {
      //   _selectedIndex = index;
      // });
    }

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }

  Widget myAppBarIcon() {
    var counter = 1;
    return SizedBox(
      width: 30,
      height: 30,
      child: Stack(
        children: [
          const Icon(
            Icons.notifications,
            color: Colors.black,
            size: 30,
          ),
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(top: 5),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffc32c37),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Text(
                    counter.toString(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget body() {
  //   if (pageNum == 1) {
  //     return const Text("data");
  //   } else {
  //     return const Favorite();
  //   }
  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: appBar(),
      body: const HomeBody(),
      bottomNavigationBar: bottomNav(),
    );
  }
}

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

//end of images by background

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final List<ImageModel> imgList = [
    ImageModel(
      name: 'Full Body Stretching',
      url:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    ),
    ImageModel(
        name: 'orsa2',
        url:
            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
    ImageModel(
        name: 'orsa3',
        url:
            'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'),
    ImageModel(
        name: 'orsa4',
        url:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'),
    ImageModel(
        name: 'orsa5',
        url:
            'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80'),
    ImageModel(
        name: 'orsa6',
        url:
            'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
  ];
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

  List<Widget> get getBody {
    List<Widget> myList = [];
    for (var i = 0; i < 5; i++) {
      myList.add(ImageCard(
        imageName: 'Image $i',
        imageUrl: 'assets/images/image.jpg',
      ));
    }
    return myList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: const Text(
                "Morning, Lolla",
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
                        // fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ...getBody,
          ]),
        ),
      ),
    );
  }
}

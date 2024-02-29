import 'package:flutter/material.dart';
import 'home/home.dart';
// import 'package:myapp/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
            child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Header'),
            ),
            ListTile(
              title: const Text('First Menu Item'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Second Menu Item'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {},
            ),
          ],
        )),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: const Home()),
      ),
    );
  }
}

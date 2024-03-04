import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 30),
      height: 75,
      // color: Colors.white,
      child: Row(
        children: [
          Image.asset("assets/images/logoSmall.png"),
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: Text(
              name,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}

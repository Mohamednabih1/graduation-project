import 'package:flutter/material.dart';
import 'package:gradproject/domain/classes/header/header_function.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.name, this.myIconsList});
  final String name;
  final List<HeaderIconsFunctions>? myIconsList;

  List<Widget> get getIcons {
    if (myIconsList != null && myIconsList!.isNotEmpty) {
      return myIconsList!.map((headerIconFunction) {
        return IconButton(
          icon: headerIconFunction.icon,
          onPressed: () {
            headerIconFunction.iconFunction();
          },
        );
      }).toList();
    } else {
      return [const SizedBox.shrink()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.only(top: 30),
      height: 75,
      // color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/images/logoSmall.png"),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [...getIcons],
          )
        ],
      ),
    );
  }
}

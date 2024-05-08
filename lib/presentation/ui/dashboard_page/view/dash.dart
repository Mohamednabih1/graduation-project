import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/common/header.dart';
import 'package:gradproject/presentation/ui/dashboard_page/widgets/dashboard_widget.dart';

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0.01),
            child: const Header(name: "User Report")),
           Expanded(
            flex: 9,
            child:  Container(
              color: const Color(0xFFF6F1F1),
              child: const DashboardWidget()),
          ),
          Expanded(
            flex: 3,
            child:  Container(
              color: const Color(0xFFF6F1F1),
              child: Column(
                children: const [
                  SizedBox(height: 8,),
                  Divider(thickness: 2, color: Colors.black26),
                  SizedBox(height: 3,),
                  Text("Exercise Log",style: TextStyle(color: Color.fromARGB(255, 33, 34, 45) ,fontWeight:FontWeight.w700,fontSize: 24),),
                  SizedBox(height: 70,),
                  Text("You have not any exercise yet",style: TextStyle(color: Color.fromARGB(255, 33, 34, 45) ,fontWeight:FontWeight.w400,fontSize: 18),),
                ],
              ),),
          ),
        ],
      )),
    );
  }
}


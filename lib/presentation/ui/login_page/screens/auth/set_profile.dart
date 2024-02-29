import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/presentation/ui/login_page/screens/auth/sign_up.dart';

class UserDataPage extends StatefulWidget {
  const UserDataPage({Key? key}) : super(key: key);

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  int _currentValueAge = 25;
  int _weight = 70;
  int _height = 175;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 58),
          alignment: Alignment.center,
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              Text(
                'Tell us about your self',
                style: const TextStyle(
                  fontSize: 25,
                  color: text,
                  fontFamily: 'Katibeh',
                  fontWeight: FontWeight.w900,
                ),
              ),
              // Age section
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "How old are you ?  $_currentValueAge",
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 15),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: text,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: NumberPicker(
                            itemWidth: 70,
                            itemHeight: 50,
                            textStyle: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                            selectedTextStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: buttonColor,
                            ),
                            itemCount: 5,
                            axis: Axis.horizontal,
                            minValue: 1,
                            maxValue: 99,
                            value: _currentValueAge,
                            onChanged: (V) {
                              setState(() {
                                _currentValueAge = V;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              /////////////////////////////
              const SizedBox(height: 50),
              // Width section
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "your Wieght in Kg  $_weight",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: text,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: NumberPicker(
                            itemWidth: 70,
                            itemHeight: 50,
                            textStyle: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                            selectedTextStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: buttonColor,
                            ),
                            itemCount: 5,
                            axis: Axis.horizontal,
                            minValue: 30,
                            maxValue: 180,
                            value: _weight,
                            onChanged: (W) {
                              setState(() {
                                _weight = W;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              /////////////////////////
              const SizedBox(height: 50),
              // Hight section
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "your hieght in cm $_height",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: Container(
                          width: 60,
                          height: 50,
                          decoration: BoxDecoration(
                            color: text,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: NumberPicker(
                            itemWidth: 70,
                            itemHeight: 50,
                            textStyle: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                            selectedTextStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: buttonColor,
                            ),
                            itemCount: 5,
                            axis: Axis.horizontal,
                            minValue: 120,
                            maxValue: 290,
                            value: _height,
                            onChanged: (H) {
                              setState(() {
                                _height = H;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              // Back and continue buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.0,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpScreen()), // Navigate to SignupPage
                        );
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Back',
                        style: TextStyle(
                            color: text,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: backBtnColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle back button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const UserDataPage()), // Navigate to SignupPage
                        );
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                            color: text,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

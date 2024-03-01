import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/setUserData/view_model/set_user_data_model.dart';
import 'package:provider/provider.dart';
import 'package:gradproject/presentation/ui/home_page/view_model/home_model.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:gradproject/app/constants/constants.dart';

class SetUserData extends StatelessWidget {
  const SetUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SetUserDataViewModel>(
      create: (context) => SetUserDataViewModel(),
      builder: (context, child) {
        return const SetUserDataViewModelContent();
      },
    );
  }
}

class SetUserDataViewModelContent extends StatefulWidget {
  const SetUserDataViewModelContent({super.key});

  @override
  State<SetUserDataViewModelContent> createState() =>
      _SetUserDataViewModelContentState();
}

class _SetUserDataViewModelContentState
    extends State<SetUserDataViewModelContent> {
  late final SetUserDataViewModel setUserDataViewModel;

  void _bind(BuildContext context) {
    setUserDataViewModel =
        Provider.of<SetUserDataViewModel>(context, listen: false);
    setUserDataViewModel.start();
  }

  AppBar get appBar {
    return AppBar(title: const Text("set user data"));
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const SetUserDataContent(),
    );
  }
}

class SetUserDataContent extends StatefulWidget {
  const SetUserDataContent({Key? key}) : super(key: key);

  @override
  State<SetUserDataContent> createState() => _SetUserDataContentState();
}

class _SetUserDataContentState extends State<SetUserDataContent> {
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
              const Text(
                'Tell us about your self',
                style: TextStyle(
                  fontSize: 25,
                  color: textColor,
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
                            color: textColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Center(
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
                  Text(
                    "your Weight in Kg  $_weight",
                    style: const TextStyle(fontSize: 20),
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
                            color: textColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Center(
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
                  Text(
                    "your height in cm $_height",
                    style: const TextStyle(fontSize: 20),
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
                            color: textColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Center(
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => SignUpScreenContent()),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: backBtnColor,
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const UserDataPage(),
                        //   ),
                        // );
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                            color: textColor,
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

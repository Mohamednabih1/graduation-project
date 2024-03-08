import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/presentation/ui/common/text_input_field.dart';
import 'package:gradproject/presentation/ui/sign_up/view_model/sign_up_model.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(),
      builder: (context, child) {
        return const SignUpContent();
      },
    );
  }
}

class SignUpContent extends StatefulWidget {
  const SignUpContent({super.key});

  @override
  State<SignUpContent> createState() => _SignUpContentState();
}

class _SignUpContentState extends State<SignUpContent> {
  late final SignUpViewModel _signUpViewModel;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  int _currentValueAge = 25;
  int _weight = 70;
  int _height = 175;
  String _gender = "male";

  void _bind(BuildContext context) {
    _signUpViewModel = Provider.of<SignUpViewModel>(context, listen: false);
    _signUpViewModel.start();
    _userNameController.addListener(
        () => _signUpViewModel.setUserName(_userNameController.text));

    _passwordController.addListener(
        () => _signUpViewModel.setPassword(_passwordController.text));

    _emailController
        .addListener(() => _signUpViewModel.setEmail(_emailController.text));

    _phoneNumberController.addListener(
        () => _signUpViewModel.setPhoneNum(_phoneNumberController.text));

    _heightController
        .addListener(() => _signUpViewModel.setHeight(_heightController.text));

    _weightController
        .addListener(() => _signUpViewModel.setWeight(_weightController.text));

    _ageController
        .addListener(() => _signUpViewModel.setAge(_ageController.text));

    _genderController
        .addListener(() => _signUpViewModel.setGender(_genderController.text));
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 45),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text(
                    'Fill Your Profile',
                    style: TextStyle(
                      fontSize: 35,
                      color: textColor,
                      fontFamily: 'Katibeh',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                          ),
                          Positioned(
                            // ignore: sort_child_properties_last
                            child: IconButton(
                              color: buttonColor,
                              onPressed: () {},
                              icon: const Icon(Icons.add_a_photo),
                            ),
                            bottom: -12,
                            left: 82,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextInputField(
                      controller: _userNameController,
                      labelText: 'Username',
                      icon: Icons.person,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextInputField(
                      controller: _emailController,
                      labelText: 'Email',
                      icon: Icons.email,
                      isObscure: false,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextInputField(
                      controller: _passwordController,
                      labelText: 'Password',
                      icon: Icons.lock,
                      isObscure: true,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextInputField(
                      controller: _phoneNumberController,
                      labelText: 'Phone Number',
                      icon: Icons.phone_android,
                      isObscure: false,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      // crossAxisAlignment: ,
                      children: [
                        const Text(
                          "Please enter your age",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: screenWidth * 0.04),
                          width: screenWidth * 0.35,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: _gender,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                if (value != null) {
                                  _gender = value;
                                  _genderController.text = value;
                                }
                              });
                            },
                            items: ["male", "female", "other"]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "How old are you ?  $_currentValueAge",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
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
                          onChanged: (int V) {
                            setState(() {
                              _currentValueAge = V;
                              _ageController.text = "$V";
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "your Weight in Kg  $_weight",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: textColor,
                          borderRadius: BorderRadius.circular(50),
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
                              _weightController.text = "$W";
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "your height in cm $_height",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
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
                              _heightController.text = "$H";
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: 150.0,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _signUpViewModel.signUp(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: buttonColor,
                      ),
                      child: const Text(
                        'Create',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.05),
            child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../libold/constants.dart';
import '../../../../libold/login/screens/auth/set_profile.dart';
import '../../../../libold/login/screens/startpage.dart';
import '../../../../libold/login/widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 45),
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text(
                'Fill Your Profile',
                style: TextStyle(
                  fontSize: 35,
                  color: text,
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
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextInputField(
                  controller: _userNameController,
                  labelText: 'Username',
                  icon: Icons.person,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextInputField(
                  controller: _nickNameController,
                  labelText: 'Nickname',
                  icon: Icons.person,
                  isObscure: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextInputField(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                  isObscure: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
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
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextInputField(
                  controller: _phoneNumberController,
                  labelText: 'Phone Number',
                  icon: Icons.phone_android,
                  isObscure: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min, // Adjust alignment as needed
                children: [
                  SizedBox(
                    width: 150.0,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StartPage(),
                          ),
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
                            builder: (context) => const UserDataPage(),
                          ),
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

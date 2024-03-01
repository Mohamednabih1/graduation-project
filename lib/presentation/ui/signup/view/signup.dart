import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/presentation/ui/common/text_input_field.dart';
import 'package:gradproject/presentation/ui/setUserData/view/set_user_data.dart';
import 'package:provider/provider.dart';
import 'package:gradproject/presentation/ui/signUp/view_model/signUp_model.dart';

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

  void _bind(BuildContext context) {
    _signUpViewModel = Provider.of<SignUpViewModel>(context, listen: false);
    _signUpViewModel.start();
    _userNameController.addListener(
        () => _signUpViewModel.setUserName(_userNameController.text));
    _passwordController.addListener(
        () => _signUpViewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _getAppBar,
      body: SignUpScreenContent(),
    );
  }

  // AppBar get _getAppBar {
  //   return AppBar(
  //     title: const Text('Sign Up Page'),
  //   );
  // }

  Widget get _getBody {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.green],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Username',
                  icon: Icon(Icons.person),
                ),
                onChanged: (value) => _signUpViewModel.setUserName(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                onChanged: (value) => _signUpViewModel.setPassword(value),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _signUpViewModel.signUp(context),
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreenContent extends StatelessWidget {
  SignUpScreenContent({Key? key}) : super(key: key);
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
                  // SizedBox(
                  //   width: 150.0,
                  //   height: 50,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const StartPage(),
                  //         ),
                  //       );
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30.0),
                  //       ),
                  //       backgroundColor: backBtnColor,
                  //     ),
                  //     child: const Text(
                  //       'Back',
                  //       style: TextStyle(
                  //           color: text,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle back button press
                        context.pushReplacementNamed(RoutesPath.setUserData);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const SetUserData(),
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: buttonColor,
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
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

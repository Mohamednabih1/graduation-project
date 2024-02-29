import 'package:flutter/material.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/presentation/ui/common/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 78),
          alignment: Alignment.center,
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              Text(
                'Login',
                style: const TextStyle(
                  fontSize: 35,
                  color: text,
                  fontFamily: 'Katibeh',
                  fontWeight: FontWeight.w900,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 125,
              ),
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextInputField(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 15,
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
              // ignore: prefer_const_constructors
              SizedBox(
                height: 35,
              ),
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width - 85,
                height: 57,
                decoration: const BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      50,
                    ),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    // ignore: avoid_print
                    print('Login User');
                  },
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 158),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/continue.png'),
                ],
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/facebook.png'),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 30.0),
                  IconButton(
                    icon: Image.asset('assets/images/google.png'),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 30.0),
                  IconButton(
                    icon: Image.asset('assets/images/apple.png'),
                    onPressed: () {},
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

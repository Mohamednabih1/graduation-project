import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gradproject/presentation/ui/signup/view_model/signup_model.dart';

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
      body: _getBody,
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

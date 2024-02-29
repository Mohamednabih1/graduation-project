import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/presentation/styles/colors.dart';
import 'package:gradproject/presentation/ui/login_page/view_model/login_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
      builder: (context, child) {
        return const LoginContent();
      },
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  late final LoginViewModel _loginViewModel;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _bind(BuildContext context) {
    _loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    _loginViewModel.start();
    _userNameController.addListener(
        () => _loginViewModel.setUserName(_userNameController.text));
    _passwordController.addListener(
        () => _loginViewModel.setPassword(_passwordController.text));
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

  AppBar get _getAppBar {
    return AppBar(
      title: const Text('Login Page'),
    );
  }

  Widget get _getBody {
    return Container(
      decoration: AppColors.backGroundGradientColorsDecoration,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Username',
                  icon: Icon(Icons.person),
                ),
                onChanged: (value) => _loginViewModel.setUserName(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                onChanged: (value) => _loginViewModel.setPassword(value),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _loginViewModel.login(context),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  context.pushNamed(
                    RoutesName.signUp,
                  );
                },
                child: const Text('Create an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

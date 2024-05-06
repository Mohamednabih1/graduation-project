// ignore_for_file: unused_import, unused_field, prefer_final_fields, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/presentation/ui/setUserData/view_model/set_user_data_model.dart';
import 'package:provider/provider.dart';
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
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(child: Text("")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gradproject/presentation/ui/home_page/view_model/home_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      builder: (context, child) {
        return const HomeContent();
      },
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late final HomeViewModel _homeViewModel;

  void _bind(BuildContext context) {
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    _homeViewModel.start();
  }

  AppBar get appBar {
    return AppBar(title: const Text("Home"));
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
      body: const Text("sad"),
    );
  }
}

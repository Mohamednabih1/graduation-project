// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gradproject/presentation/ui/exercise_page/view_model/exercise_view_model.dart';
import '../../home_page/view/home.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExerciseViewModel>(
      create: (context) => ExerciseViewModel(),
      builder: (context, child) {
        return const ExerciseContent();
      },
    );
  }
}

class ExerciseContent extends StatefulWidget {
  const ExerciseContent({super.key});

  @override
  State<ExerciseContent> createState() => _ExerciseContentState();
}

class _ExerciseContentState extends State<ExerciseContent> {
  late final ExerciseViewModel _exerciseViewModel;

  void _bind(BuildContext context) {
    _exerciseViewModel = Provider.of<ExerciseViewModel>(context, listen: false);
    _exerciseViewModel.start();
  }

  AppBar get appBar {
    return AppBar(
      title: const Text("Workout"),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              _exerciseViewModel.logOut(context);
            },
          ),
        )
      ],
    );
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /*
            here will be the picture
            */
            SizedBox(
                child: Image.asset(
              'assets/OIP.jpeg',
            )),
            const SizedBox(height: 10),
            const Text(
              "  Description ......",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.0,
                    //height: 120.0,
                    child: Container(
                        child: Image.asset(
                      'assets/OIP.jpeg',
                    )),
                  ),
                  const Text('alooooooooosbkvbskgvksgkvgskvvsvssbs'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.0,
                    //height: 120.0,
                    child: Container(
                        child: Image.asset(
                      'assets/OIP.jpeg',
                    )),
                  ),
                  const Text('alooooooooosbkvbskgvksgkvgskvvsvssbs'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.0,
                    // height: 120.0,
                    child: Container(
                        child: Image.asset(
                      'assets/OIP.jpeg',
                    )),
                  ),
                  const Text('alooooooooosbkvbskgvksgkvgskvvsvssbs'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.0,
                    //height: 120.0,
                    child: Container(
                        child: Image.asset(
                      'assets/OIP.jpeg',
                    )),
                  ),
                  const Text('alooooooooosbkvbskgvksgkvgskvvsvssbs'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

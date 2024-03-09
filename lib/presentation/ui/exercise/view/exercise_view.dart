// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/trainings/training.dart';
import 'package:gradproject/presentation/ui/common/function.dart';
import 'package:gradproject/presentation/ui/exercise/view_model/exercise_view_model.dart';
import 'package:provider/provider.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({
    required this.training,
    super.key,
  });
  final Training training;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExerciseViewModel>(
      create: (context) => ExerciseViewModel(),
      builder: (context, child) {
        return ExerciseContent(training: training);
      },
    );
  }
}

class ExerciseContent extends StatefulWidget {
  const ExerciseContent({required this.training, super.key});
  final Training training;

  @override
  State<ExerciseContent> createState() => _ExerciseContentState();
}

class _ExerciseContentState extends State<ExerciseContent> {
  late final ExerciseViewModel _exerciseViewModel;

  void _bind(BuildContext context) {
    _exerciseViewModel = Provider.of<ExerciseViewModel>(context, listen: false);
    _exerciseViewModel.start();
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  List<Widget> getExerciseListTile(double screenWidth, double screenHeight) {
    return widget.training.exercises
        .map((trainingExercise) => InkWell(
              onTap: () {
                context.pushNamed(
                  RoutesName.exerciseDetails,
                  extra: trainingExercise,
                );
              },
              child: ListTile(
                style: ListTileStyle.list,
                leading: Image.asset(
                  'assets/images/modelArm1.png',
                ),
                title: Text(trainingExercise.exerciseName),
                subtitle: Text(
                  truncateString(trainingExercise.description, 33),
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: const Icon(Icons.play_arrow, size: 30),
              ),
            ))
        .toList();
  }

  Widget getBody(double screenWidth, double screenHeight) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  height: screenHeight * 0.35,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  'assets/images/armPain1.png',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.training.category,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...getExerciseListTile(screenWidth, screenHeight),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: screenHeight * 0.03,
            left: screenWidth * 0.01,
          ),
          child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      // appBar: appBar,
      body: getBody(screenWidth, screenHeight),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/trainings/training.dart';
import 'package:gradproject/presentation/ui/exercise_details/view_model/exercise_details_model.dart';
import 'package:provider/provider.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({super.key, required this.trainingExercise});
  final TrainingExercise trainingExercise;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExerciseDetailsViewModel>(
      create: (context) => ExerciseDetailsViewModel(),
      builder: (context, child) {
        return ExerciseDetailsContent(
          trainingExercise: trainingExercise,
        );
      },
    );
  }
}

class ExerciseDetailsContent extends StatefulWidget {
  const ExerciseDetailsContent({super.key, required this.trainingExercise});
  final TrainingExercise trainingExercise;

  @override
  State<ExerciseDetailsContent> createState() => _ExerciseDetailsContentState();
}

class _ExerciseDetailsContentState extends State<ExerciseDetailsContent> {
  late final ExerciseDetailsViewModel _ExerciseDetailsViewModel;

  void _bind(BuildContext context) {
    _ExerciseDetailsViewModel =
        Provider.of<ExerciseDetailsViewModel>(context, listen: false);
    _ExerciseDetailsViewModel.start();
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  Widget getBodyContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const ModelViewer(
        backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: 'assets/3dModels/squat.glb',
        alt: 'A 3D model of an astronaut',
        ar: true,
        autoRotate: true,
        disableZoom: false,
        autoPlay: true,
      ),
    );
  }

  Widget getBody(screenWidth, screenHeight) {
    return Stack(
      children: [
        getBodyContent(),
        getBackButton(
            ctx: context, screenHeight: screenHeight, screenWidth: screenWidth),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return SafeArea(child: Scaffold(body: getBody(screenWidth, screenHeight)));
  }
}

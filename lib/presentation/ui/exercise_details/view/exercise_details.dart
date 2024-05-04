import 'package:flutter/material.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/trainings/training.dart';
import 'package:gradproject/presentation/ui/exercise_details/view_model/exercise_details_model.dart';
import 'package:provider/provider.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

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
  late final ExerciseDetailsViewModel exerciseDetailsViewModel;
  final int _duration = 10;
  final CountDownController _controller = CountDownController();
  void _bind(BuildContext context) {
    exerciseDetailsViewModel =
        Provider.of<ExerciseDetailsViewModel>(context, listen: false);
    exerciseDetailsViewModel.start();
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  Widget getBodyContent(screenWidth, screenHeight) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: screenWidth * 0.15),
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 232, 226, 224),
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20)),
            // margin: const EdgeInsets.symmetric(0),
            child: SizedBox(
              height: screenHeight * 0.5,
              child: ModelViewer(
                backgroundColor: Colors.transparent,
                src: "${widget.trainingExercise.modelUrl}",
                alt: widget.trainingExercise.exerciseName,
                ar: true,
                autoRotate: true,
                disableZoom: false,
                autoPlay: true,
                animationName: widget.trainingExercise.exerciseName,
              ),
            ),
          ),
          getExerciseDetails(),

          // const CountdownTimer(),
        ],
      ),
    );
  }

  Widget getExerciseDetails() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ### Exercise Name
            const Text(
              'Push-ups',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            // ### Timer
            Row(
              children: [
                Icon(Icons.timer, size: 18.0),
                SizedBox(width: 4.0),
                Text(
                  '1:30',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            // ### Description
            Text(
              'Perform 3 sets of 10 push-ups with 30 seconds rest between sets.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            // ### Duration
            Row(
              children: [
                Icon(Icons.access_time, size: 18.0),
                SizedBox(width: 4.0),
                Text(
                  '5 minutes',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget getBody(screenWidth, screenHeight) {
    return Stack(
      children: [
        getBodyContent(screenWidth, screenHeight),
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

    //  SizedBox(
    //         width: double.infinity,
    //         height: screenHeight * 0.3,
    //         child: Stack(
    //           children: [
    //             Center(
    //               child: CircularCountDownTimer(
    //                 duration: _duration,
    //                 initialDuration: 0,
    //                 controller: _controller,
    //                 width: MediaQuery.of(context).size.width / 3,
    //                 height: MediaQuery.of(context).size.height / 3,
    //                 ringColor: Colors.grey[300]!,
    //                 fillColor: Colors.purpleAccent[100]!,
    //                 backgroundColor: Colors.purple[500],
    //                 strokeWidth: 20.0,
    //                 strokeCap: StrokeCap.round,
    //                 textStyle: const TextStyle(
    //                   fontSize: 33.0,
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //                 isTimerTextShown: true,
    //                 autoStart: false,
    //                 onChange: (String timeStamp) {
    //                   securePrint('Countdown Changed $timeStamp');
    //                 },
    //                 timeFormatterFunction:
    //                     (defaultFormatterFunction, duration) {
    //                   if (duration.inSeconds == 0) {
    //                     // only format for '0'
    //                     return "Start";
    //                   } else {
    //                     // other durations by it's default format
    //                     return Function.apply(
    //                         defaultFormatterFunction, [duration]);
    //                   }
    //                 },
    //               ),
    //             ),
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     _button(
    //                       title: "Start",
    //                       onPressed: () => _controller.start(),
    //                     ),
    //                     _button(
    //                       title: "Pause",
    //                       onPressed: () => _controller.pause(),
    //                     ),
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     _button(
    //                       title: "Restart",
    //                       onPressed: () =>
    //                           _controller.restart(duration: _duration),
    //                     ),
    //                     _button(
    //                       title: "Resume",
    //                       onPressed: () => _controller.resume(),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
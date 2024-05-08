// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gradproject/app/constants/video.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/trainings/training.dart';
import 'package:gradproject/presentation/ui/common/colors.dart';
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
  CountDownController countDownController = CountDownController();
  void _bind(BuildContext context) {
    exerciseDetailsViewModel =
        Provider.of<ExerciseDetailsViewModel>(context, listen: false);
    exerciseDetailsViewModel.start();
  }

  late final ExerciseDetailsViewModel exerciseDetailsViewModel;

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  Widget getBodyContent(screenWidth, screenHeight) {
    securePrint("orsa ${widget.trainingExercise.description}");
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
              color: Colors.transparent, //fromARGB(255, 188, 208, 241),
              border: Border.all(color: const Color.fromARGB(0, 77, 77, 77)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              height: widget.trainingExercise.have3DModel
                  ? screenHeight * 0.5
                  : screenHeight * 0.37,
              child: widget.trainingExercise.have3DModel
                  ? ModelViewer(
                      backgroundColor: Colors.transparent,
                      src: "${widget.trainingExercise.modelUrl}",
                      alt: widget.trainingExercise.exerciseName,
                      ar: true,
                      autoRotate: false,
                      disableZoom: false,
                      autoPlay: true,
                      animationName: widget.trainingExercise.exerciseName,
                    )
                  : ButterFlyAssetVideo(
                      videoName: widget.trainingExercise.exerciseDuration),
            ),
          ),
          getExerciseDetails(),
          widget.trainingExercise.have3DModel
              ? const SizedBox.shrink()
              : SizedBox(
                  height: screenHeight * 0.1,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              countDownController.isStarted
                  ? countDownController.isPaused
                      ? IconButton(
                          onPressed: () {
                            countDownController.resume();
                            setState(() {});
                          },
                          icon: const Icon(Icons.play_arrow))
                      : IconButton(
                          onPressed: () {
                            countDownController.pause();
                            setState(() {});
                          },
                          icon: const Icon(Icons.pause_sharp))
                  : IconButton(
                      onPressed: () {
                        countDownController.start();
                        setState(() {});
                      },
                      icon: const Icon(Icons.play_arrow)),
              circleTimer(countDownController),
              IconButton(
                  onPressed: () {
                    bool countDownControllerIsPaused =
                        countDownController.isPaused;
                    countDownController.restart(duration: 30);
                    if (countDownControllerIsPaused) {
                      countDownController.pause();
                    }
                  },
                  icon: const Icon(Icons.restart_alt)),
            ],
          )
        ],
      ),
    );
  }

  Widget circleTimer(CountDownController countDownController) {
    int duration = 30;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: CircularCountDownTimer(
        duration: duration,
        initialDuration: 0,
        controller: countDownController,
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 5,
        ringColor: Colors.grey,
        ringGradient: null,
        fillColor: const Color.fromARGB(255, 38, 87, 154),
        fillGradient: null,
        backgroundColor: Colors.transparent,
        backgroundGradient: null,
        strokeWidth: 10.0,
        strokeCap: StrokeCap.round,
        textStyle: const TextStyle(
          fontSize: 32.0,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
        textFormat: CountdownTextFormat.S,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: false,
        onStart: () {
          // Callback function when the timer starts
          securePrint('Countdown started');
        },
        onComplete: () {
          // Callback function when the timer completes
          securePrint('Countdown completed');
          // add user data
        },
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
            Text(
              widget.trainingExercise.exerciseName,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            // ### Timer
            widget.trainingExercise.have3DModel
                ? Row(
                    children: [
                      const Icon(Icons.access_time, size: 18.0),
                      const SizedBox(width: 4.0),
                      Text(
                        widget.trainingExercise.exerciseDuration,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            const SizedBox(height: 8.0),
            // ### Description
            Text(
              widget.trainingExercise.description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
          ],
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: pageBackGroundColor,
        body: getBody(screenWidth, screenHeight),
      ),
    );
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


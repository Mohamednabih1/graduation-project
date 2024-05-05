import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/domain/classes/trainings/training.dart';

//Colors//
const backgroundColor = Color(0xff27374D); //#176b87 with 100% opacity
const textColor = Color.fromARGB(255, 32, 56, 50);
const backGroundPhoto = Color(0xff176b87);
const buttonColor = Color(0xD9FA9A85);
const buttonTextColor = Colors.white;
const loginText = Color(0xCCFA9A85);
const borderColor = Color(0xffDDE6ED);
const backBtnColor = Color(0xffFBC6BA);

List<Training> trainings = [
  Training(
    category: "Knee Pain",
    exercises: [
      TrainingExercise(
        exerciseImg: 'assets/images/side_lying_hip_abduction.png',
        haveVideo: false,
        exerciseName: "Long ARC Quads",
        have3DModel: true,
        modelUrl: "assets/3dModels/Long_ARC_Quads_try5.glb",
        description: "15-20 reps , 3 sets",
        exerciseDuration: "1 min",
      ),
      TrainingExercise(
        exerciseImg: 'assets/images/side_lying_hip_abduction.png',
        haveVideo: true,
        exerciseName: "side lying hip abduction",
        have3DModel: true,
        modelUrl: 'assets/3dModels/side_lying_hip_abduction.glb',
        description:
            "lifting your heel up towards  don't lead your toe and let your hip flexors  feel kind of more posterioly more in the butt than in the front  feel more posteriorly in glute  10 reps / 3 sets",
        exerciseDuration: "1 min",
      ),
    ],
    imageUrl: 'assets/images/Knee.png',
  ),
  Training(
    category: "Lower Back",
    exercises: [
      TrainingExercise(
        exerciseImg: 'assets/images/Lumbar_rotation_stretch.png',
        haveVideo: true,
        videoUrl: 'https://www.youtube.com/watch?v=1rUFz5RzGmc',
        exerciseName: "Lumbar rotation stretch",
        have3DModel: true,
        modelUrl: "assets/3dModels/Lumbar_rotation_stretch.glb",
        description: "20 Seconds per side 3 Reps",
        exerciseDuration: "1 min",
      ),
    ],
    imageUrl: 'assets/images/lower-back-pain.png',
  ),
  Training(
      category: "Upper Back",
      exercises: [
        TrainingExercise(
          exerciseImg: 'assets/images/swimmers.png',
          haveVideo: true,
          exerciseName: "Swimmers",
          have3DModel: true,
          modelUrl: 'assets/3dModels/swimmer.glb',
          videoUrl:
              'https://www.youtube.com/watch?v=bAHLexn6Ruk&list=PLT4Yite3Tx5n-rPIsiqWzVgQI78FCmyHR&index=3',
          description: "10 rep/ s sets",
          exerciseDuration: "1 min",
        ),
        TrainingExercise(
          exerciseImg: 'assets/images/Prone_Ts.png',
          haveVideo: true,
          exerciseName: "Prone T's",
          modelUrl: 'assets/3dModels/Prone_Ts.glb',
          videoUrl:
              'https://www.youtube.com/watch?v=bAHLexn6Ruk&list=PLT4Yite3Tx5n-rPIsiqWzVgQI78FCmyHR&index=4',
          have3DModel: true,
          description: "10 repetitions 3 sets",
          exerciseDuration: "1 min",
        ),
      ],
      imageUrl: 'assets/images/upper-back.png'),
  Training(
    category: "Hip pain",
    exercises: [
      TrainingExercise(
        exerciseImg: 'assets/images/hip_flexor_stretch.png',
        haveVideo: true,
        exerciseName: "hip flexor stretch",
        have3DModel: true,
        modelUrl: "assets/3dModels/hip_flexor_stretch.glb",
        description: "20 secs / 3 rep",
        videoUrl:
            'https://www.youtube.com/watch?v=FOYaffW5zfA&list=PLT4Yite3Tx5kNj8FZobTBZyT-b2_cuh5P&index=6',
        exerciseDuration: "1 min",
      ),
      TrainingExercise(
        exerciseImg: 'assets/images/side_lying_hip_abduction.png',
        haveVideo: true,
        exerciseName: "side lying hip abduction",
        have3DModel: true,
        modelUrl: 'assets/3dModels/side_lying_hip_abduction.glb',
        description:
            "lifting your heel up towards  don't lead your toe and let your hip flexors  feel kind of more posteri oly more in the butt than in the front  feel more posteriorly in glute  10 reps / 3 sets",
        exerciseDuration: "1 min",
        videoUrl: 'https://www.youtube.com/watch?v=ikt6NME0k9E',
      ),
    ],
    imageUrl: 'assets/images/hip_pain.png',
  ),
];

class ExerciseCard extends StatelessWidget {
  final TrainingExercise exerciseTraining;

  const ExerciseCard({
    super.key,
    required this.exerciseTraining,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 1),
        width: screenWidth * 0.45,
        height: screenHeight * 0.2,
        // color: Colors.black,
        child: InkWell(
          onTap: () {
            context.pushNamed(RoutesName.exerciseDetails,
                extra: exerciseTraining);
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                  height: screenHeight * 0.199,
                  width: double.infinity,
                  child: Image.asset(
                    exerciseTraining.exerciseImg,
                    fit: BoxFit.fill,
                  )),
              Container(
                width: double.infinity,
                height: screenHeight * 0.044,
                // margin: EdgeInsets.only(bottom: screenWidth * 0.01),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Center(
                  child: Text(
                    exerciseTraining.exerciseName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getExerciseDifficulty() {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF93469F)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Beginner',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF93469F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Intermediate',
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF93469F)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Advanced',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    ),
  ]);
}

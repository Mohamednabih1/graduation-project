import 'package:flutter/material.dart';
import 'package:gradproject/domain/classes/trainings/training.dart';
//Colors//

const backgroundColor = Color(0xff27374D); //#176b87 with 100% opacity
const textColor = Color.fromARGB(255, 32, 56, 50);
//startPage//
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
        modelUrl: "assets/3dModels/squat.glb",
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
            "lifting your heel up towards  don't lead your toe and let your hip flexors  feel kind of more posterioly more in the butt than in the front  feel more posteriorly in glute  10 reps / 3 sets",
        exerciseDuration: "1 min",
        videoUrl: 'https://www.youtube.com/watch?v=ikt6NME0k9E',
      ),
    ],
    imageUrl: 'assets/images/hip_pain.png',
  ),

  // Training(
  //     category: "Cardiovascular Training",
  //     exercises: [
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Walking",
  //         have3DModel: false,
  //         description:
  //             "Boosts cardiovascular health and strengthens muscles with low-impact aerobic exercise.",
  //         exerciseDuration: "1 min",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Jogging",
  //         have3DModel: false,
  //         description:
  //             "Improves cardiovascular fitness and burns calories with moderate to high-impact aerobic exercise.",
  //         exerciseDuration: "1 min",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Cycling",
  //         have3DModel: false,
  //         description:
  //             "Enhances cardiovascular health and leg strength with low-impact aerobic exercise.",
  //         exerciseDuration: "1 min",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Swimming",
  //         have3DModel: false,
  //         description:
  //             "Provides full-body workout, improves cardiovascular health, and increases strength and flexibility with gentle joint impact.",
  //         exerciseDuration: "1 min",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Jumping Jacks",
  //         have3DModel: false,
  //         description:
  //             "Improves cardiovascular fitness and coordination with plyometric exercise involving jumping and arm and leg movement.",
  //         exerciseDuration: "1 min",
  //       ),
  //     ],
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80'),
  // Training(
  //     category: "Functional Training",
  //     exercises: [
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Functional Movements",
  //         have3DModel: false,
  //         description:
  //             "Mimics everyday activities to improve strength, flexibility, and coordination for daily tasks and injury prevention.",
  //         exerciseDuration: "1 min",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Bodyweight Exercises",
  //         have3DModel: false,
  //         description:
  //             "Strengthens muscles using body weight as resistance, including push-ups, squats, and lunges.",
  //         exerciseDuration: "1 min",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Resistance Band Exercises",
  //         have3DModel: false,
  //         description:
  //             "Targets muscles using elastic bands for resistance training, versatile and portable.",
  //         exerciseDuration: "1 min",
  //       ),
  //     ],
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
];

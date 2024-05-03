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
        haveVideo: false,
        exerciseName: "Long ARC Quads",
        have3DModel: true,
        modelUrl: "assets/3dModels/squat.glb",
        description: "15-20 reps , 3 sets",
        exerciseDuration: "1",
      ),
      TrainingExercise(
        haveVideo: false,
        exerciseName: "Squats",
        have3DModel: false,
        description:
            "Targets thighs, hips, and buttocks by bending knees and lowering hips, then returning to standing.",
        exerciseDuration: "1",
      ),
      TrainingExercise(
        haveVideo: false,
        exerciseName: "Lunges",
        have3DModel: false,
        description:
            "Works quadriceps, hamstrings, and glutes by stepping forward, lowering hips until knees bent at 90 degrees, then returning.",
        exerciseDuration: "1",
      ),
      TrainingExercise(
        haveVideo: false,
        exerciseName: "Push-ups",
        have3DModel: false,
        description:
            "Engages chest, shoulders, and triceps by lowering body to ground with bent elbows, then pushing back up.",
        exerciseDuration: "1",
      ),
      TrainingExercise(
        haveVideo: false,
        exerciseName: "Dumbbell Rows",
        have3DModel: false,
        description:
            "Strengthens upper back muscles like latissimus dorsi and rhomboids by pulling dumbbells towards chest from bent forward position.",
        exerciseDuration: "1",
      ),
      TrainingExercise(
        haveVideo: false,
        exerciseName: "Dead lifts",
        have3DModel: false,
        description:
            "Targets lower back, hamstrings, and glutes by lifting barbell or dumbbells from ground to standing position.",
        exerciseDuration: "1",
      ),
    ],
    imageUrl: 'assets/images/Knee.png',
  ),
  Training(
    category: "Lower Back",
    exercises: [
      TrainingExercise(
        haveVideo: false,
        exerciseName: "Stretching",
        have3DModel: false,
        description:
            "Improves flexibility and reduces risk of injury through lengthening and elongating muscles.",
        exerciseDuration: "1",
      ),
      TrainingExercise(
        haveVideo: false,
        exerciseName: "Yoga Poses",
        have3DModel: false,
        description:
            "Enhances flexibility, strength, and mental focus through various body positions.",
        exerciseDuration: "1",
      ),
      TrainingExercise(
        haveVideo: false,
        exerciseName: "Dynamic Stretches",
        have3DModel: false,
        description:
            "Improves flexibility and prepares body for physical activity through moving muscles in full range of motion.",
        exerciseDuration: "1",
      ),
    ],
    imageUrl: 'assets/images/lower-back-pain.png',
  ),
  Training(
      category: "Upper Back",
      exercises: [
        TrainingExercise(
          haveVideo: false,
          exerciseName: "Single-leg Stands",
          have3DModel: false,
          description:
              "Improves balance and stability by standing on one leg while keeping other leg lifted.",
          exerciseDuration: "1",
        ),
        TrainingExercise(
          haveVideo: false,
          exerciseName: "Heel-to-toe Walk",
          have3DModel: false,
          description:
              "Enhances balance and coordination by walking placing heel of one foot directly in front of toes of other foot.",
          exerciseDuration: "1",
        ),
        TrainingExercise(
          haveVideo: false,
          exerciseName: "Balance BoardExercises",
          have3DModel: false,
          description:
              "Challenges balance and stability using balance board for exercises like squats and lunges.",
          exerciseDuration: "1",
        ),
        TrainingExercise(
          haveVideo: false,
          exerciseName: "Stability BallExercises",
          have3DModel: false,
          description:
              "Strengthens core and improves balance and stability using large inflatable ball for various exercises.",
          exerciseDuration: "1",
        ),
        TrainingExercise(
          haveVideo: false,
          exerciseName: "Tai Chi",
          have3DModel: false,
          description:
              "Improves balance, flexibility, and relaxation through slow, flowing movements and deep breathing.",
          exerciseDuration: "1",
        ),
      ],
      imageUrl: 'assets/images/upper-back.png'),
  // Training(
  //     category: "Cardiovascular Training",
  //     exercises: [
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Walking",
  //         have3DModel: false,
  //         description:
  //             "Boosts cardiovascular health and strengthens muscles with low-impact aerobic exercise.",
  //         exerciseDuration: "1",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Jogging",
  //         have3DModel: false,
  //         description:
  //             "Improves cardiovascular fitness and burns calories with moderate to high-impact aerobic exercise.",
  //         exerciseDuration: "1",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Cycling",
  //         have3DModel: false,
  //         description:
  //             "Enhances cardiovascular health and leg strength with low-impact aerobic exercise.",
  //         exerciseDuration: "1",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Swimming",
  //         have3DModel: false,
  //         description:
  //             "Provides full-body workout, improves cardiovascular health, and increases strength and flexibility with gentle joint impact.",
  //         exerciseDuration: "1",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Jumping Jacks",
  //         have3DModel: false,
  //         description:
  //             "Improves cardiovascular fitness and coordination with plyometric exercise involving jumping and arm and leg movement.",
  //         exerciseDuration: "1",
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
  //         exerciseDuration: "1",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Bodyweight Exercises",
  //         have3DModel: false,
  //         description:
  //             "Strengthens muscles using body weight as resistance, including push-ups, squats, and lunges.",
  //         exerciseDuration: "1",
  //       ),
  //       TrainingExercise(haveVideo: false,
  //         exerciseName: "Resistance Band Exercises",
  //         have3DModel: false,
  //         description:
  //             "Targets muscles using elastic bands for resistance training, versatile and portable.",
  //         exerciseDuration: "1",
  //       ),
  //     ],
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
];

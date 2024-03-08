class Training {
  String category;
  String imageUrl;
  List<TrainingExercise> exercises;

  Training(
      {required this.category,
      required this.exercises,
      required this.imageUrl});
}

class TrainingExercise {
  String exerciseName;
  bool have3DModel;
  String? modelUrl;
  String? videoUrl;
  String exerciseDuration;
  String description;

  TrainingExercise({
    required this.exerciseName,
    required this.have3DModel,
    this.modelUrl,
    this.videoUrl,
    required this.exerciseDuration,
    required this.description,
  });
}

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
  String exerciseImg;
  String exerciseName;
  bool have3DModel;
  bool haveVideo;
  String? modelUrl;
  String? videoUrl;
  String exerciseDuration;
  String description;

  TrainingExercise({
    required this.exerciseImg,
    required this.exerciseName,
    required this.have3DModel,
    required this.haveVideo,
    this.modelUrl,
    this.videoUrl,
    required this.exerciseDuration,
    required this.description,
  });
}

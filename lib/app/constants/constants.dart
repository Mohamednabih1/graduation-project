import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/trainings/training.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

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
      TrainingExercise(
        exerciseImg: 'assets/images/Short_ARC_Quads.png',
        haveVideo: true,
        exerciseName: "Short ARC Quads",
        have3DModel: true,
        modelUrl: 'assets/3dModels/Short_ARC_Quads.glb',
        description: "15-20 reps ,3 set",
        exerciseDuration: "1 min",
      ),
      TrainingExercise(
        exerciseImg: 'assets/images/Short_ARC_Quads.png',
        haveVideo: true,
        exerciseName: "Straight Leg Raise",
        have3DModel: true,
        modelUrl: 'assets/3dModels/Straight_Leg_Raise.glb',
        description: "10-15 reps , 3 sets",
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
  Training(
    category: "VR Meta",
    exercises: [
      TrainingExercise(
        exerciseImg: 'assets/images/hip_flexor_stretch.png',
        haveVideo: true,
        exerciseName: "VR trial",
        have3DModel: true,
        modelUrl: "assets/3dModels/orsaTry.glb",
        description: "30 secs / 3 rep",
        videoUrl:
            'https://www.youtube.com/watch?v=FOYaffW5zfA&list=PLT4Yite3Tx5kNj8FZobTBZyT-b2_cuh5P&index=6',
        exerciseDuration: "30 sec",
      ),
    ],
    imageUrl: 'assets/images/vr.jpg',
  ),
];

class ExerciseCard extends StatelessWidget {
  final double cardWidth;
  final double cardHight;
  final String text;
  final String imageUrl;
  final TrainingExercise exerciseTraining;

  const ExerciseCard({
    super.key,
    required this.exerciseTraining,
    required this.cardWidth,
    required this.cardHight,
    required this.text,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardHight,
      child: InkWell(
        onTap: () {
          securePrint("[orsa1] ${exerciseTraining.description}");
          context.pushNamed(RoutesName.exerciseDetails,
              extra: exerciseTraining);
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fill,
                  )),
            ),
            Container(
              width: double.infinity,
              height: cardHight * 0.4,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    // Color.fromARGB(255, 13, 136, 161),
                    // Color.fromARGB(199, 19, 161, 189),
                    // Color.fromARGB(149, 32, 193, 225),
                    // Color.fromARGB(99, 42, 198, 229),
                    // Color.fromARGB(49, 69, 218, 248),
                    // Color.fromARGB(0, 85, 162, 230),
                    Color.fromARGB(255, 18, 35, 49),
                    Color.fromARGB(190, 110, 135, 158),
                    Color.fromARGB(10, 181, 192, 202),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: cardHight * 0.06,
                  )
                ],
              ),
            ),
          ],
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

class OpenYouTubeVideo extends StatelessWidget {
  final String videoUrl;

  const OpenYouTubeVideo({super.key, required this.videoUrl});

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _launchURL(videoUrl);
      },
      icon: const Icon(
        Icons.image_search,
        color: Colors.white,
      ),
    );
  }
}

class OpenVideo extends StatefulWidget {
  const OpenVideo({super.key});

  @override
  State<OpenVideo> createState() => _OpenVideoState();
}

class _OpenVideoState extends State<OpenVideo> {
  late VideoPlayerController _controller;
  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();

    // ignore: deprecated_member_use
    _controller = VideoPlayerController.asset(
      'assets/videos/video.mp4', // Replace with your video URL or asset path
    )..initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(_controller),
                    _ControlsOverlay(controller: _controller),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              )
            : const CircularProgressIndicator(), // Show loading spinner until the video is initialized
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : const ColoredBox(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}

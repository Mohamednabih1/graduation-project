import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/domain/classes/trainings/training.dart';
import 'package:gradproject/presentation/ui/exercise/view/exercise_view.dart';
import 'package:gradproject/presentation/ui/exercise_details/view/exercise_details.dart';
import 'package:gradproject/presentation/ui/getStarted/view/getStart.dart';
import 'package:gradproject/presentation/ui/home_page/view/home.dart';
import 'package:gradproject/presentation/ui/login_page/view/login.dart';
import 'package:gradproject/presentation/ui/profile/view/profile.dart';
import 'package:gradproject/presentation/ui/real_time_chat/view/RTC.dart';
import 'package:gradproject/presentation/ui/setUserData/view/set_user_data.dart';
import 'package:gradproject/presentation/ui/sign_up/view/sign_up.dart';
import 'package:gradproject/presentation/ui/splash_page/view/splash_page.dart';
import 'package:gradproject/presentation/ui/doctor_home_page/view/doctor_home_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter();
  late final router = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: RoutesPath.signUp,
    routes: [
      GoRoute(
        name: RoutesName.splash,
        path: RoutesPath.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: RoutesName.login,
        path: RoutesPath.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: RoutesName.home,
        path: RoutesPath.home,
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        name: RoutesName.doctorHome,
        path: RoutesPath.doctorHome,
        builder: (context, state) => const DrHomePage(),
      ),
      GoRoute(
        name: RoutesName.signUp,
        path: RoutesPath.signUp,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: RoutesName.getStarted,
        path: RoutesPath.getStarted,
        builder: (context, state) => const GetStarted(),
      ),
      GoRoute(
        name: RoutesName.setUserData,
        path: RoutesPath.setUserData,
        builder: (context, state) => const SetUserData(),
      ),
      GoRoute(
        name: RoutesName.profile,
        path: RoutesPath.profile,
        builder: (context, state) => const Profile(),
      ),
      // GoRoute(
      //   name: RoutesName.rtc,
      //   path: RoutesPath.rtc,
      //   builder: (context, state) => const RTC(),
      // ),
      GoRoute(
          name: RoutesName.rtc,
          path: RoutesPath.rtc,
          builder: (context, state) {
            String userId = state.extra as String;
            return RTC(userId: userId);
          }),
      GoRoute(
          name: RoutesName.exercise,
          path: RoutesPath.exercise,
          builder: (context, state) {
            Training training = state.extra as Training;
            return ExerciseView(training: training);
          }),
      GoRoute(
          name: RoutesName.exerciseDetails,
          path: RoutesPath.exerciseDetails,
          builder: (context, state) {
            TrainingExercise trainingExercise = state.extra as TrainingExercise;
            return ExerciseDetails(trainingExercise: trainingExercise);
          }),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
  );
}

import 'package:gradproject/presentation/ui/dashboard_page/model/health_model.dart';

class HealthDetails {
  final healthData = const [
    HealthModel(
        icon: 'assets/icons/burn.png', value: "4", title: "Daily Streaks"),
    HealthModel(
      icon: 'assets/icons/checked.png', value: "9", title: "Completed Exercises"),
    //HealthModel(
        //icon: 'assets/icons/distance.png', value: "7km", title: "Distance"),
   // HealthModel(icon: 'assets/icons/sleep.png', value: "7h48m", title: "Sleep"),
  ];
}
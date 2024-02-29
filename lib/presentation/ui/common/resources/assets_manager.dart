// import 'package:rimpulseandroidwatch/app/di.dart';
// import 'package:rimpulseandroidwatch/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';

// const imagePath = "assets/images";
// const jsonPath = "assets/images/json";

// class ImageAssets {
//   // static const splashLogo = "$imagePath/splash_logo.png";
//   // static const String onboardingLogo1 = "$imagePath/onboarding_logo1.svg";
//   // static const String onboardingLogo2 = "$imagePath/onboarding_logo2.svg";
//   // static const String onboardingLogo3 = "$imagePath/onboarding_logo3.svg";
//   // static const String onboardingLogo4 = "$imagePath/onboarding_logo4.svg";
//   // static const String hollowCircleIc = "$imagePath/hollow_circle_ic.svg";
//   // static const String solidCircleIc = "$imagePath/solid_circle_ic.svg";
//   // static const String leftArrowIc = "$imagePath/left_arrow_ic.svg";
//   // static const String rightArrowIc = "$imagePath/right_arrow_ic.svg";
//   // static const String photoCameraIc = "$imagePath/photo-camera.svg";
//   // static const String changeLangIc = "$imagePath/change_lang_ic.svg";
//   // static const String contactUsIc = "$imagePath/contact_us_ic.svg";
//   // static const String inviteFriendsIc = "$imagePath/invite_friends_ic.svg";
//   // static const String logoutIc = "$imagePath/logout_ic.svg";
//   // static const String rightArrowSettingsIc =
//   //     "$imagePath/right_arrow_settings_ic.svg";

//   static const doubleCheckMark = "images/doubleCheck.png";
// }

// class JsonAssets {
//   static const String loading = "$jsonPath/loading.json";
//   static const String loadingPulse = "$jsonPath/loadingPuslse.json";
//   static const String loadingPulseNew = "$jsonPath/loadingPuslseNew.json";
//   static const String error = "$jsonPath/error.json";
//   static const String error2 = "$jsonPath/error2.json";
//   static const String empty = "$jsonPath/empty.json";
//   static const String success = "$jsonPath/success.json";
//   static const String noConnection = "$jsonPath/noConnection.json";
// }

// /*
// app images logo and so on
//  */

// class AssetPath {
//   static String heartbeat = "images/heartbeat.png";
//   static String logo = "images/logo.png";
//   static String wristBand = "images/pngWristband4.png";
//   static String logo2 = "images/rimpulse.png";
//   static String logo2Cropped = "images/rimpulseCropped.png";
//   static String logo3 = "images/logo_white.png";
//   static String lastPatient = "images/lastPatient.png";
//   static String accident = "images/accident.png";
// }

// /*
// get's the user images 
//  */
// class ImagesString {
//   static String get girlImage => "images/girl.png";
//   static String get womanImage => "images/woman.png";
//   static String get grandMaImage => "images/old-woman.png";
//   static String get boyImage => "images/boy.png";
//   static String get manImage => "images/man.png";
//   static String get grandPaImage => "images/grandfather.png";
//   static String get otherImage => "images/other.png";
// }

// /*
// gets the device image
//  */
// class DevicesImageString {
//   static String get ecgImage => "images/ecg.png";
//   static String get noninImage => "images/nonin.png";
// }

// /*
// gets the staff image upon the role
//  */
// class StaffImagesString {
//   static String? checkRole(userRole) {
//     // var userRole = await SharedPreferenceData.getUserRolePreference();
//     final AppCache _appPreferences = DI.getItInstance<AppCache>();

//     var gender = _appPreferences.getUserGenderPreference();
//     String? staffRoleImage;
//     if (userRole == 3 && gender == 1) {
//       staffRoleImage = "images/paramedic.png";
//     } else if (userRole == 3 && gender == 2) {
//       staffRoleImage = "images/nurse.png";
//     } else if (userRole == 3 && gender == 3) {
//       staffRoleImage = ImagesString.otherImage;
//     } else if (userRole == 5 && gender == 1) {
//       staffRoleImage = "images/male-doctor.png";
//     } else if (userRole == 5 && gender == 2) {
//       staffRoleImage = "images/female-doctor.png";
//     } else if (userRole == 5 && gender == 3) {
//       staffRoleImage = ImagesString.otherImage;
//     } else if (userRole == 8 || userRole == 9 && gender == 1) {
//       staffRoleImage = "images/admin.png";
//     } else if (userRole == 8 || userRole == 9 && gender == 2) {
//       staffRoleImage = "images/female-admin.png";
//     } else if (userRole == 8 || userRole == 9 && gender == 3) {
//       staffRoleImage = ImagesString.otherImage;
//     }
//     return staffRoleImage;
//   }

//   static getAllStaff(int? gender, int? userRole) {
//     String staffRoleImage;
//     if (userRole == 3 && gender == 1) {
//       staffRoleImage = "images/paramedic.png";
//     } else if (userRole == 3 && gender == 2) {
//       staffRoleImage = "images/nurse.png";
//     } else if (userRole == 3 && gender == 3) {
//       staffRoleImage = ImagesString.otherImage;
//     } else if (userRole == 5 && gender == 1) {
//       staffRoleImage = "images/male-doctor.png";
//     } else if (userRole == 5 && gender == 2) {
//       staffRoleImage = "images/female-doctor.png";
//     } else if (userRole == 5 && gender == 3) {
//       staffRoleImage = ImagesString.otherImage;
//     } else if ((userRole == 8 || userRole == 9) && gender == 1) {
//       staffRoleImage = "images/admin.png";
//     } else if ((userRole == 8 || userRole == 9) && gender == 2) {
//       staffRoleImage = "images/female-admin.png";
//     } else if ((userRole == 8 || userRole == 9) && gender == 3) {
//       staffRoleImage = ImagesString.otherImage;
//     } else {
//       staffRoleImage = ImagesString.otherImage;
//     }
//     return staffRoleImage;
//   }
// }

// /*
// return battery image upon it's current level
//  */
// class BatteryECGLevelImages {
//   static String criticalLowBattery = "images/criticalLowBattery1.png";
//   static String lowBattery = "images/lowBatteryLevel1.png";
//   static String midBattery = "images/MidBatteryLevel1.png";
//   static String fullBattery = "images/fullBattery1.png";
//   static String emptyBattery = "images/EmptyBatt.png";
//   static getBatteryLevelImage(int batteryLevel) {
//     late String batteryLevelImage;
//     // securePrint("ECG batteryLevel : ${batteryLevel}");
//     if (batteryLevel <= 2) {
//       batteryLevelImage = emptyBattery;
//     } else if (batteryLevel <= 7) {
//       batteryLevelImage = criticalLowBattery;
//     } else if (batteryLevel <= 22) {
//       batteryLevelImage = lowBattery;
//     } else if (batteryLevel <= 42) {
//       batteryLevelImage = midBattery;
//     } else if (batteryLevel <= 100) {
//       batteryLevelImage = fullBattery;
//     }
//     return batteryLevelImage;
//   }
// }

// class BatteryNonineLevelImages {
//   static String fullNonineBattery = "images/NonineFullBattery.png";
//   static String midNonineBattery = "images/NonineMidBattery.png";
//   static String lowNonineBattery = "images/NonineLowBattery.png";
//   static String emptyNonineBattery = "images/NonineEmptyBattery.png";
//   static getBatteryLevelImage(int batteryLevel) {
//     late String batteryLevelImage;
//     // securePrint("nonie batteryLevel : ${batteryLevel}");
//     if (batteryLevel <= 10) {
//       batteryLevelImage = lowNonineBattery;
//     } else if (batteryLevel <= 50) {
//       batteryLevelImage = midNonineBattery;
//     } else if (batteryLevel <= 100) {
//       batteryLevelImage = fullNonineBattery;
//     }
//     return batteryLevelImage;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String username;
  final String email;
  final String password;
  final String gender;
  final String height;
  final String weight;
  final String phoneNum;
  final String age;
  final String role;

  UserData({
    required this.username,
    required this.email,
    required this.password,
    required this.gender,
    required this.height,
    required this.weight,
    required this.phoneNum,
    required this.age,
    required this.role,
  });

  factory UserData.fromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      username: snapshot['username'] as String,
      email: snapshot['email'] as String,
      password: snapshot['password'] as String,
      gender: snapshot['gender'] as String,
      height: snapshot['height'] as String,
      weight: snapshot['weight'] as String,
      phoneNum: snapshot['phoneNum'] as String,
      age: snapshot['age'] as String,
      role: snapshot['role'] as String,
    );
  }
}

UserData? findByEmail(List<UserData> users, String targetEmail) {
  for (UserData user in users) {
    if (user.email == targetEmail) {
      return user;
    }
  }
  return null;
}

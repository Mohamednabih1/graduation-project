// ignore_for_file: file_names

import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/user.dart';
import 'package:gradproject/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

abstract class FireBaseManger {
  void start();
  void dispose();
  Future<FirebaseApp> fireBaseInit();
  Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext ctx,
  });
  Future<void> signUpWithUserAndPassword({
    required String email,
    required String password,
    required BuildContext ctx,
  });
  Future<void> addUserData({
    required String username,
    required String password,
    required String email,
    required String phoneNum,
    required String age,
    required String weight,
    required String height,
    required String gender,
    required String role,
  });

  Future<List<UserData>> getAllUserData();
  Future<String> uploadVideo(XFile pickedFile);
}

class FireBaseMangerImpl implements FireBaseManger {
  @override
  Future<FirebaseApp> fireBaseInit() async {
    FirebaseApp firebase = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return firebase;
  }

  @override
  Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext ctx,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        securePrint('No user found for the provided email.');
      }
    }

    return user;
  }

  @override
  Future<void> signUpWithUserAndPassword({
    required String email,
    required String password,
    required BuildContext ctx,
  }) async {
    final FirebaseAuth firebase = FirebaseAuth.instance;
    await firebase.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> addUserData({
    required String username,
    required String password,
    required String email,
    required String phoneNum,
    required String age,
    required String weight,
    required String height,
    required String gender,
    required String role,
  }) async {
    final FirebaseFirestore firebaseStorage = FirebaseFirestore.instance;
    var x = await firebaseStorage.collection("users").add({
      "username": username,
      "password": password,
      "email": email,
      "phoneNum": phoneNum,
      "age": age,
      "weight": weight,
      "height": height,
      "gender": gender,
      "role": role,
    });
    securePrint("[firebaseStorage] $x");
  }

  @override
  Future<List<UserData>> getAllUserData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      final snapshot = await firestore.collection('users').get();

      return snapshot.docs.map((doc) => UserData.fromSnapshot(doc)).toList();
    } catch (error) {
      securePrint(error.toString());
      return [];
    }
  }

  Future<UserData?> getUserById(String uid) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      final docSnapshot = await firestore.collection('users').doc(uid).get();
      if (docSnapshot.exists) {
        return UserData.fromSnapshot(docSnapshot);
      } else {
        return null;
      }
    } catch (error) {
      securePrint(error.toString());
      return null; // Handle error or return null
    }
  }

  @override
  Future<String> uploadVideo(XFile pickedFile) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('videos/${DateTime.now().millisecondsSinceEpoch}.mp4');

    try {
      await storageRef.putFile(File(pickedFile.path));
      final downloadUrl = await storageRef.getDownloadURL();
      securePrint('Video uploaded successfully. Download URL: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      securePrint('Error uploading video: $e');
      return "";
    }
  }

  @override
  void start() {}

  @override
  void dispose() {}
}

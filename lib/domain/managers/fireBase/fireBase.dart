import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/user.dart';
import 'package:gradproject/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  });

  Future getAllUserData();
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
    });
    securePrint("[OOBE] $x");
  }

  @override
  Future<List<UserData>> getAllUserData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      final snapshot = await firestore.collection('users').get();

      return snapshot.docs.map((doc) => UserData.fromSnapshot(doc)).toList();
    } catch (error) {
      securePrint(error.toString());
      return []; // Handle error or return an empty list
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
  void start() {}

  @override
  void dispose() {}
}

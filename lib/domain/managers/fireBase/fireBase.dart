import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseManger {
  void start();
  void dispose();
  Future<FirebaseApp> fireBaseInit();
  Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext ctx,
  });
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
  void start() {}

  @override
  void dispose() {}
}

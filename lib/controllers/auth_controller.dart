import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onco_app/controllers/user_controller.dart';
import 'package:onco_app/models/user_model.dart';
import 'package:onco_app/services/firestore_service.dart';

import '../pages/first_screen.dart';
import '../pages/my_bottom_navbar.dart';
import '../pages/home_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../services/firebase_auth_service.dart';
import '../services/my_utils.dart';

class AuthController extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();
  FirestoreService firestoreService = FirestoreService();

  final UserController userController = Get.find();

  checkUser() async {
    logger.d("in checkUser()");
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      debugPrint("firebaseUser null. LoginPage");
      userController.userModel = null;
      Get.offAll(() => const FirstScreen());
    } else {
      debugPrint("firebaseUser not null, fetching user from firestore");
      try {
        Get.log('User signed in: ${firebaseUser.email}');
        dismissProgressDialog();
        Get.snackbar('User signed in: ${firebaseUser.email}', "",
            snackPosition: SnackPosition.BOTTOM);
        Get.find<UserController>().getUserDocument(firebaseUser.uid);
        Get.offAll(() => MyBottomNavbar());
      } catch (e) {
        logger.d(e);
        throw Exception("error: $e");
      }
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      showProgressDialog();
      await _authService.signInWithEmailAndPassword(email, password);
      checkUser();
    } on FirebaseAuthException catch (e) {
      dismissProgressDialog();
      if (e.code == 'user-not-found') {
        Get.snackbar('Sign-In Failed', 'No user found for that email.',
            snackPosition: SnackPosition.BOTTOM);
        Get.log('Error signing in: $e');
      } else if (e.code == 'invalid-credential') {
        Get.snackbar('Sign-In Failed', 'Wrong credentials',
            snackPosition: SnackPosition.BOTTOM);
        Get.log('Error signing in: $e');
      }
    } catch (e) {
      print("Error signing in: $e");
      Get.snackbar('Sign-In Failed', 'Error occurred: $e',
          snackPosition: SnackPosition.BOTTOM);
      Get.log('Error signing in: $e');
      dismissProgressDialog();
    }
  }

  Future<void> signUp(
      String email, String password, String username, String phoneNo) async {
    try {
      showProgressDialog();
      User? user =
          await _authService.signUpWithEmailAndPassword(email, password);
      if (user != null) {
        UserModel userModel =
            UserModel(email: email, username: username, phoneNo: phoneNo);

        Get.log('User signed up: ${user.email}');
        try {
          await userController.saveUserData(user.uid, userModel);

          dismissProgressDialog();
          Get.snackbar('User signed in: ${user.email}', "",
              snackPosition: SnackPosition.BOTTOM);
          Get.offAll(() => MyBottomNavbar());
        } catch (e) {
          dismissProgressDialog();
          debugPrint('error while saving user data: $e');
        }
      }
    } on FirebaseAuthException catch (e) {
      dismissProgressDialog();

      if (e.code == 'weak-password') {
        Get.snackbar('Sign-Up Failed', 'The password provided is too weak.',
            snackPosition: SnackPosition.BOTTOM);
        Get.log('Sign-Up Failed: The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
            'Sign-Up Failed', 'The account already exists for that email.',
            snackPosition: SnackPosition.BOTTOM);
        Get.log('Sign-Up Failed: The account already exists for that email.');
      }
    } catch (e) {
      print("Error signing up:fs $e");
      dismissProgressDialog();

      Get.snackbar('Sign-Up Failed', 'Error occurred: $e',
          snackPosition: SnackPosition.BOTTOM);
      Get.log('Error signing up:dsd $e');
    }
  }

  Future<void> signOut() async {
    try {
      showProgressDialog();
      await _authService.signOut();
      checkUser();

      Get.log('User signed out');
      dismissProgressDialog();
      Get.snackbar('User signed out', '', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print("Error signing out: $e");
      Get.snackbar('Sign-Out Failed', 'Error occurred: $e',
          snackPosition: SnackPosition.BOTTOM);
      Get.log('Error signing out: $e');
      dismissProgressDialog();
    }
  }

  void showProgressDialog() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
      name: 'progressDialog',
    );
  }

  void dismissProgressDialog() {
    Get.back(
      closeOverlays: true,
    );
  }
}

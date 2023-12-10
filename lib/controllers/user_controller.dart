import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:onco_app/services/firestore_service.dart';

import '../constants.dart';
import '../models/poll_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  UserModel? userModel = UserModel();
  FirestoreService firestoreService = FirestoreService();

  void getUserDocument(String userId) async {
    try {
      userModel = await firestoreService.getUserDocument(userId);
      update([idHomePage]);
    } catch (e) {
      print(e);
    }
  }

  Future saveUserData(String userId, UserModel userModel) async {
    try {
      await firestoreService.saveUserData(userId, userModel.toJson());
      this.userModel = userModel;
      this.userModel!.userId = userId;
      update([idHomePage]);
    } catch (e) {
      print(e);
    }
  }
}

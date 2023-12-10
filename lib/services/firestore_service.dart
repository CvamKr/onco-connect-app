import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:onco_app/controllers/user_controller.dart';
import 'package:onco_app/models/user_model.dart';

import '../models/poll_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(
      String userId, Map<String, dynamic> userData) async {
    try {
      await _firestore.collection('users').doc(userId).set(userData);

      print('User data saved to Firestore');
    } catch (e) {
      print('Error saving user data: $e');
      rethrow;
    }
  }

  Future<UserModel?> getUserDocument(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        print('userDoc: ${userDoc.data().toString()}');
        return UserModel.fromJson(userDoc, userDoc.data()!);
      } else {
        print('User document does not exist');
        return null;
      }
    } catch (e) {
      print('Error retrieving user document: $e');
      rethrow;
    }
  }

  Future<PollModel?> getPollByQuestionNo(int questionNo) async {
    try {
      QuerySnapshot<Map<String, dynamic>> pollsSnapshot = await _firestore
          .collection('polls')
          .where('questionNo', isEqualTo: questionNo)
          .limit(1)
          .get();

      if (pollsSnapshot.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> pollDoc = pollsSnapshot.docs[0];
        PollModel poll = PollModel.fromJson(pollDoc, pollDoc.data()!);
        DocumentSnapshot<Map<String, dynamic>>? responseDoc = await _firestore
            .collection('polls')
            .doc(poll.pollId)
            .collection('responses')
            .doc(Get.find<UserController>().userModel!.userId)
            .get();

        if (responseDoc.exists) {
          poll = poll.copyWith(selectedOption: responseDoc['selectedOption']);
        }

        return poll;
      } else {
        print('No poll found for questionNo: $questionNo');
        return null;
      }
    } catch (e) {
      print('Error fetching poll by questionNo: $e');

      rethrow;
    }
  }

  Future<bool> saveUserResponse({
    required String userId,
    required String pollId,
    required String selectedOption,
  }) async {
    try {
      await _firestore
          .collection('polls')
          .doc(pollId)
          .collection('responses')
          .doc(userId)
          .set({
        'selectedOption': selectedOption,
      });

      print('User response saved successfully!');
      return true;
    } catch (e) {
      print('Error saving user response: $e');

      rethrow;
    }
  }
}

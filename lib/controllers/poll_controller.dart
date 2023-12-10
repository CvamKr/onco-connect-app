import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onco_app/controllers/user_controller.dart';
import 'package:onco_app/widgets/no_more_question.dart';

import '../constants.dart';
import '../models/poll_model.dart';
import '../services/firestore_service.dart';
import '../services/my_utils.dart';

class PollController extends GetxController {
  PollModel? pollModel = PollModel(options: []);
  FirestoreService firestoreService = FirestoreService();
  bool isLoading = false;

  getQuestionByNumber(int questionNo) async {
    isLoading = true;
    update([idPollCard]);

    try {
      PollModel? pollModel =
          await firestoreService.getPollByQuestionNo(questionNo);
      if (pollModel != null) {
        this.pollModel = pollModel;
      } else {
        Get.to(() => noMoreQuestionPage());
      }
      isLoading = false;
      update([idPollCard]);
    } catch (e) {
      Get.snackbar('Error', '$e', snackPosition: SnackPosition.BOTTOM);
      Get.log('Error: $e');
      isLoading = false;
      update([idPollCard]);
    }
  }

  Future<void> saveResponseToPollAndFetchNextQuestion() async {
    logger.d("userID: ${Get.find<UserController>().userModel!.userId}");
    logger.d("pollId: ${pollModel!.pollId}");

    try {
      await firestoreService.saveUserResponse(
        userId: Get.find<UserController>().userModel!.userId,
        pollId: pollModel!.pollId,
        selectedOption: pollModel!.selectedOption!,
      );
      Get.snackbar('Response Saved', '', snackPosition: SnackPosition.TOP);
      Get.log('Response Saved');

      getQuestionByNumber(pollModel!.questionNo + 1);
    } catch (e) {
      print('Error in saving response: $e');
    }
  }

  setButtonColor(String option) {
    Color color =
        pollModel!.selectedOption == option ? Colors.green : Colors.transparent;
    return color;
  }

  void selectOption(String option) {
    pollModel!.selectedOption = option;
    update([idPollCard]);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onco_app/controllers/poll_controller.dart';
import 'package:onco_app/widgets/poll_progress_bar.dart';
import 'package:onco_app/widgets/rounder_corner_image.dart';

import '../constants.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({super.key});

  final PollController pollController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PollController>(
        id: idPollCard,
        builder: (PollController pollController) {
          return pollController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        pollProgressBar(),
                        Text(
                            "${pollController.pollModel!.questionNo}/46 questions answered")
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    roundedCornerImage(),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pollController.pollModel!.question,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              buildOptions(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                  backgroundColor: Colors.teal,
                                  side: const BorderSide(
                                      color: Colors.teal, width: 2.0)),
                              onPressed: () {
                                if (pollController.pollModel!.selectedOption ==
                                    "") {
                                  Get.snackbar('Please select an Option', '',
                                      snackPosition: SnackPosition.BOTTOM);
                                  return;
                                }
                                pollController
                                    .saveResponseToPollAndFetchNextQuestion();
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ],
                );
        });
  }

  Column buildOptions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                side: BorderSide(
                    color: pollController
                        .setButtonColor(pollController.pollModel!.options[0]),
                    width: 2.0)),
            onPressed: () {
              pollController.selectOption(pollController.pollModel!.options[0]);
            },
            child: Text(
              pollController.pollModel!.options[0],
            )),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                side: BorderSide(
                    color: pollController
                        .setButtonColor(pollController.pollModel!.options[1]),
                    width: 2.0)),
            onPressed: () {
              pollController.selectOption(pollController.pollModel!.options[1]);
            },
            child: Text(
              pollController.pollModel!.options[1],
            )),
      ],
    );
  }
}

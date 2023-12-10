import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onco_app/controllers/auth_controller.dart';
import 'package:onco_app/controllers/poll_controller.dart';
import 'package:onco_app/pages/questions_page.dart';
import 'package:onco_app/pages/question_card.dart';
import 'package:onco_app/widgets/rounder_corner_image.dart';

import '../widgets/poll_progress_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final PollController pollController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Center(
          child: PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'logout') {
                Get.find<AuthController>().signOut();
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ),
        title: const Text("My OncoCheck"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://assets-global.website-files.com/619e8d2e8bd4838a9340a810/647c1064ebf1c6171bfd3a87_profile-picture-feature-1.webp"),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 750) {
              return Padding(
                  padding: const EdgeInsets.all(24),
                  child: homeScreen(context));
            } else {
              return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: MediaQuery.of(context).size.width * 0.30),
                  child: homeScreen(context));
            }
          },
        ),
      ),
    );
  }

  Widget homeScreen(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "Take Your Cancer Risk Assessment",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(
          height: 16,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Complete the questionnaire at your own pace",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                pollProgressBar(),
                const Text("1/46 questions answered")
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        roundedCornerImage(),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () async {
              Get.to(() => const QuestionPage());
              pollController.getQuestionByNumber(1);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
            ),
            child: const Text("Start", style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

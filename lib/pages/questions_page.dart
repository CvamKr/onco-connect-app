import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onco_app/pages/question_card.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: questionPage(context),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.35),
                  child: questionPage(context),
                );
              }
            },
          ),
        ));
  }

  Widget questionPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [QuestionCard()],
    );
  }
}

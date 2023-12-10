import 'package:flutter/material.dart';
import 'package:get/get.dart';

Scaffold noMoreQuestionPage() {
  return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("No more questions"),
          ),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Go back"))
        ],
      ));
}

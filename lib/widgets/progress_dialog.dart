
  import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
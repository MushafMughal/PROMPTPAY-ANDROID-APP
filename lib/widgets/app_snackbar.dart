import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController appSnackbar(String title, String message) {
  return Get.snackbar(
    title,
    message,
    colorText: Colors.white,
    backgroundColor: const Color(0xff0066FF),
    duration: const Duration(seconds: 3),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBar {
  static void show({
    required String title,
    required String message,
    Color? color,
    Widget? icon,
  }) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      icon: icon ??
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
      backgroundColor: color ?? Colors.red,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.only(top: 18, left: 12, right: 12),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

bulloakSnackbar(
    {required bool isError, required String message, int? duration}) {
  final snackBar = SnackBar(
    content: Text(message, style: const TextStyle(color: Colors.white)),
    duration: Duration(seconds: duration ?? 3),
    backgroundColor: isError ? Colors.redAccent : Colors.green[400],
  );

  return ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
}

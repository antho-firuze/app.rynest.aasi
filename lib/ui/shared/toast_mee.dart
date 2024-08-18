import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMee {
  static void info(String message) {
    Fluttertoast.showToast(
      backgroundColor: const Color(0xFF6B6B6B),
      msg: message,
    );
  }

  static void error(String message) {
    Fluttertoast.showToast(
      backgroundColor: const Color(0xFFE02525),
      msg: message,
    );
  }
}
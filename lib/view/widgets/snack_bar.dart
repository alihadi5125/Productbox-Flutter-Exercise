import 'package:flutter/material.dart';

snackBar({
  required BuildContext? context,
  required String? message,
}) {
  ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      content: Text(message!),
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 800),
      backgroundColor: Color(0xFF216583),
    ),
  );
}

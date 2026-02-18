import 'package:flutter/material.dart';
import 'package:movie/core/configs/theme/app_colors.dart';

class DisplayMessage {
  static void errorMessage(String message, BuildContext context) {
    var snackbar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.primary,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

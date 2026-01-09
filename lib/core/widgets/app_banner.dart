import 'package:flutter/material.dart';

class AppBanner {
  static void showSuccess(BuildContext context, {required String message}) {
    _show(context, message: message, backgroundColor: Colors.green);
  }

  static void showError(BuildContext context, {required String message}) {
    _show(context, message: message, backgroundColor: Colors.red);
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(
        MaterialBanner(
          content: Text(message, style: const TextStyle(color: Colors.white)),
          backgroundColor: backgroundColor,
          actions: const [SizedBox()],
        ),
      );
  }
}

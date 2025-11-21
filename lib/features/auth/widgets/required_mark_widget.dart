import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/app_colors.dart';

class RequiredMarkWidget extends StatelessWidget {
  const RequiredMarkWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: ' *\n', // \n for space with text form field
            style: const TextStyle(color: AppColors.orange),
          ),
        ],
      ),
    );
  }
}

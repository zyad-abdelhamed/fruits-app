import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/theme/app_colors.dart';

class RequiredMarkWidget extends StatelessWidget {
  const RequiredMarkWidget({
    super.key,
    required this.text,
    this.isRequired = true,
  });

  final String text;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: ' $getRequiredMark\n', // \n for space with text form field
            style: const TextStyle(color: AppColors.orange),
          ),
        ],
      ),
    );
  }

  String get getRequiredMark => isRequired ? AppStrings.requiredMark : '';
}

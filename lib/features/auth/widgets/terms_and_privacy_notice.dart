import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/app_colors.dart';

class TermsAndPrivacyNotice extends StatelessWidget {
  const TermsAndPrivacyNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By continue you agree to our ',
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: 'Terms of service',
            style: const TextStyle(
              color: AppColors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          const TextSpan(text: ' and our '),
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(
              color: AppColors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(AppStrings.termsAndConditions),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          AppStrings.termsAndConditionsText,
          textAlign: TextAlign.left,
          style: context.bodyMedium,
        ),
      ),
    );
  }
}

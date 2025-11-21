import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/responsive_extention.dart';

class FruitMarketTextWidget extends StatelessWidget {
  const FruitMarketTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.fruitsMarket,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: context.width * 0.08,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

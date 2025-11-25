import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/theme/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        ImagesRoutesConstants.addToCart,
        height: ConstantsValues.iconDefaultSize,
        width: ConstantsValues.iconDefaultSize,
      ),
    );
  }
}

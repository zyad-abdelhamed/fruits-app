import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/dashboard/models/seller_model.dart';

class SellerWidget extends StatelessWidget {
  const SellerWidget({
    super.key,
    required this.sellerModel,
    this.rowSpacing = 16.0,
    this.imageSize = 50.0,
  });

  final SellerModel sellerModel;
  final double rowSpacing, imageSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.isLandScape
          ? EdgeInsets.all(context.width * 0.4)
          : const EdgeInsets.all(0.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              // company logo
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  ImagesRoutesConstants.onboarding,
                  height: imageSize,
                  width: imageSize,
                ),
              ),

              SizedBox(width: rowSpacing),

              // seller data
              Expanded(child: SellerDataWidget(sellerModel: sellerModel)),
            ],
          ),
        ),
      ),
    );
  }
}

class SellerDataWidget extends StatelessWidget {
  const SellerDataWidget({
    super.key,
    required this.sellerModel,
    this.rowSpacing = 16.0,
  });

  final SellerModel sellerModel;
  final double rowSpacing;

  @override
  Widget build(BuildContext context) {
    final TextStyle headlineStyle = context.bodyLarge;
    final TextStyle dotTextStyle = headlineStyle.copyWith(
      color: Colors.grey,
      fontSize: 32.0,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(sellerModel.name, style: headlineStyle),
        Text(
          "${AppStrings.deliveryCharges} : ${sellerModel.deliveryCharges}",
          style: headlineStyle.copyWith(color: Colors.grey),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: rowSpacing,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Text(AppStrings.dot, style: dotTextStyle),
            Text(
              sellerModel.isOpen ? AppStrings.open : AppStrings.close,
              style: TextStyle(
                color: sellerModel.isOpen ? AppColors.green : AppColors.red,
              ),
            ),
            Text(AppStrings.dot, style: dotTextStyle),
            Text(
              sellerModel.productName,
              style: const TextStyle(color: AppColors.blueGrey),
            ),
          ],
        ),
      ],
    );
  }
}

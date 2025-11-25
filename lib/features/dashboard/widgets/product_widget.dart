import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/dashboard/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.productModel,
    required this.extraWidget,
    this.rowSpacing = 16.0,
    this.imageSize = 50.0,
  });

  final Widget extraWidget;
  final ProductModel productModel;
  final double rowSpacing, imageSize;

  @override
  Widget build(BuildContext context) {
    return Card(
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

            // Product data
            Expanded(child: ProductDataWidget(productModel: productModel)),
            // extera widget
            Expanded(child: extraWidget),
          ],
        ),
      ),
    );
  }
}

class ProductDataWidget extends StatelessWidget {
  const ProductDataWidget({
    super.key,
    required this.productModel,
    this.rowSpacing = 16.0,
  });

  final ProductModel productModel;
  final double rowSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(productModel.name, style: context.headlineSmall),
        Row(
          children: <Widget>[
            Text(productModel.price.toString(), style: context.labelLarge),
            const SizedBox(width: 8.0),
            Text(
              productModel.oldPrice.toString(),
              style: context.labelSmall.copyWith(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: 16.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFDF958F),
                borderRadius: BorderRadius.circular(
                  ConstantsValues.fullCircularRadius,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                "up to ${productModel.discount.toString()} off",
                style: context.labelSmall.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

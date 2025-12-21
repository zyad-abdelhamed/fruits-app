import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/dashboard/models/product_model.dart';
import 'package:fruits_app/features/dashboard/views/product_details_view.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.productModel,
    required this.extraWidget,
    this.rowSpacing = 12.0,
    this.imageSize = 40.0,
  });

  final Widget extraWidget;
  final ProductModel productModel;
  final double rowSpacing, imageSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProductDetailsView()),
        );
      },
      child: SizedBox(
        height: 100.0,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // logo
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

                // product info
                Expanded(child: ProductDataWidget(productModel: productModel)),

                SizedBox(width: rowSpacing),

                // extra widget
                Align(
                  alignment: Alignment.centerRight,
                  child: FittedBox(fit: BoxFit.scaleDown, child: extraWidget),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDataWidget extends StatelessWidget {
  const ProductDataWidget({
    super.key,
    required this.productModel,
    this.rowSpacing = 12.0,
  });

  final ProductModel productModel;
  final double rowSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          productModel.name,
          style: context.titleMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        Row(
          children: <Widget>[
            Text(productModel.price.toString(), style: context.labelLarge),

            const SizedBox(width: 8),

            Text(
              productModel.oldPrice.toString(),
              style: context.labelSmall.copyWith(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),

            const SizedBox(width: 10),

            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFDF958F),
                  borderRadius: BorderRadius.circular(
                    ConstantsValues.fullCircularRadius,
                  ),
                ),
                child: Text(
                  "up to ${productModel.discount} off",
                  style: context.labelSmall.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

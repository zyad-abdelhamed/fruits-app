import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/dashboard/models/product_model.dart';
import 'package:fruits_app/features/dashboard/models/seller_model.dart';
import 'package:fruits_app/features/dashboard/widgets/add_to_cart_button.dart';
import 'package:fruits_app/features/dashboard/widgets/categories_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/product_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/seller_widget.dart';

class SellerView extends StatelessWidget {
  const SellerView({super.key, required this.seller});

  final SellerModel seller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text(AppStrings.fruitsMarket),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.0,
          children: [
            Center(child: SellerWidget(sellerModel: seller)),

            Text('Categories', style: context.titleMedium),
            SizedBox(height: 100.0, child: CategoriesWidget(radius: 16.0)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Products', style: context.titleMedium),
                IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
              ],
            ),

            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(
                10,
                (index) => SizedBox(
                  width: context.isLandScape
                      ? (context.width * 0.5) - 24
                      : context.width - 16,
                  child: ProductWidget(
                    productModel: ProductModel(
                      name: 'Product',
                      image: ImagesRoutesConstants.splashScreen,
                      description: 'Description',
                      price: 12.00,
                      oldPrice: 14.00,
                      discount: 10,
                      quantity: 1,
                    ),
                    extraWidget: AddToCartButton(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

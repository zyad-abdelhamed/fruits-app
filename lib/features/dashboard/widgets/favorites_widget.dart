import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/features/dashboard/models/product_model.dart';
import 'package:fruits_app/features/dashboard/widgets/product_widget.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // app bar
        AppBar(
          automaticallyImplyLeading: false,
          title: const Text(AppStrings.favorite),
        ),

        // products
        Expanded(
          child: ListView.builder(
            padding: context.isLandScape
                ? EdgeInsets.symmetric(horizontal: context.width * 0.2)
                : null,
            physics: const BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (_, int i) => ProductWidget(
              productModel: ProductModel(
                name: 'Product $i',
                image: ImagesRoutesConstants.splashScreen,
                description: 'Description $i',
                price: 12.00,
                oldPrice: 14.00,
                discount: 10,
                quantity: 1,
              ),
              extraWidget: Align(
                alignment: Alignment.topRight,
                child: Card(
                  shape: const CircleBorder(),
                  child: const Icon(Icons.close),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

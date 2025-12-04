import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/features/dashboard/models/product_model.dart';
import 'package:fruits_app/features/dashboard/widgets/product_widget.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
        extraWidget: Card(
          shape: const CircleBorder(),
          child: const Icon(Icons.close),
        ),
      ),
    );
  }
}

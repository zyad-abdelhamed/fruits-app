import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/dashboard/models/product_model.dart';
import 'package:fruits_app/features/dashboard/views/check_out_view.dart';
import 'package:fruits_app/features/dashboard/widgets/cart_product_controls_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/dashed_divider.dart';
import 'package:fruits_app/features/dashboard/widgets/product_widget.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  double get shipping => 1.50;

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = [
      ProductModel(
        name: 'Wireless Headphones',
        image: ImagesRoutesConstants.splashScreen,
        description: 'High quality wireless headphones with noise cancellation',
        price: 12.00,
        oldPrice: 14.00,
        discount: 10, // نسبة الخصم %
        quantity: 1,
      ),
      ProductModel(
        name: 'Smart Watch',
        image: ImagesRoutesConstants.splashScreen,
        description: 'Elegant smartwatch with health tracking features',
        price: 12.00,
        oldPrice: 14.00,
        discount: 10,
        quantity: 1,
      ),
    ];
    return Column(
      children: [
        // app bar
        AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppStrings.basket),
        ),

        const SizedBox(height: 8.0),

        // products
        Expanded(
          child: ListView.builder(
            padding: context.isLandScape
                ? EdgeInsets.symmetric(horizontal: context.width * 0.2)
                : null,
            itemCount: products.length,
            itemBuilder: (_, int i) {
              final product = products[i];
              return ProductWidget(
                productModel: product,
                extraWidget: CartProductControlsWidget(onDeletePressed: () {}),
              );
            },
          ),
        ),

        const DashedDivider(),

        // total
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Subtotal: ${subtotal(products).toStringAsFixed(2)} KD"),
              Text("Shipping: ${shipping.toStringAsFixed(2)} KD"),
              const Divider(),
              Text(
                "Total: ${bagTotal(subtotal(products))} KD",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // checkout
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 8.0,
              mainAxisSize: MainAxisSize.min,
              children: <Text>[
                Text(
                  "4 items in cart",
                  style: context.bodySmall.copyWith(color: Colors.grey),
                ),
                Text("3.50 KD", style: context.bodyLarge),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CheckOutView()),
                );
              },
              child: Text(AppStrings.proceedToCheckout),
            ),
          ],
        ),
      ],
    );
  }

  // helper methods
  double subtotal(List<ProductModel> products) {
    double total = 0;
    for (ProductModel p in products) {
      total += p.price * p.quantity;
    }
    return total;
  }

  String bagTotal(double subtotal) => (subtotal + shipping).toStringAsFixed(2);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/vendors_cubit.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/vendors_state.dart';
import 'package:fruits_app/features/dashboard/widgets/product_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/add_to_cart_button.dart';
import 'package:fruits_app/features/dashboard/models/product_model.dart';

class VendorProductsWidget extends StatelessWidget {
  const VendorProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorCubit, VendorState>(
      builder: (context, state) {
        if (state is VendorLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is VendorProductsLoaded) {
          final products = state.products;

          if (products.isEmpty) {
            return const Center(child: Text("No products available"));
          }

          return Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: products.map((product) {
              return SizedBox(
                width: context.isLandScape
                    ? (context.width * 0.5) - 24
                    : context.width - 16,
                child: ProductWidget(
                  productModel: ProductModel(
                    name: product.name,
                    image: product.img.isNotEmpty
                        ? product.img
                        : ImagesRoutesConstants.splashScreen,
                    description: product.details,
                    price: product.price,
                    oldPrice: product.priceAfterDiscount,
                    discount: 0.0,
                    quantity: 3,
                  ),
                  extraWidget: AddToCartButton(),
                ),
              );
            }).toList(),
          );
        }

        if (state is VendorError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }
}

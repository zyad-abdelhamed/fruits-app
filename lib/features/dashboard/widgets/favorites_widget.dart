import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/features/dashboard/models/product_model.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/favorite_cubit.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/favorite_state.dart';
import 'package:fruits_app/features/dashboard/widgets/product_widget.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar
        AppBar(
          automaticallyImplyLeading: false,
          title: const Text(AppStrings.favorite),
        ),

        // Products section with BlocBuilder
        Expanded(
          child: BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
              if (state is FavouriteLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is FavouriteError) {
                return Center(child: Text(state.message));
              }

              if (state is FavouritesLoaded) {
                final favourites = state.favourites;

                if (favourites.isEmpty) {
                  return const Center(child: Text("No favourites yet"));
                }

                return ListView.builder(
                  padding: context.isLandScape
                      ? EdgeInsets.symmetric(horizontal: context.width * 0.2)
                      : null,
                  physics: const BouncingScrollPhysics(),
                  itemCount: favourites.length,
                  itemBuilder: (_, int i) {
                    if (favourites.isEmpty) {
                      return Expanded(
                        child: const Center(child: Text("No favourites yet")),
                      );
                    }

                    final fav = favourites[i];
                    return ProductWidget(
                      productModel: ProductModel(
                        name: fav.product.name,
                        image: fav.product.img.isNotEmpty
                            ? fav.product.img
                            : ImagesRoutesConstants.splashScreen,
                        description: fav.product.details,
                        price: fav.priceWithDiscount,
                        oldPrice: fav.product.price,
                        discount: fav.product.discount.ceilToDouble(),
                        quantity: 3,
                      ),
                      extraWidget: Align(
                        alignment: Alignment.topRight,
                        child: Card(
                          shape: const CircleBorder(),
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              // Remove favourite
                              context.read<FavouriteCubit>().toggleFavourite(
                                fav.id,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}

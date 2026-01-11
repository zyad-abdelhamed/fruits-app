import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/vendors_cubit.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/vendors_state.dart';
import 'package:fruits_app/features/dashboard/widgets/seller_widget.dart';

class SellersWidget extends StatelessWidget {
  const SellersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorCubit, VendorState>(
      builder: (context, state) {
        if (state is VendorLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is VendorsLoaded) {
          final vendors = state.vendors;

          return SliverList(
            delegate: SliverChildBuilderDelegate((_, int i) {
              /// HEADER
              if (i == 0) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.sellers, style: context.titleMedium),
                    TextButton(
                      onPressed: () {
                        /// TODO: Navigate to all sellers
                      },
                      child: Text(
                        AppStrings.showAll,
                        style: context.titleMedium.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ],
                );
              }

              final vendor = vendors[i - 1];

              return Center(
                child: SizedBox(
                  width: context.isPotrait
                      ? double.infinity
                      : context.width * 0.6,
                  child: SellerWidget(sellerModel: vendor),
                ),
              );
            }, childCount: vendors.length + 1),
          );
        }

        if (state is VendorError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}

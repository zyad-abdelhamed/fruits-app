import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/dashboard/models/seller_model.dart';
import 'package:fruits_app/features/dashboard/widgets/seller_widget.dart';

class SellersWidget extends StatelessWidget {
  const SellersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((_, int i) {
        if (i == 0) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.sellers, style: context.titleMedium),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.showAll,
                  style: context.titleMedium.copyWith(color: AppColors.blue),
                ),
              ),
            ],
          );
        }

        return Center(
          child: SizedBox(
            width: context.isPotrait ? double.infinity : context.width * 0.6,
            child: SellerWidget(
              sellerModel: SellerModel(
                name: 'Seller Name',
                deliveryCharges: "15.0",
                productName: 'pizza',
                isOpen: true,
              ),
            ),
          ),
        );
      }, childCount: 6),
    );
  }
}

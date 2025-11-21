import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
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
              Text(
                AppStrings.sellers,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.showAll,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: AppColors.blue),
                ),
              ),
            ],
          );
        }

        return SellerWidget(
          sellerModel: SellerModel(
            name: 'سوق الفواكه الطازجة',
            deliveryCharges: "15.0",
            productName: 'تفاح أحمر عضوي',
            isOpen: true,
          ),
        );
      }, childCount: 6),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/dashboard/views/seller_view.dart';
import '../models/vendor_model.dart';

class SellerWidget extends StatelessWidget {
  const SellerWidget({
    super.key,
    required this.sellerModel,
    this.rowSpacing = 16.0,
    this.imageSize = 50.0,
  });

  final VendorModel sellerModel;
  final double rowSpacing, imageSize;

  bool get isOpen => sellerModel.isOpened == 'Y';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isPotrait ? double.infinity : context.width * 0.6,
      height: 100,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SellerView(seller: sellerModel)),
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                /// COMPANY LOGO
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

                /// SELLER DATA
                Expanded(child: SellerDataWidget(sellerModel: sellerModel)),

                /// RATE + DISTANCE (STATIC)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(sellerModel.rate, style: context.bodyMedium),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          '2.5 km', // ثابت
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        Icon(
                          Icons.location_on,
                          color: AppColors.primaryColor,
                          size: context.bodyMedium.fontSize,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SellerDataWidget extends StatelessWidget {
  const SellerDataWidget({super.key, required this.sellerModel});

  final VendorModel sellerModel;

  bool get isOpen => sellerModel.isOpened == 'Y';

  @override
  Widget build(BuildContext context) {
    final TextStyle headlineStyle = context.bodyLarge;
    final TextStyle dotTextStyle = headlineStyle.copyWith(color: Colors.grey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        /// NAME
        Text(sellerModel.name, style: headlineStyle),

        /// DELIVERY CHARGES (ثابت)
        const SizedBox(height: 4),
        const Text(
          "${AppStrings.deliveryCharges} : 15 EGP",
          maxLines: 1,
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 4),
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(AppStrings.dot, style: dotTextStyle),

              /// OPEN / CLOSE
              Text(
                isOpen ? AppStrings.open : AppStrings.close,
                style: TextStyle(
                  color: isOpen ? AppColors.green : AppColors.red,
                ),
              ),

              Text(AppStrings.dot, style: dotTextStyle),

              /// PRODUCT NAME (ثابت)
              const Text(
                'Groceries',
                style: TextStyle(color: AppColors.blueGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

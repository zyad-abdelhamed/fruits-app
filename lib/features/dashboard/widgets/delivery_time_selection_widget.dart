import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';

class DeliveryTimeSelectionWidget extends StatefulWidget {
  const DeliveryTimeSelectionWidget({super.key});

  @override
  State<DeliveryTimeSelectionWidget> createState() =>
      _DeliveryTimeSelectionWidgetState();
}

class _DeliveryTimeSelectionWidgetState
    extends State<DeliveryTimeSelectionWidget> {
  bool isNow = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ===== Now Card =====
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Now", style: context.titleMedium),
              Switch(
                value: isNow,
                onChanged: (v) => setState(() => isNow = v),
                activeColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// ===== Select Delivery Time Card =====
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: context.isLandScape
              ? Row(
                  children: [
                    /// LEFT
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Select Delivery Time",
                                style: context.titleMedium,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.check_circle,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text("Select Date", style: context.bodyMedium),
                        ],
                      ),
                    ),

                    const SizedBox(width: 24),

                    /// RIGHT (Date)
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "09 - 15 - 2021",
                              style: context.bodyMedium.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              /// ===== Portrait =====
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Delivery Time",
                          style: context.titleMedium,
                        ),
                        Icon(Icons.check_circle, color: AppColors.primaryColor),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text("Select Date", style: context.bodyMedium),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "09 - 15 - 2021",
                          style: context.bodyMedium.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}

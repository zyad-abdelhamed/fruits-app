import 'package:flutter/material.dart' hide BackButton;
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/widgets/back_button.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المنتج'),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // بانر المنتج
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ConstantsValues.cardBorderRadius,
                  ),
                  child: Image.asset(
                    ImagesRoutesConstants.splashScreen,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(
                        ConstantsValues.fullCircularRadius,
                      ),
                    ),
                    child: const Text(
                      '10% off discount',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Text(
                  'Category name',
                  style: TextTheme.of(context).bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),

                Expanded(
                  child: Text(
                    'price',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            // اسم المنتج والسعر
            Row(
              children: [
                Text(
                  'product name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text('KD 12.00', style: TextTheme.of(context).bodyLarge),
                const SizedBox(width: 16),
                const Text(
                  'KD 14.00',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.orange,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // وصف المنتج
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),

            const SizedBox(height: 12),

            // اسم البائع
            Align(
              alignment: Alignment.centerLeft,
              child: const Text('sell per: Kartoon'),
            ),

            const SizedBox(height: 24),

            // اختيار الوزن
            ExpansionTile(
              title: const Text("Select weight"),
              children: [
                _WeightOption(label: '50 Gram', price: 'KD 4.00'),
                _WeightOption(label: '1 Kg', price: 'KD 6.25'),
                _WeightOption(label: '2 Kg', price: 'KD 12.00'),
              ],
            ),

            const SizedBox(height: 24),

            // الإضافات
            ExpansionTile(
              title: const Text("Select Addons"),
              children: [
                _WeightOption(label: '50 Gram', price: 'KD 4.00'),
                _WeightOption(label: '1 Kg', price: 'KD 6.25'),
              ],
            ),

            const SizedBox(height: 32),

            // زر الإضافة للسلة
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add_shopping_cart),
                  const SizedBox(width: 8),
                  const Text('أضف إلى السلة'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// عنصر اختيار الوزن أو الإضافة
class _WeightOption extends StatelessWidget {
  final String label;
  final String price;

  const _WeightOption({required this.label, required this.price});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label - $price'),
      backgroundColor: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}

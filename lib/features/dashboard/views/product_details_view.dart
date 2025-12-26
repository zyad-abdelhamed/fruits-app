import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/dashboard/models/option_group_model.dart';
import 'package:fruits_app/features/dashboard/widgets/radio_options_tile.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  String? selectedWeight;
  String? selectedAddon;

  final List<OptionGroupModel> weightOptions = const [
    OptionGroupModel(label: '50 Gram', price: 'KD 4.00', value: '50g'),
    OptionGroupModel(label: '1 Kg', price: 'KD 6.25', value: '1kg'),
    OptionGroupModel(label: '2 Kg', price: 'KD 12.00', value: '2kg'),
  ];

  final List<OptionGroupModel> addonOptions = const [
    OptionGroupModel(label: 'Extra Sugar', price: 'KD 1.00', value: 'sugar'),
    OptionGroupModel(label: 'Extra Ice', price: 'KD 0.50', value: 'ice'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المنتج'),
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _productBanner(),
            const SizedBox(height: 24),

            OptionGroupWidget(options: weightOptions, title: 'Select Weight'),

            const SizedBox(height: 16),

            OptionGroupWidget(options: addonOptions, title: 'Select Addon'),

            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                debugPrint('Weight: $selectedWeight');
                debugPrint('Addon: $selectedAddon');
              },
              child: const Text('أضف إلى السلة'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ConstantsValues.cardBorderRadius),
      child: Image.asset(
        ImagesRoutesConstants.splashScreen,
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

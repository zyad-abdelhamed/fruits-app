import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/features/dashboard/widgets/delivery_time_selection_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/order_summrey_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/select_address_delivery_widget.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({super.key, required PageController pageController})
    : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.isLandScape ? 40 : 20,
        vertical: 16,
      ),
      child: PageView(
        controller: _pageController,
        children: const [
          DeliveryTimeSelectionWidget(),
          SelectAddressDeliveryWidget(),
          OrderSummaryWidget(
            totalItems: 4,
            subtotal: 36.00,
            shipping: 1.50,
            total: 37.50,
          ),
        ],
      ),
    );
  }
}

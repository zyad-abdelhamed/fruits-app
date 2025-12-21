import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/dashboard/widgets/coupon_code_widget.dart';

class OrderSummaryWidget extends StatefulWidget {
  final int totalItems;
  final double subtotal;
  final double shipping;
  final double total;

  const OrderSummaryWidget({
    super.key,
    required this.totalItems,
    required this.subtotal,
    required this.shipping,
    required this.total,
  });

  @override
  State<OrderSummaryWidget> createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget> {
  int selectedPaymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== Coupon =====
          CouponCodeWidget(onApply: () {}),

          const SizedBox(height: 24),

          /// ===== Order Details =====
          Text(
            'Order Details',
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          _row('Total Items', '${widget.totalItems} Items in cart'),
          _row('Subtotal', '${widget.subtotal.toStringAsFixed(2)} KD'),
          _row('Shipping Charges', '${widget.shipping.toStringAsFixed(2)} KD'),

          const Divider(thickness: 1, height: 32),

          _row(
            'Bag Total',
            '${widget.total.toStringAsFixed(2)} KD',
            isTotal: true,
          ),

          const SizedBox(height: 24),

          /// ===== Payment =====
          Text(
            'Payment',
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          _paymentMethodTile(
            index: 1,
            title: 'Credit / Debit Card',
            icon: Icons.credit_card,
          ),

          const SizedBox(height: 12),

          _paymentMethodTile(
            index: 0,
            title: 'Cash on Delivery',
            icon: Icons.money,
          ),

          const SizedBox(height: 12),

          _paymentMethodTile(
            index: 2,
            title: 'Wallet',
            icon: Icons.account_balance_wallet,
          ),
        ],
      ),
    );
  }

  /// ===== Row =====
  Widget _row(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isTotal ? AppColors.primaryColor : Colors.grey,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: isTotal ? AppColors.primaryColor : Colors.black,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  /// ===== Payment Tile =====
  Widget _paymentMethodTile({
    required int index,
    required String title,
    required IconData icon,
  }) {
    final isSelected = selectedPaymentIndex == index;

    return InkWell(
      onTap: () => setState(() => selectedPaymentIndex = index),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryColor : Colors.grey,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: context.bodyLarge)),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? AppColors.primaryColor : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

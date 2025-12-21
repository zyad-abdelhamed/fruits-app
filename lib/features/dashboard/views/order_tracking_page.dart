import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/core/widgets/back_button.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final statuses = [
      OrderStatus(
        title: "Delivered",
        subtitle: "Estimated for 10 September, 2021",
        isCompleted: false,
      ),
      OrderStatus(
        title: "Out for delivery",
        subtitle: "Estimated for 10 September, 2021",
        isCompleted: false,
      ),
      OrderStatus(
        title: "Order shipped",
        subtitle: "Estimated for 10 September, 2021",
        isCompleted: true,
      ),
      OrderStatus(
        title: "Confirmed",
        subtitle: "Your order has been confirmed",
        isCompleted: true,
      ),
      OrderStatus(
        title: "Order Placed",
        subtitle: "We have received your order",
        isCompleted: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text(AppStrings.orderTracking),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.isLandScape ? 24 : 30,
          vertical: 16,
        ),
        child: context.isLandScape
            ? _LandscapeLayout(statuses: statuses)
            : _PortraitLayout(statuses: statuses),
      ),
    );
  }
}

/// ================= PORTRAIT =================
class _PortraitLayout extends StatelessWidget {
  final List<OrderStatus> statuses;

  const _PortraitLayout({required this.statuses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _OrderInfo(),
        const SizedBox(height: 24),

        Expanded(
          child: ListView.builder(
            itemCount: statuses.length,
            itemBuilder: (context, index) {
              return OrderTimelineItem(
                status: statuses[index],
                showLine: index != statuses.length - 1,
              );
            },
          ),
        ),

        const SizedBox(height: 20),
        const _Actions(),
      ],
    );
  }
}

/// ================= LANDSCAPE =================
class _LandscapeLayout extends StatelessWidget {
  final List<OrderStatus> statuses;

  const _LandscapeLayout({required this.statuses});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// LEFT SIDE (Info + Buttons)
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [_OrderInfo(), _Actions()],
          ),
        ),

        const SizedBox(width: 24),

        /// RIGHT SIDE (Timeline)
        Expanded(
          flex: 6,
          child: ListView.builder(
            itemCount: statuses.length,
            itemBuilder: (context, index) {
              return OrderTimelineItem(
                status: statuses[index],
                showLine: index != statuses.length - 1,
              );
            },
          ),
        ),
      ],
    );
  }
}

/// ================= ORDER INFO =================
class _OrderInfo extends StatelessWidget {
  const _OrderInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Your Order Code: #882610",
          style: context.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text("3 items - 37.50 KD", style: context.headlineSmall),
        const SizedBox(height: 4),
        Text("Payment Method: Cash", style: context.headlineSmall),
      ],
    );
  }
}

/// ================= ACTIONS =================
class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(child: const Text(AppStrings.confirm), onPressed: () {}),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.red),
          child: const Text(AppStrings.cancelOrder),
        ),
      ],
    );
  }
}

/// ================= MODEL =================
class OrderStatus {
  final String title;
  final String subtitle;
  final bool isCompleted;

  OrderStatus({
    required this.title,
    required this.subtitle,
    required this.isCompleted,
  });
}

/// ================= TIMELINE ITEM =================
class OrderTimelineItem extends StatelessWidget {
  final OrderStatus status;
  final bool showLine;

  const OrderTimelineItem({
    super.key,
    required this.status,
    required this.showLine,
  });

  @override
  Widget build(BuildContext context) {
    final color = status.isCompleted ? Colors.green : Colors.grey;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Indicator + Line
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: status.isCompleted ? color : Colors.transparent,
                border: Border.all(color: color, width: 2),
                shape: BoxShape.circle,
              ),
            ),
            if (showLine) Container(width: 2, height: 50, color: color),
          ],
        ),

        const SizedBox(width: 12),

        /// Text
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.title,
                  style: context.headlineSmall.copyWith(color: color),
                ),
                const SizedBox(height: 4),
                Text(status.subtitle, style: context.headlineSmall),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

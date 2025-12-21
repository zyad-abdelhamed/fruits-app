import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/dashboard/views/order_tracking_page.dart';

class OrderItemWidget extends StatelessWidget {
  final String orderId;
  final String date;
  final int itemsCount;
  final OrderStatus status;
  final VoidCallback onTap;

  const OrderItemWidget({
    super.key,
    required this.orderId,
    required this.date,
    required this.itemsCount,
    required this.status,
    required this.onTap,
  });

  Color get statusColor {
    switch (status) {
      case OrderStatus.delivering:
        return Colors.orange;
      case OrderStatus.finished:
        return Colors.green;
      case OrderStatus.canceled:
        return Colors.red;
      case OrderStatus.working:
        return Colors.indigo;
      case OrderStatus.delivered:
        return Colors.purple;
      case OrderStatus.newOrder:
        return Colors.lightBlue;
    }
  }

  IconData get statusIcon {
    switch (status) {
      case OrderStatus.delivering:
        return Icons.local_shipping;
      case OrderStatus.finished:
        return Icons.done;
      case OrderStatus.canceled:
        return Icons.cancel;
      case OrderStatus.working:
        return Icons.work;
      case OrderStatus.delivered:
        return Icons.home_rounded;
      case OrderStatus.newOrder:
        return Icons.fiber_new;
    }
  }

  String get statusText {
    switch (status) {
      case OrderStatus.delivering:
        return "Delivering";
      case OrderStatus.finished:
        return "Finished";
      case OrderStatus.canceled:
        return "Canceled";
      case OrderStatus.working:
        return "Working";
      case OrderStatus.delivered:
        return "Delivered";
      case OrderStatus.newOrder:
        return "New";
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = context.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(width > 500 ? 24 : 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width > 500 ? 22 : 16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 59,
              height: 59,
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(statusIcon, color: statusColor, size: 36),
            ),

            SizedBox(width: width > 500 ? 20 : 14),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(orderId, style: context.bodyLarge),
                  const SizedBox(height: 4),
                  Text(
                    "$date · $itemsCount items",
                    style: context.bodyLarge.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      text: "Status: ",
                      style: context.bodyLarge.copyWith(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: statusText,
                          style: context.bodyLarge.copyWith(color: statusColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderTrackingPage()),
                );
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum OrderStatus {
  delivering,
  finished,
  canceled,
  working,
  delivered,
  newOrder,
}

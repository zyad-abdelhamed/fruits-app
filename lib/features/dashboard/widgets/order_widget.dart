import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  final String orderNumber;
  final String date;
  final int itemsCount;
  final double? price;
  final OrderStatus status;

  const OrderItemWidget({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.itemsCount,
    required this.status,
    this.price,
  });

  // ألوان الحالة حسب الصورة
  Color _statusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.delivering:
        return Colors.orange;
      case OrderStatus.finished:
        return Colors.green;
      case OrderStatus.canceled:
        return Colors.red;
      case OrderStatus.working:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.blue;
      case OrderStatus.newOrder:
        return Colors.grey;
    }
  }

  String _statusText(OrderStatus status) {
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            price != null
                ? "#$orderNumber - ${price!.toStringAsFixed(0)} KD"
                : "#$orderNumber",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            "$date • $itemsCount items",
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Text(
                "Status: ",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              Text(
                _statusText(status),
                style: TextStyle(
                  fontSize: 14,
                  color: _statusColor(status),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
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
  newOrder, // سميته newOrder بدل new لأنه محجوز
}

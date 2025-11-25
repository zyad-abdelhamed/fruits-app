import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/features/dashboard/widgets/order_widget.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // app bar
        AppBar(leading: const BackButton(), title: Text(AppStrings.myOrders)),

        // orders
        Expanded(
          child: ListView(
            children: const [
              OrderItemWidget(
                orderNumber: "243188",
                date: "9 Sep",
                itemsCount: 4,
                price: 37,
                status: OrderStatus.delivering,
              ),
              OrderItemWidget(
                orderNumber: "882610",
                date: "8 Sep",
                itemsCount: 3,
                status: OrderStatus.finished,
              ),
              OrderItemWidget(
                orderNumber: "882610",
                date: "8 Sep",
                itemsCount: 3,
                status: OrderStatus.canceled,
              ),
              OrderItemWidget(
                orderNumber: "882610",
                date: "8 Sep",
                itemsCount: 3,
                status: OrderStatus.working,
              ),
              OrderItemWidget(
                orderNumber: "882610",
                date: "8 Sep",
                itemsCount: 3,
                status: OrderStatus.delivered,
              ),
              OrderItemWidget(
                orderNumber: "882610",
                date: "8 Sep",
                itemsCount: 3,
                status: OrderStatus.newOrder,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

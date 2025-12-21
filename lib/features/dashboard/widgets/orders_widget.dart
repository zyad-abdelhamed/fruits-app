import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/dashboard/widgets/order_item_widget.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // app bar
        AppBar(
          leading: const AppBackButton(),
          title: Text(AppStrings.myOrders),
        ),

        // orders
        Expanded(
          child: ListView(
            padding: context.isLandScape
                ? EdgeInsets.symmetric(horizontal: context.width * 0.2)
                : null,
            children: [
              OrderItemWidget(
                orderId: "243188",
                date: "9 Sep",
                itemsCount: 4,
                status: OrderStatus.delivering,
                onTap: () {},
              ),
              OrderItemWidget(
                orderId: "882610",
                date: "8 Sep",
                itemsCount: 3,
                status: OrderStatus.finished,
                onTap: () {},
              ),
              OrderItemWidget(
                orderId: "882611",
                date: "8 Sep",
                itemsCount: 3,
                status: OrderStatus.canceled,
                onTap: () {},
              ),
              OrderItemWidget(
                orderId: "882612",
                date: "8 Sep",
                itemsCount: 3,
                status: OrderStatus.working,
                onTap: () {},
              ),
              OrderItemWidget(
                orderId: "882613",
                date: "8 Sep",
                itemsCount: 3,
                status: OrderStatus.delivered,
                onTap: () {},
              ),
              OrderItemWidget(
                orderId: "882614",
                date: "8 Sep",
                itemsCount: 3,
                status: OrderStatus.newOrder,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

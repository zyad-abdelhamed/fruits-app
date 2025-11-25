import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';

class CartProductControlsWidget extends StatefulWidget {
  const CartProductControlsWidget({super.key, required this.onDeletePressed});

  final void Function() onDeletePressed;

  @override
  State<CartProductControlsWidget> createState() =>
      _CartProductControlsWidgetState();
}

class _CartProductControlsWidgetState extends State<CartProductControlsWidget> {
  late final ValueNotifier<int> quantityNotifier;

  @override
  void initState() {
    super.initState();
    quantityNotifier = ValueNotifier<int>(1);
  }

  @override
  void dispose() {
    quantityNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // delete button
        IconButton(
          onPressed: widget.onDeletePressed,
          icon: const Icon(Icons.delete_forever, color: Colors.black),
        ),

        // quantity controls
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ConstantsValues.fullCircularRadius,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => quantityNotifier.value--,
                icon: const Icon(Icons.remove, color: Colors.black),
              ),
              ValueListenableBuilder<int>(
                valueListenable: quantityNotifier,
                builder: (_, int quantity, __) => Text(
                  quantity.toString(),
                  style: context.headlineSmall.copyWith(color: Colors.grey),
                ),
              ),
              IconButton(
                onPressed: () => quantityNotifier.value++,
                icon: const Icon(Icons.add, color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

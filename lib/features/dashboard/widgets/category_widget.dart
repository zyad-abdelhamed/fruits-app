import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.name,
    required this.image,
    required this.size,
    this.radius = 32.0,
  });

  final String name, image;
  final double size, radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // name
              Text(name, style: const TextStyle(color: AppColors.primaryColor)),
              // image
              Expanded(child: Image.asset(image)),
            ],
          ),
        ),
      ),
    );
  }
}

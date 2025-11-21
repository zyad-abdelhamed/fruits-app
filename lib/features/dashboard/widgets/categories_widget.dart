import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/features/dashboard/widgets/category_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, this.size = 85.0});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return CategoryWidget(
            name: 'قهوة',
            image: ImagesRoutesConstants.splashScreen,
            size: size,
          );
        },
        itemCount: 10,
      ),
    );
  }
}

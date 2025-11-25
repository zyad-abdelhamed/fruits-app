import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;
  final double _spacing = 8.0;

  @override
  Widget build(BuildContext context) {
    final double imageSize = context.isLandScape
        ? context.height * 0.6
        : context.width * 0.6;

    return Column(
      spacing: _spacing,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: imageSize,
          width: imageSize,
        ),
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

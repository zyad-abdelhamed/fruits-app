import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';

class ProfileAvatar extends StatelessWidget {
  final double size;
  final Color circularBorderColor;
  final String name;
  final Widget avatarTopPositionedWidget;

  const ProfileAvatar({
    super.key,
    this.size = 90,
    this.circularBorderColor = Colors.grey,
    required this.name,
    required this.avatarTopPositionedWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      mainAxisSize: MainAxisSize.min,
      children: [
        // avatar
        Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: circularBorderColor, width: 2),
                ),
              ),
            ),

            Positioned.fill(child: avatarTopPositionedWidget),
          ],
        ),

        // welcome text
        Text("${AppStrings.welcome}, $name", style: context.titleMedium),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/app_colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  final int count;
  final int? selectedIndex;

  const CustomDotsIndicator({
    super.key,
    required this.count,
    required this.selectedIndex,
  });

  final double _spacing = 5.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: _spacing,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: DotIndicator(isSelected: index == selectedIndex),
        );
      }),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isSelected;

  const DotIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey,
          width: 1,
        ),
      ),
    );
  }
}

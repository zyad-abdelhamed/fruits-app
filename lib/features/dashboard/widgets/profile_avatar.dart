import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double size;

  const ProfileAvatar({super.key, this.size = 90});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400, width: 2),
      ),
      child: const Center(
        child: Icon(Icons.person_outline, size: 40, color: Colors.grey),
      ),
    );
  }
}

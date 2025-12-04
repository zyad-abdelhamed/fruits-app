import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.maybePop(context),
      icon: Icon(Icons.chevron_left, color: Colors.black, size: 32),
    );
  }
}

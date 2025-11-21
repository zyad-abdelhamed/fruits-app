import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';

class AuthOptionsWidget extends StatelessWidget {
  const AuthOptionsWidget({super.key});

  final double _spacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: _spacing,
      children: <ElevatedButton>[
        _buildButton(
          title: 'Sign in with phone number',
          image: ImagesRoutesConstants.call,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          onPressed: () {},
        ),
        _buildButton(
          title: 'Sign in with Google',
          image: ImagesRoutesConstants.google,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          onPressed: () {},
        ),
        _buildButton(
          title: 'Sign in With Facebook',
          image: ImagesRoutesConstants.facebook,
          backgroundColor: Color(0XFF235C95),
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }

  ElevatedButton _buildButton({
    required String title,
    required String image,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        foregroundColor: WidgetStatePropertyAll(textColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 24.0, width: 24.0),
          const SizedBox(width: 8.0),
          Text(title),
        ],
      ),
    );
  }
}

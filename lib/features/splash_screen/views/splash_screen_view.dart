import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/core/services/dependencey_injection_service.dart';
import 'package:fruits_app/core/services/secure_token_storage.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    goToNextPage(context);

    return Scaffold(
      body: Image.asset(
        'assets/images/splash_screen.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }

  goToNextPage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));

    if (context.mounted) {
      final String? token = await sl<SecureTokenStorage>().getToken();

      if (context.mounted) {
        if (token == null) {
          Navigator.pushReplacementNamed(
            context,
            ViewsRoutesConstants.loginView,
          );
        }

        Navigator.pushReplacementNamed(
          context,
          ViewsRoutesConstants.dashboardView,
        );
      }
    }
  }
}

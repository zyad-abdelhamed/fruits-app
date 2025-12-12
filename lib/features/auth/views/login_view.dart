import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/auth/widgets/landscape_login_view.dart';
import 'package:fruits_app/features/auth/widgets/portorait_login_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton(), shape: InputBorder.none),
      body: SingleChildScrollView(
        padding: context.isLandScape
            ? const EdgeInsets.symmetric(horizontal: 8.0)
            : const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Form(
          child: context.isLandScape
              ? const LandscapeLoginView()
              : const PortoraitLoginView(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruits_app/core/helper_functions/is_land_scape_orintation.dart';
import 'package:fruits_app/features/auth/widgets/landscape_login_view.dart';
import 'package:fruits_app/features/auth/widgets/portorait_login_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SingleChildScrollView(
        padding: isLandScapeOrientation(context)
            ? const EdgeInsets.symmetric(horizontal: 8.0)
            : const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Form(
          child: isLandScapeOrientation(context)
              ? const LandscapeLoginView()
              : const PortoraitLoginView(),
        ),
      ),
    );
  }
}

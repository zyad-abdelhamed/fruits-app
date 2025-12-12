import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/auth/widgets/auth_options_widget.dart';
import 'package:fruits_app/core/widgets/fruit_market_text_widget.dart';
import 'package:fruits_app/features/auth/widgets/terms_and_privacy_notice.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  final double _spacing = 24.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: Icon(Icons.close),
        ),
        shape: InputBorder.none,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          spacing: _spacing,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FruitMarketTextWidget(),
            Text(
              AppStrings.welcome,
              textAlign: TextAlign.center,
              style: context.headlineMedium,
            ),
            const AuthOptionsWidget(),
            RichText(
              text: TextSpan(
                text: AppStrings.alreadyMember,
                style: TextTheme.of(context).bodyMedium,
                children: [
                  TextSpan(
                    text: ' ${AppStrings.signIn}',
                    style: const TextStyle(color: AppColors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamed(
                        context,
                        ViewsRoutesConstants.loginView,
                      ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const TermsAndPrivacyNotice(),
          ],
        ),
      ),
    );
  }
}

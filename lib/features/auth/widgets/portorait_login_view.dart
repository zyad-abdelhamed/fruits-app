import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/widgets/fruit_market_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:fruits_app/features/auth/widgets/phone_number_drop_down_button.dart';
import 'package:fruits_app/features/auth/widgets/required_mark_widget.dart';

class PortoraitLoginView extends StatelessWidget {
  const PortoraitLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FruitMarketTextWidget(),
        const SizedBox(height: 8),
        Text(
          AppStrings.loginToWikala,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 32),

        // Phone Number Field
        RequiredMarkWidget(text: AppStrings.phoneNumber),
        TextFormField(
          decoration: InputDecoration(
            hintText: AppStrings.phoneNumber,
            prefixIcon: const PhoneNumberFieldDropDownButton(),
          ),
          keyboardType: TextInputType.phone,
        ),

        const SizedBox(height: 24),

        // Password Field
        RequiredMarkWidget(text: AppStrings.password),

        TextFormField(
          obscureText: true,
          decoration: InputDecoration(hintText: AppStrings.password),
        ),

        const SizedBox(height: 8.0),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => Navigator.pushNamed(
              context,
              ViewsRoutesConstants.forgotPasswordView,
            ),
            child: Text(
              AppStrings.forgotPassword,
              style: TextStyle(color: AppColors.blue),
            ),
          ),
        ),

        const SizedBox(height: 8.0),

        // Login Button
        ElevatedButton(onPressed: () {}, child: Text(AppStrings.login)),

        const SizedBox(height: 24),

        // Sign Up Prompt
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: AppStrings.dontHaveAccount,
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: AppStrings.signUp,
                style: const TextStyle(color: AppColors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.pushNamed(
                    context,
                    ViewsRoutesConstants.signUpView,
                  ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

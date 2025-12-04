import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/widgets/fruit_market_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:fruits_app/features/auth/widgets/phone_number_drop_down_button.dart';
import 'package:fruits_app/features/auth/widgets/required_mark_widget.dart';

class LandscapeSignUpView extends StatelessWidget {
  const LandscapeSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // الجانب الأيسر: العنوان والنصوص
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FruitMarketTextWidget(),
              const SizedBox(height: 8),
              Text(
                AppStrings.signUpToWikala,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 32),
              RichText(
                text: TextSpan(
                  text: AppStrings.alreadyHaveAnAcount,
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: AppStrings.signUp,
                      style: const TextStyle(color: AppColors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushNamed(
                          context,
                          ViewsRoutesConstants.loginView,
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 32),

        // الجانب الأيمن: الحقول والأزرار
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name Field
              RequiredMarkWidget(text: AppStrings.fullName),
              TextFormField(
                decoration: InputDecoration(
                  hintText: AppStrings.firstAndLastName,
                ),
              ),
              const SizedBox(height: 24),
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
                  onPressed: () {},
                  child: Text(
                    AppStrings.forgotPassword,
                    style: const TextStyle(color: AppColors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              // sign up Button
              ElevatedButton(onPressed: () {}, child: Text(AppStrings.signUp)),
            ],
          ),
        ),
      ],
    );
  }
}

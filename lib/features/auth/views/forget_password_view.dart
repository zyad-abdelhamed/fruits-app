import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/core/widgets/fruit_market_text_widget.dart';
import 'package:fruits_app/features/auth/widgets/phone_number_drop_down_button.dart';
import 'package:fruits_app/features/auth/widgets/required_mark_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FruitMarketTextWidget(),

            const SizedBox(height: 8),

            Text(
              AppStrings.enterYourNumber,
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
            ),

            const SizedBox(height: 24),

            // submit Button
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                ViewsRoutesConstants.enterOtpView,
              ),
              child: Text(AppStrings.submit),
            ),
          ],
        ),
      ),
    );
  }
}

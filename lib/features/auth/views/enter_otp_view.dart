import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:otp_plus/otp_plus.dart';
import 'package:fruits_app/core/widgets/fruit_market_text_widget.dart';
import 'package:otp_plus/utils/enum/otp_field_shape.dart';

class EnterOtpView extends StatefulWidget {
  const EnterOtpView({super.key});

  @override
  State<EnterOtpView> createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends State<EnterOtpView> {
  late final ValueNotifier<int> counterNotifier;

  @override
  void initState() {
    super.initState();
    counterNotifier = ValueNotifier(60);
    startTimer();
  }

  void startTimer() async {
    for (int i = 60; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));

      counterNotifier.value = i;
    }
  }

  @override
  void dispose() {
    counterNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton(), shape: InputBorder.none),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
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

            // otp input widget
            OtpPlusInputs(
              length: 4,
              shape: OtpFieldShape.circle,
              obscureText: true,
              obscuringCharacter: AppStrings.dot,
              onSubmit: (String code) {
                print('رمز التحقق هو: $code');
              },
              borderColor: Colors.grey,
              focusedBorderColor: Colors.grey,
              cursorColor: AppColors.orange,
            ),
            const SizedBox(height: 32),

            // counter
            ValueListenableBuilder<int>(
              valueListenable: counterNotifier,
              builder: (context, int value, _) {
                return Text(
                  value.toString(),
                  textAlign: TextAlign.center,
                  style: TextTheme.of(
                    context,
                  ).bodyMedium!.copyWith(color: Colors.grey),
                );
              },
            ),
            // confirm Button
            ElevatedButton(onPressed: () {}, child: Text(AppStrings.confirm)),
          ],
        ),
      ),
    );
  }
}

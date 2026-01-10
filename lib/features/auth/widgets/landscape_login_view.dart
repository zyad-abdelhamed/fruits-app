import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/widgets/fruit_market_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:fruits_app/features/auth/view_model/cubit/auth_cubit.dart';
import 'package:fruits_app/features/auth/view_model/cubit/auth_state.dart';
import 'package:fruits_app/features/auth/widgets/phone_number_drop_down_button.dart';
import 'package:fruits_app/features/auth/widgets/required_mark_widget.dart';

class LandscapeLoginView extends StatelessWidget {
  const LandscapeLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FruitMarketTextWidget(),
              const SizedBox(height: 8),
              Text(
                AppStrings.loginToWikala,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 32),
              RichText(
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
          ),
        ),

        const SizedBox(width: 32),

        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RequiredMarkWidget(text: AppStrings.phoneNumber),
              TextFormField(
                controller: cubit.phoneOrEmailController,
                decoration: InputDecoration(
                  hintText: AppStrings.phoneNumber,
                  prefixIcon: const PhoneNumberFieldDropDownButton(),
                ),
                keyboardType: TextInputType.phone,
                validator: (v) => v!.isEmpty ? AppStrings.phoneNumber : null,
              ),
              const SizedBox(height: 24),

              RequiredMarkWidget(text: AppStrings.password),
              TextFormField(
                controller: cubit.passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: AppStrings.password),
                validator: (v) => v!.isEmpty ? AppStrings.password : null,
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
                    style: const TextStyle(color: AppColors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  final isLoading = state is AuthLoading;

                  return ElevatedButton(
                    onPressed: isLoading ? null : cubit.login,
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(AppStrings.login),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

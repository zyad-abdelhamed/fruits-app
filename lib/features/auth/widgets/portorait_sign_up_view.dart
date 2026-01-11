import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/core/widgets/fruit_market_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:fruits_app/features/auth/view_model/cubit/auth_cubit.dart';
import 'package:fruits_app/features/auth/view_model/cubit/auth_state.dart';
import 'package:fruits_app/features/auth/widgets/phone_number_drop_down_button.dart';
import 'package:fruits_app/features/auth/widgets/required_mark_widget.dart';

class PortoraitSignUpView extends StatelessWidget {
  const PortoraitSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FruitMarketTextWidget(),
        const SizedBox(height: 8),
        Text(
          AppStrings.signUpToWikala,
          textAlign: TextAlign.center,
          style: context.headlineMedium,
        ),
        const SizedBox(height: 32),

        RequiredMarkWidget(text: AppStrings.fullName),
        TextFormField(
          controller: cubit.nameController,
          decoration: InputDecoration(hintText: AppStrings.firstAndLastName),
          validator: (v) => v!.isEmpty ? AppStrings.fullName : null,
        ),

        const SizedBox(height: 24),

        RequiredMarkWidget(text: AppStrings.phoneNumber),
        TextFormField(
          controller: cubit.mobileController,
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
          controller: cubit.registerPasswordController,
          obscureText: true,
          decoration: InputDecoration(hintText: AppStrings.password),
          validator: (v) => v!.isEmpty ? AppStrings.password : null,
        ),

        const SizedBox(height: 8),

        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state is AuthLoading;

            return ElevatedButton(
              onPressed: () => cubit.register(),
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(AppStrings.signUp),
            );
          },
        ),

        const SizedBox(height: 24),

        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: AppStrings.alreadyHaveAnAcount,
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: AppStrings.login,
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
    );
  }
}

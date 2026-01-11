import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/core/services/dependencey_injection_service.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/widgets/app_banner.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/auth/view_model/cubit/auth_cubit.dart';
import 'package:fruits_app/features/auth/view_model/cubit/auth_state.dart';
import 'package:fruits_app/features/auth/widgets/landscape_sign_up_view.dart';
import 'package:fruits_app/features/auth/widgets/portorait_sign_up_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => sl<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(leading: const AppBackButton(), shape: InputBorder.none),
        body: SingleChildScrollView(
          padding: context.isLandScape
              ? const EdgeInsets.symmetric(horizontal: 8.0)
              : const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                AppBanner.showSuccess(context, message: 'Sign up successful');

                Navigator.pushReplacementNamed(
                  context,
                  ViewsRoutesConstants.loginView,
                );
              } else if (state is AuthError) {
                AppBanner.showError(context, message: state.message);
              }
            },
            child: Form(
              //key: context.read<AuthCubit>().formKey,
              child: context.isLandScape
                  ? const LandscapeSignUpView()
                  : const PortoraitSignUpView(),
            ),
          ),
        ),
      ),
    );
  }
}

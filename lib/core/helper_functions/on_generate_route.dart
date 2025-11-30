import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/features/auth/views/enter_otp_view.dart';
import 'package:fruits_app/features/auth/views/forget_password_view.dart';
import 'package:fruits_app/features/auth/views/login_view.dart';
import 'package:fruits_app/features/auth/views/sign_up_view.dart';
import 'package:fruits_app/features/auth/views/welcome_view.dart';
import 'package:fruits_app/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_app/features/dashboard/views/terms_and_conditions_view.dart';
import 'package:fruits_app/features/onboarding/views/onboarding_view.dart';
import 'package:fruits_app/features/splash_screen/views/splash_screen_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ViewsRoutesConstants.splashScreenView:
      return MaterialPageRoute<SplashScreenView>(
        builder: (BuildContext context) => const SplashScreenView(),
      );
    case ViewsRoutesConstants.onboardingPage:
      return MaterialPageRoute<OnboardingView>(
        builder: (BuildContext context) => const OnboardingView(),
      );
    case ViewsRoutesConstants.welcomeView:
      return MaterialPageRoute<WelcomeView>(
        builder: (BuildContext context) => const WelcomeView(),
      );
    case ViewsRoutesConstants.loginView:
      return MaterialPageRoute<LoginView>(
        builder: (BuildContext context) => const LoginView(),
      );
    case ViewsRoutesConstants.signUpView:
      return MaterialPageRoute<SignUpView>(
        builder: (BuildContext context) => const SignUpView(),
      );
    case ViewsRoutesConstants.forgotPasswordView:
      return MaterialPageRoute<ForgetPasswordView>(
        builder: (BuildContext context) => const ForgetPasswordView(),
      );
    case ViewsRoutesConstants.enterOtpView:
      return MaterialPageRoute<EnterOtpView>(
        builder: (BuildContext context) => const EnterOtpView(),
      );
    case ViewsRoutesConstants.dashboardView:
      return MaterialPageRoute<DashboardView>(
        builder: (BuildContext context) => const DashboardView(),
      );
    case ViewsRoutesConstants.termsAndConditionsView:
      return MaterialPageRoute<TermsAndConditionsView>(
        builder: (BuildContext context) => const TermsAndConditionsView(),
      );
    default:
      return MaterialPageRoute<Scaffold>(
        builder: (BuildContext context) => const Scaffold(),
      );
  }
}

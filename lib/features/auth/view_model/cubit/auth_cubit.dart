import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/auth/repos/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  /// ONE FORM KEY FOR ALL
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// CONTROLLERS
  final TextEditingController phoneOrEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();

  final TextEditingController forgetEmailController = TextEditingController();

  /// VALIDATE (UI provides validators)
  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  /// LOGIN
  Future<void> login() async {
    if (!validate()) return;

    emit(AuthLoading());

    final result = await authRepository.login(
      phoneOrEmail: phoneOrEmailController.text.trim(),
      password: passwordController.text.trim(),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthSuccess()),
    );
  }

  /// REGISTER
  Future<void> register() async {
    if (!validate()) return;

    emit(AuthLoading());

    final result = await authRepository.register(
      name: nameController.text.trim(),
      mobile: mobileController.text.trim(),
      email: emailController.text.trim(),
      password: registerPasswordController.text.trim(),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthSuccess()),
    );
  }

  /// FORGET PASSWORD
  Future<void> forgetPassword() async {
    if (!validate()) return;

    emit(AuthLoading());

    final result = await authRepository.forgetPassword(
      forgetEmailController.text.trim(),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (response) => emit(ForgetPasswordSuccess(response)),
    );
  }

  /// CLEAN UP
  @override
  Future<void> close() {
    phoneOrEmailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    registerPasswordController.dispose();
    forgetEmailController.dispose();
    return super.close();
  }
}

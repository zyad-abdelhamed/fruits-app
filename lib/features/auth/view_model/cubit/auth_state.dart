import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/auth/models/auth_response_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial
class AuthInitial extends AuthState {}

/// Loading
class AuthLoading extends AuthState {}

/// Success (Login / Register)
class AuthSuccess extends AuthState {}

/// Forget Password Success
class ForgetPasswordSuccess extends AuthState {
  final AuthResponseModel response;

  const ForgetPasswordSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

/// Error
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

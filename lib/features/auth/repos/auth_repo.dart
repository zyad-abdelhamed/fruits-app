import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/constants/api_constants.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/services/api_service.dart';
import 'package:fruits_app/core/services/secure_token_storage.dart';
import 'package:fruits_app/core/utils/base_repo.dart';
import 'package:fruits_app/features/auth/models/auth_response_model.dart';

class AuthRepository extends BaseRepository {
  final ApiService apiService;
  final SecureTokenStorage tokenStorage;

  AuthRepository({required this.apiService, required this.tokenStorage});

  // LOGIN
  Future<Either<Failure, Unit>> login({
    required String phoneOrEmail,
    required String password,
  }) async {
    return execute(() async {
      final r = await apiService.post(
        ApiConstants.login,
        data: {'phone_or_email': phoneOrEmail, 'password': password},
      );
      throwIfStatusFalse(r.data);

      final token = r.data['data']?['token'];
      print(token);
      if (token != null && token.toString().isNotEmpty) {
        await tokenStorage.saveToken(token);
      }
      return unit;
    });
  }

  // REGISTER
  Future<Either<Failure, Unit>> register({
    required String name,
    required String mobile,
    required String email,
    required String password,
  }) async {
    return execute(() async {
      final r = await apiService.post(
        ApiConstants.register,
        data: {
          'name': name,
          'mobile': mobile,
          'email': email,
          'password': password,
        },
      );
      throwIfStatusFalse(r.data);

      final token = r.data['data']?['token'];
      print(r.data);
      if (token != null && token.toString().isNotEmpty) {
        await tokenStorage.saveToken(token);
      }
      return unit;
    });
  }

  // FORGET PASSWORD
  Future<Either<Failure, AuthResponseModel>> forgetPassword(
    String email,
  ) async {
    return execute(() async {
      final response = await apiService.post(
        ApiConstants.forgetPassword,
        data: {'email': email},
      );
      return AuthResponseModel.fromJson(response.data);
    });
  }
}

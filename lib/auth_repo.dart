// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:fruits_app/core/network/api_constent.dart';
// import 'package:fruits_app/core/network/failure.dart';
// import '../../../../core/network/api_service.dart';
// import '../../../../core/network/network_exception.dart';
// import '../../../../core/storage/secure_token_storage.dart';
// import '../models/auth_response_model.dart';

// class AuthRepository {
//   final ApiService apiService;
//   final SecureTokenStorage tokenStorage;

//   AuthRepository({required this.apiService, required this.tokenStorage});

//   // 🔐 LOGIN
//   Future<Either<Failure, Unit>> login({
//     required String phoneOrEmail,
//     required String password,
//   }) async {
//     try {
//       final response = await apiService.post(
//         ApiConstants.login,
//         data: {'phone_email': phoneOrEmail, 'password': password},
//       );

//       final data = response.data;

//       if (data['status'] == true) {
//         final token = data['data']?['token'];

//         if (token != null && token.toString().isNotEmpty) {
//           await tokenStorage.saveToken(token);
//           return const Right(unit);
//         } else {
//           return Left(Failure('Token is missing in response'));
//         }
//       } else {
//         return Left(Failure(data['message'] ?? 'Login failed'));
//       }
//     } on DioException catch (e) {
//       final message =
//           e.response?.data?['message']?.toString() ??
//           e.message ??
//           'Login failed';

//       return Left(Failure(message));
//     } catch (e) {
//       return Left(Failure('Unexpected error: $e'));
//     }
//   }

//   // 📝 REGISTER
//   Future<Either<Failure, Unit>> register({
//     required String name,
//     required String mobile,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await apiService.post(
//         ApiConstants.register,
//         data: {
//           'name': name,
//           'mobile': mobile,
//           'password': password,
//           'email': email,
//         },
//       );

//       final data = response.data;

//       if (data['status'] == true) {
//         final token = data['data']['token'];
//         if (token != null) {
//           await tokenStorage.saveToken(token);
//           return const Right(unit);
//         } else {
//           return Left(Failure('Token is missing in response'));
//         }
//       } else {
//         return Left(Failure(data['error_message'] ?? 'Register failed'));
//       }
//     } on DioException catch (e) {
//       final message =
//           e.response?.data?['message']?.toString() ??
//           e.message ??
//           'Register failed';
//       return Left(Failure(message));
//     } catch (e) {
//       return Left(Failure('Unexpected error: $e'));
//     }
//   }

//   // 🔁 FORGET PASSWORD
//   Future<AuthResponseModel> forgetPassword(String email) async {
//     try {
//       final response = await apiService.post(
//         ApiConstants.forgetPassword,
//         data: {'email': email},
//       );

//       return AuthResponseModel.fromJson(response.data);
//     } on DioException catch (e) {
//       throw NetworkException(e.response?.data['message'] ?? 'Operation failed');
//     }
//   }
// }

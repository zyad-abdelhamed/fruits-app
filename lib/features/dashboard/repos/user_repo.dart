import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/constants/api_constants.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/services/api_service.dart';
import 'package:fruits_app/core/utils/base_repo.dart';
import 'package:fruits_app/features/dashboard/models/profile_model.dart';

class UserRepository extends BaseRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);

  /// GET PROFILE
  Future<Either<Failure, ProfileModel>> getProfile() {
    return execute(() async {
      final Response response = await _apiService.get(ApiConstants.profile);
      throwIfStatusFalse(response.data);
      print(response.data);

      return ProfileModel.fromJson(response.data['data']);
    });
  }

  /// UPDATE PROFILE
  Future<Either<Failure, ProfileModel>> updateProfile({
    required String name,
    required String email,
    required String mobile,
    File? profilePhoto,
  }) {
    return execute(() async {
      final Response response = await _apiService.put(
        ApiConstants.profile,
        data: {
          'name': name,
          'email': email,
          'mobile': mobile,
          if (profilePhoto != null) 'profile_photo': profilePhoto,
        },
      );
      throwIfStatusFalse(response.data);

      return ProfileModel.fromJson(response.data);
    });
  }

  /// CONTACT US
  Future<Either<Failure, Unit>> contactUs({
    required String name,
    required String mobile,
    required String message,
  }) {
    return execute(() async {
      final response = await _apiService.post(
        ApiConstants.contactUs,
        data: {'name': name, 'mobile': mobile, 'message': message},
      );
      throwIfStatusFalse(response.data);

      return unit;
    });
  }
}

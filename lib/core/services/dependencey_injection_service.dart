import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fruits_app/core/services/api_service.dart';
import 'package:fruits_app/core/services/cache_service.dart';
import 'package:fruits_app/core/services/secure_token_storage.dart';
import 'package:fruits_app/features/auth/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/view_model/cubit/auth_cubit.dart';
import 'package:fruits_app/features/dashboard/repos/user_repo.dart';
import 'package:fruits_app/features/dashboard/view_model/cubit/user_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

abstract class DependencyInjectionService {
  static void setupServiceLocator() {
    // services
    sl.registerLazySingleton<BaseCacheService>(
      () => CacheImplBySharedPreferences(),
    );
    sl.registerLazySingleton<SecureTokenStorage>(
      () => SecureTokenStorage(sl()),
    );
    sl.registerLazySingleton<ApiService>(
      () => ApiService(dio: sl(), tokenStorage: sl()),
    );
    // cubits
    sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
    sl.registerFactory<UserCubit>(() => UserCubit(sl()));
    // repositories
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepository(apiService: sl(), tokenStorage: sl()),
    );
    sl.registerLazySingleton<UserRepository>(() => UserRepository(sl()));
    // packages
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton<FlutterSecureStorage>(
      () => FlutterSecureStorage(),
    );
  }
}

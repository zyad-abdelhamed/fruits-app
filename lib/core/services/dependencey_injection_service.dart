import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fruits_app/core/services/api_service.dart';
import 'package:fruits_app/core/services/cache_service.dart';
import 'package:fruits_app/core/services/secure_token_storage.dart';
import 'package:fruits_app/features/dashboard/repos/user_repo.dart';
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
    // repositories
    sl.registerLazySingleton<UserRepository>(() => UserRepository(sl()));
    // packages
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton<FlutterSecureStorage>(
      () => FlutterSecureStorage(),
    );
  }
}

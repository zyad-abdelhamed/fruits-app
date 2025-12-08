import 'package:fruits_app/core/services/cache_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

abstract class DependencyInjectionService {
  static void setupServiceLocator() {
    // services
    getIt.registerLazySingleton<BaseCacheService>(
      () => CacheImplBySharedPreferences(),
    );
  }
}

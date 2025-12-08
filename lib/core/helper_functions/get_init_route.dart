import 'package:fruits_app/core/constants/cache_constants.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/core/services/cache_service.dart';
import 'package:fruits_app/core/services/dependencey_injection_service.dart';

String get getInitRoute {
  final bool isOnboardingShown =
      sl<BaseCacheService>().getboolFromCache(
        key: CacheConstants.isOnboardingShown,
      ) ??
      false; // false due to first time app launch
  if (isOnboardingShown == true) {
    return ViewsRoutesConstants.splashScreenView;
  }

  return ViewsRoutesConstants.onboardingView;
}

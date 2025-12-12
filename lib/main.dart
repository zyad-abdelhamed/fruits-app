import 'package:flutter/material.dart';
import 'package:fruits_app/core/services/cache_service.dart';
import 'package:fruits_app/core/services/dependencey_injection_service.dart';
import 'package:fruits_app/fruits_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjectionService.setupServiceLocator();

  await sl<BaseCacheService>().cacheintIalization();

  runApp(const FruitsApp());
}

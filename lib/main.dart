import 'package:flutter/material.dart';
import 'package:fruits_app/core/services/dependencey_injection_service.dart';
import 'package:fruits_app/fruits_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjectionService.setupServiceLocator();

  runApp(const FruitsApp());
}

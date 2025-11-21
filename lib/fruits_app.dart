import 'package:flutter/material.dart';
import 'package:fruits_app/core/helper_functions/get_init_route.dart';
import 'package:fruits_app/core/helper_functions/on_generate_route.dart';
import 'package:fruits_app/core/theme/app_theme.dart';
import 'package:fruits_app/features/dashboard/views/product_details_view.dart';

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      onGenerateRoute: onGenerateRoute,
      //initialRoute: getInitRoute,
      home: const ProductDetailsView(),
    );
  }
}

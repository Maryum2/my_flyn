import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flyn/core/bindings/initial_bindings.dart';
import 'package:my_flyn/resources/app_theme.dart';
import 'package:my_flyn/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      initialBinding: InitialBindings(),
      getPages: AppPages.pages,
    );
  }
}

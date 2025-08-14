import 'package:e_commerce_innerix/app/routes/app_pages.dart';
import 'package:e_commerce_innerix/features/auth/controllers/auth_controller.dart';
import 'package:e_commerce_innerix/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_commerce_innerix/features/auth/domain/services/auth_service.dart';
import 'package:e_commerce_innerix/infrastructure/navigation/routes.dart' as nav_routes;
import 'package:e_commerce_innerix/network/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final authRepo = AuthRepository(prefs);
  final authService = AuthService(authRepo);
  Get.put<AuthController>(AuthController(authService));
  
  // Initialize API client
  await ApiClient().initialize();
  // Initialize SharedPreferences
  //final prefs = await SharedPreferences.getInstance();

  // Set default values if first launch
  if (prefs.getBool('isFirstLaunch') == null) {
    await prefs.setBool('isFirstLaunch', true);
    await prefs.setBool('isLoggedIn', false);
  }

  // Get initial route
  final initialRoute = await nav_routes.Routes.initialRoute;

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: initialRoute,
      getPages: AppPages.routes,
    );
  }
}

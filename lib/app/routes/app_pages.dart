import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/bindings/auth_binding.dart';
import '../../features/auth/screens/auth_view.dart';
import '../../features/auth/screens/sign_in_screen.dart';
import '../../features/auth/screens/verify_otp_screen.dart';
import '../../features/home/bindings/home_binding.dart';
import '../../features/home/screens/home_view.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    // Onboarding Flow
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingScreen(),
    ),
    
    // Auth Flow
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const AuthView(), // Replace with actual SignUpScreen
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => const VerifyOtpScreen(),
      binding: AuthBinding(),
    ),
    
    // Main App
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

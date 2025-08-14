import 'package:shared_preferences/shared_preferences.dart';

class Routes {
  static Future<String> get initialRoute async {
    // Check if it's the first launch
    final prefs = await SharedPreferences.getInstance();
    final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isFirstLaunch) {
      return ONBOARDING;
    } else if (!isLoggedIn) {
      return SIGN_IN;
    } else {
      return HOME;
    }
  }

  // Route names
  static const ONBOARDING = '/onboarding';
  static const SIGN_IN = '/sign-in';
  static const SIGN_UP = '/sign-up';
  static const HOME = '/home';
  static const VERIFY_OTP = '/verify-otp';
}

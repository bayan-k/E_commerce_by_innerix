import 'package:get/get.dart';
import 'package:e_commerce_innerix/features/auth/domain/models/auth_response_model.dart';
import 'package:e_commerce_innerix/features/auth/domain/services/auth_service_interface.dart';

class AuthController extends GetxController {
  final AuthServiceInterface _authService;
  
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rx<AuthResponse?> currentUser = Rx<AuthResponse?>(null);

  AuthController(this._authService);

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final result = await _authService.login(
        email: email,
        password: password,
      );

      result.fold(
        (error) {
          errorMessage.value = error;
          Get.snackbar('Error', error);
        },
        (authResponse) {
          currentUser.value = authResponse;
          Get.offAllNamed('/home'); // Navigate to home after successful login
        },
      );
    } catch (e) {
      errorMessage.value = 'An unexpected error occurred';
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkAuthStatus() async {
    final result = await _authService.checkAuthStatus();
    result.fold(
      (error) => errorMessage.value = error,
      (isLoggedIn) {
        if (isLoggedIn) {
          // User is logged in, you might want to fetch user data here
          Get.offAllNamed('/home');
        } else {
          Get.offAllNamed('/login');
        }
      },
    );
  }

  Future<void> logout() async {
    await _authService.logout();
    currentUser.value = null;
    Get.offAllNamed('/login');
  }
}

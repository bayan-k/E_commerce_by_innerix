import 'package:e_commerce_innerix/features/auth/domain/services/auth_service.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        Get.find<AuthService>(),
      ),
    );
  }
}

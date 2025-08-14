import 'package:dartz/dartz.dart';
import 'package:e_commerce_innerix/features/auth/domain/models/auth_response_model.dart';

abstract class AuthServiceInterface {
  Future<Either<String, AuthResponse>> login({
    required String email,
    required String password,
  });
  
  Future<Either<String, bool>> checkAuthStatus();
  Future<void> logout();
}
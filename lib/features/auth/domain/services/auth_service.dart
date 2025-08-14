import 'package:dartz/dartz.dart';
import 'package:e_commerce_innerix/features/auth/domain/models/auth_response_model.dart';
import 'package:e_commerce_innerix/features/auth/domain/repositories/auth_repo_interface.dart';
import 'package:e_commerce_innerix/features/auth/domain/services/auth_service_interface.dart';

class AuthService implements AuthServiceInterface {
  final AuthRepoInterface repository;

  AuthService(this.repository);

  @override
  Future<Either<String, AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    // Input validation
    if (email.isEmpty || password.isEmpty) {
      return const Left('Please fill in all fields');
    }

    if (!_isValidEmail(email)) {
      return const Left('Please enter a valid email address');
    }

    return await repository.login(
      email: email.trim(),
      password: password.trim(),
    );
  }

  @override
  Future<Either<String, bool>> checkAuthStatus() async {
    return await repository.isLoggedIn();
  }

  @override
  Future<void> logout() async {
    await repository.logout();
  }

  bool _isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\$')
        .hasMatch(email);
  }
}
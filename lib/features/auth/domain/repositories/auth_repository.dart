import 'package:dartz/dartz.dart';
import 'package:e_commerce_innerix/features/auth/domain/repositories/auth_repo_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_innerix/features/auth/domain/models/auth_response_model.dart';
import 'package:e_commerce_innerix/network/api_client.dart';
import 'package:e_commerce_innerix/constants/app_constants.dart';

class AuthRepository implements AuthRepoInterface {
  final ApiClient _apiClient = ApiClient();
  final SharedPreferences _prefs;

  AuthRepository(this._prefs);

  @override
  Future<Either<String, AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        AppConstants.login,
        body: {
          'email': email,
          'password': password,
        },
        requiresAuth: false,
      );

      final authResponse = AuthResponse.fromJson(response);
      
      // Save token and user data
      await _prefs.setString(AppConstants.tokenKey, authResponse.token);
      await _prefs.setString('user_data', authResponse.toJson().toString());
      
      // Update API client with new token
      _apiClient.updateAuthToken(authResponse.token);
      
      return Right(authResponse);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> isLoggedIn() async {
    final token = _prefs.getString(AppConstants.tokenKey);
    if (token == null) return const Right(false);
    
    // Optionally validate token with backend
    return const Right(true);
  }

  @override
  Future<void> logout() async {
    await _prefs.remove(AppConstants.tokenKey);
    await _prefs.remove('user_data');
    _apiClient.updateAuthToken(null);
  }
}
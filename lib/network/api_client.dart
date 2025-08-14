import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../constants/app_constants.dart';

class ApiClient {
  // Singleton instance
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  ApiClient._internal();

  // HTTP client
  final http.Client _client = http.Client();
  
  // Headers
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Initialize with token if available
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppConstants.tokenKey);
    if (token != null) {
      _headers['Authorization'] = 'Bearer $token';
    }
  }

  // Update authorization token
  void updateAuthToken(String? token) {
    if (token != null) {
      _headers['Authorization'] = 'Bearer $token';
    } else {
      _headers.remove('Authorization');
    }
  }

  // Check internet connection
  Future<bool> _isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // Handle response
  dynamic _handleResponse(http.Response response) {
    final responseJson = json.decode(utf8.decode(response.bodyBytes));
    
    switch (response.statusCode) {
      case 200:
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson['message'] ?? 'Bad Request');
      case 401:
      case 403:
        throw UnauthorizedException(responseJson['message'] ?? 'Unauthorized');
      case 404:
        throw NotFoundException(responseJson['message'] ?? 'Not Found');
      case 500:
      default:
        throw FetchDataException(
          responseJson['message'] ?? 'Error occurred while communicating with server',
        );
    }
  }

  // GET request
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    bool requiresAuth = true,
  }) async {
    if (!await _isConnected()) {
      throw NoInternetException('No internet connection');
    }

    if (requiresAuth && !_headers.containsKey('Authorization')) {
      throw UnauthorizedException('No authentication token found');
    }

    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint')
          .replace(queryParameters: queryParams);

      final response = await _client
          .get(uri, headers: _headers)
          .timeout(const Duration(seconds: 30));

      return _handleResponse(response);
    } on TimeoutException {
      throw FetchDataException('Request timeout');
    } catch (e) {
      throw FetchDataException('Error during GET request: $e');
    }
  }

  // POST request
  Future<dynamic> post(
    String endpoint, {
    dynamic body,
    bool requiresAuth = true,
  }) async {
    if (!await _isConnected()) {
      throw NoInternetException('No internet connection');
    }

    if (requiresAuth && !_headers.containsKey('Authorization')) {
      throw UnauthorizedException('No authentication token found');
    }

    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint');
      final response = await _client
          .post(
            uri,
            headers: _headers,
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 30));

      return _handleResponse(response);
    } on TimeoutException {
      throw FetchDataException('Request timeout');
    } catch (e) {
      throw FetchDataException('Error during POST request: $e');
    }
  }

  // Add other HTTP methods (PUT, DELETE, etc.) as needed

  // Close the client when done
  void close() {
    _client.close();
  }
}

// Custom Exceptions
class FetchDataException implements Exception {
  final String message;
  FetchDataException(this.message);
  @override
  String toString() => 'FetchDataException: $message';
}

class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);
  @override
  String toString() => 'BadRequestException: $message';
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
  @override
  String toString() => 'UnauthorizedException: $message';
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);
  @override
  String toString() => 'NotFoundException: $message';
}

class NoInternetException implements Exception {
  final String message;
  NoInternetException(this.message);
  @override
  String toString() => 'NoInternetException: $message';
}

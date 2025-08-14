class AppConstants {
  // API Endpoints
  static const String baseUrl = 'https://app.ecominnerix.com';
  static const String login = '/api/login';
  static const String requestOtp = '/api/request-otp';
  static const String verifyEmailOtp = '/api/verify-email-otp';
  static const String homeData = '/api/v1/home';
  static const String productById = '/api/products/';
  static const String registerNewUser = '/api/register';

  // Cart Endpoints
  static const String cart = '/cart';
  static const String addToCart = '/cart/add';
  static const String updateCart = '/cart/update';
  static const String removeFromCart = '/cart/remove';

  // Order Endpoints
  static const String orders = '/orders';
  static const String createOrder = '/orders/create';
  static const String orderDetail = '/orders/';
  static const String orderHistory = '/orders/history';

  // User Endpoints
  static const String userProfile = '/user/profile';
  static const String updateProfile = '/user/update';
  static const String changePassword = '/user/change-password';
  static const String addresses = '/user/addresses';

  // App Constants
  static const String appName = 'E-Commerce App';
  static const String appVersion = '1.0.0';
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds

  // Shared Preferences Keys
  static const String tokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
  static const String isLoggedInKey = 'is_logged_in';
  static const String fcmTokenKey = 'fcm_token';

  // Other Constants
  static const String defaultLanguage = 'en';
  static const String defaultCurrency = 'USD';
  static const int paginationLimit = 10;
}

// Usage example:
// final loginUrl = '${AppConstants.baseUrl}${AppConstants.login}';
// final productDetailUrl = '${AppConstants.baseUrl}${AppConstants.productDetail}$productId';

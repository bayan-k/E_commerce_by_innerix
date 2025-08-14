class AuthResponse {
  final bool status;
  final String message;
  final User? user;
  final String accessToken;
  final String refreshToken;

  AuthResponse({
    required this.status,
    required this.message,
    this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      accessToken: json['access_token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'user': user?.toJson(),
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}

class User {
  final int userId;
  final int? shopId;
  final String email;
  final String phoneNumber;
  final String name;
  final String profileImage;
  final int userRole;
  final String gender;
  final int age;
  final dynamic roles; // Can be refined if structure is known

  User({
    required this.userId,
    this.shopId,
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.profileImage,
    required this.userRole,
    required this.gender,
    required this.age,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'] ?? 0,
      shopId: json['shop_id'],
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      name: json['name'] ?? '',
      profileImage: json['profile_image'] ?? '',
      userRole: json['user_role'] ?? 0,
      gender: json['gender'] ?? '',
      age: json['age'] ?? 0,
      roles: json['roles'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'shop_id': shopId,
      'email': email,
      'phone_number': phoneNumber,
      'name': name,
      'profile_image': profileImage,
      'user_role': userRole,
      'gender': gender,
      'age': age,
      'roles': roles,
    };
  }
}

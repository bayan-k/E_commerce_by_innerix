class OtpResponse {
  final String message;
  final int otp;
  final bool status;

  OtpResponse({
    required this.message,
    required this.otp,
    required this.status,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      message: json['message'] ?? '',
      otp: json['otp'] ?? 0,
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'otp': otp,
      'status': status,
    };
  }
}

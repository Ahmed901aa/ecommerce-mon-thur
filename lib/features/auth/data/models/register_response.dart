import 'package:ecommerce/features/auth/data/models/user_model.dart';

class RegisterResponse {
  final String message;
  final UserModel user;
  final String token;

  const RegisterResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );
  }
}

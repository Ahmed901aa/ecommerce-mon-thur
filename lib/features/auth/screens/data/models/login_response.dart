import 'package:ecommerce/features/auth/screens/data/models/user_model.dart';

class LoginResponse {
  final String message;
  final UserModel user;
  final String token;

  const LoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] as String? ?? 'success',
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: (json['token'] as String?) ?? '',
    );
  }
}

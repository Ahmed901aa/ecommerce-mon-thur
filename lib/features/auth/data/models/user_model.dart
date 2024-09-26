class UserModel {
  final String name;
  final String email;
  final String role;

  const UserModel({
    required this.name,
    required this.email,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String,
        email: json['email'] as String,
        role: json['role'] as String,
      );
}

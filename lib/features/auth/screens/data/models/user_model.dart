class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['_id'] as String?) ?? (json['id'] as String?) ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: (json['phone'] as String?) ?? '',
      role: json['role'] as String? ?? '',
    );
  }
}

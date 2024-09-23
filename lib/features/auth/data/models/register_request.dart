class RegisterRequest {
  final String name;
  final String email;
  final String phone;
  final String password;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'rePassword': password,
        'phone': phone,
      };
}

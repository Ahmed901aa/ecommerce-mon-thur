class RegisterRequest {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": password,
        "phone": phoneNumber,
      };
}

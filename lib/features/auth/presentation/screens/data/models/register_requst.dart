class RegisterRequest {
  final String username;
  final String email;
  final String phoneNumber;
  final String password;

  const RegisterRequest({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "name": username,
        "email": email,
        "password": password,
        "rePassword": password,
      "phone": phoneNumber,
    };
  }

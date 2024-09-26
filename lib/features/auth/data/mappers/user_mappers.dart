import 'package:ecommerce/features/auth/data/models/user_model.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';

extension UserMapper on UserModel {
  User get toEntity => User(
        name: name,
        email: email,
        role: role,
      );
}

import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/screens/data/models/user_model.dart';

extension UserMappers on UserModel {
  User get Entitiey =>
      User(id: id, name: name, email: email, phone: phone, role: role);
}

import 'package:ecommerce/features/auth/presentation/screens/data/models/login_requst.dart';
import 'package:ecommerce/features/auth/presentation/screens/data/models/register_requst.dart';

abstract class AuthRemoteDataSource {
  Future login(LoginRequest loginRequest);
  
  Future register(RegisterRequest registerRequest);
}
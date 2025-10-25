import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/user_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  AuthRepository(
    this._remoteDataSource,
    this._localDataSource,
  );

  Future<UserModel> register(RegisterRequest request) async {
    final response = await _remoteDataSource.register(request);
    await _localDataSource.saveToken(response.token);
    return response.user;
  }

  Future<UserModel> login(LoginRequest request)async {
    final response = await _remoteDataSource.login(request);
    await _localDataSource.saveToken(response.token);
    return response.user;
  
  }
}

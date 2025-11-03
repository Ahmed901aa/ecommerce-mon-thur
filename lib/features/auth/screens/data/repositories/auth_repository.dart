import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/api_exception.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/user_model.dart';
import 'package:injectable/injectable.dart';


@singleton
class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  AuthRepository(
    this._remoteDataSource,
    this._localDataSource,
  );

  Future<Either<Failure , UserModel>> register(RegisterRequest request) async {
    try {
      final response = await _remoteDataSource.register(request);
      await _localDataSource.saveToken(response.token);
      return Right(response.user);
    } on ApiException catch (exception) {
      return Left(Failure(massage: exception.message));
    } catch (e) {
      return Left(Failure(massage: e.toString()));
    }
  }

  Future<Either<Failure , UserModel>> login(LoginRequest request) async {
    try {
      final response = await _remoteDataSource.login(request);
      await _localDataSource.saveToken(response.token);
      return Right(response.user);
    } on ApiException catch (exception) {
      return Left(Failure(massage: exception.message));
    } catch (e) {
      return Left(Failure(massage: e.toString()));
    }
  }
}

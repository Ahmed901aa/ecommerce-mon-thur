import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/api_exception.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositries/auth_repositires.dart';
import 'package:ecommerce/features/auth/mappers/user_mappers.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_request.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_request.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, User>> register(RegisterRequest request) async {
    try {
      final response = await _remoteDataSource.register(request);
      await _localDataSource.saveToken(response.token);
      return Right(response.user.Entitiey);
    } on ApiException catch (exception) {
      return Left(Failure(massage: exception.message));
    } catch (e) {
      return Left(Failure(massage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> login(LoginRequest request) async {
    try {
      final response = await _remoteDataSource.login(request);
      await _localDataSource.saveToken(response.token);
      return Right(response.user.Entitiey);
    } on ApiException catch (exception) {
      return Left(Failure(massage: exception.message));
    } catch (e) {
      return Left(Failure(massage: e.toString()));
    }
  }
}

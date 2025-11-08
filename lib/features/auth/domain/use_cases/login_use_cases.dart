import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositries/auth_repositires.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_request.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginUseCases {
  final AuthRepository _authRepository;

  LoginUseCases(this._authRepository);

  Future<Either<Failure, User>> call(LoginRequest request) =>
      _authRepository.login(request);
}

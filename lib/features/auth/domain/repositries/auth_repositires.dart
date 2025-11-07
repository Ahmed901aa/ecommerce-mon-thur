import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_request.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register(RegisterRequest register);

  Future<Either<Failure, User>> login(LoginRequest login);
}

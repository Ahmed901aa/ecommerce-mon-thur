import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositries/auth_repositires.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_request.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegisterUseCases {

  final AuthRepository _authRepository;

  RegisterUseCases(this._authRepository);

 Future<Either<Failure, User>>  call(RegisterRequest request) => 
 _authRepository.register(request);

}
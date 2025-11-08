import 'package:ecommerce/features/auth/domain/use_cases/login_use_cases.dart';
import 'package:ecommerce/features/auth/domain/use_cases/register_use_cases.dart';
import 'package:ecommerce/features/auth/presentation/auth_state.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_request.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUseCases, this._registerUseCases) : super(AuthInitial());

  final LoginUseCases _loginUseCases;

  final RegisterUseCases _registerUseCases;

  Future<void> register(
    RegisterRequest request,
  ) async {
    emit(RegisterLoading());
    final result = await _registerUseCases(request);
    result.fold(
      (failure) => emit(RegisterFailure(message: failure.massage)),
      (user) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _loginUseCases(request);
    result.fold(
      (failure) => emit(LoginFailure(message: failure.massage)),
      (user) => emit(LoginSuccess()),
    );
  }
}

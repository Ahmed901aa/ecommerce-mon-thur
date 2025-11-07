import 'package:ecommerce/features/auth/domain/repositries/auth_repositires.dart';
import 'package:ecommerce/features/auth/presentation/auth_state.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_request.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
   final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> register(
    RegisterRequest request,
  ) async {
    emit(RegisterLoading());
    final result = await authRepository.register(request);
    result.fold(
      (failure) => emit(RegisterFailure(message: failure.massage)),
      (user) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await authRepository.login(request);
    result.fold(
      (failure) => emit(LoginFailure(message: failure.massage)),
      (user) => emit(LoginSuccess()),
    );
  }
}

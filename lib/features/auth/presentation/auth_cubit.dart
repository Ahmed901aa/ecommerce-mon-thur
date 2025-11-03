import 'package:ecommerce/features/auth/presentation/auth_state.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_sherd_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_requst.dart';
import 'package:ecommerce/features/auth/screens/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  late final AuthRepository authRepository;
  AuthCubit() : super(AuthInitial()) {
    authRepository = AuthRepository(
      AuthApiRemoteDataSource(),
      AuthSharedDataSource(),
    );
  }

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

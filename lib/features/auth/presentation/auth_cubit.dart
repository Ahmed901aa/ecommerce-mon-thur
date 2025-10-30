import 'package:ecommerce/features/auth/presentation/auth_state.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_sherd_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_requst.dart';
import 'package:ecommerce/features/auth/screens/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  late final AuthRepository authRepository;
  AuthCubit() : super(AuthInitial()) {
    authRepository = AuthRepository(
      AuthApiRemoteDataSource(),
      AuthSharedDataSource(),
    );
  }

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    try {
      await authRepository.register(request);
      emit(RegisterSuccess());
    } catch (error) {
      var message = error.toString();
      if (message.startsWith('Exception: ')) {
        message = message.substring('Exception: '.length);
      }
      emit(RegisterFailure(message: message));
    }
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    try {
      await authRepository.login(request);
      emit(LoginSuccess());
    } catch (error) {
      var message = error.toString();
      if (message.startsWith('Exception: ')) {
        message = message.substring('Exception: '.length);
      }
      emit(LoginFailure(message: message));
    }
  }
}
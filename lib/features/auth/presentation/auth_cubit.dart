import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/api_exception.dart';
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

  Future<void> register(
    RegisterRequest request,
  ) async {
    emit(RegisterLoading());
    try {
      await authRepository.register(request);
      emit(RegisterSuccess());
    } on ApiException catch (e) {
      final msg = e.details != null ? '${e.message}\n\nDetails: ${e.details}' : e.message;
      emit(RegisterFailure(message: msg));
    } on DioException catch (e) {
      final resp = e.response?.data;
      String message = resp is Map && resp['message'] != null
          ? resp['message'].toString()
          : 'An unknown error occurred';
      if (resp != null) message = '$message\n\nDetails: ${resp.toString()}';
      emit(RegisterFailure(message: message));
    } catch (error) {
      String message = error.toString();
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
    } on ApiException catch (e) {
      final msg = e.details != null ? '${e.message}\n\nDetails: ${e.details}' : e.message;
      emit(LoginFailure(message: msg));
    } on DioException catch (e) {
      final resp = e.response?.data;
      String message = resp is Map && resp['message'] != null
          ? resp['message'].toString()
          : 'An unknown error occurred';
      if (resp != null) message = '$message\n\nDetails: ${resp.toString()}';
      emit(LoginFailure(message: message));
    } catch (error) {
      String message = error.toString();
      if (message.startsWith('Exception: ')) {
        message = message.substring('Exception: '.length);
      }
      emit(LoginFailure(message: message));
    }
  }
}
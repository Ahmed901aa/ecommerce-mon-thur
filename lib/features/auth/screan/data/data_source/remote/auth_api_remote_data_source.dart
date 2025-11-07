import 'package:dio/dio.dart';
import 'package:ecommerce/core/constant.dart';
import 'package:ecommerce/core/errors/api_exception.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_respone.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio;

  AuthApiRemoteDataSource(this._dio);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndpoint,
        data: loginRequest.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String? massage;
      if (exception is DioException) {
        massage = exception.response!.data['message'];
      }
      throw RemoteExcption(massage ?? ' Failed to register');
    }
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await _dio.post(
        ApiConstants.registerEndpoint,
        data: registerRequest.toJson(),
      );

      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      String? massage;
      if (exception is DioException) {
        massage = exception.response!.data['message'];
      }

      throw ApiException(massage ?? ' Failed to login');
    }
  }
}

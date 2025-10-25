import 'package:dio/dio.dart';
import 'package:ecommerce/core/constant.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_respone.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_response.dart';

class AuthApiRemoteDataSource extends AuthRemoteDataSource {
  AuthApiRemoteDataSource()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            headers: const {
              'Content-Type': 'application/json',
            },
          ),
        );

  final Dio _dio;

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response = await _dio.post(
      ApiConstants.loginEndpoint,
      data: loginRequest.toJson(),
    );

    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    final response = await _dio.post(
      ApiConstants.registerEndpoint,
      data: registerRequest.toJson(),
    );

    return RegisterResponse.fromJson(response.data);
  }
}

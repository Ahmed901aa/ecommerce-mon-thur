import 'package:dio/dio.dart';
import 'package:ecommerce/core/constant.dart';
import 'package:ecommerce/core/errors/api_exception.dart';
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
            receiveDataWhenStatusError: true,
           
          ),
        );

  final Dio _dio;

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndpoint,
        data: loginRequest.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (exception) {
      final response = exception.response;
      final statusCode = response?.statusCode;
      final data = response?.data;

      String? message;

      if (data is Map<String, dynamic>) {
        final value = data['message'];
        if (value is String && value.trim().isNotEmpty) {
          message = value.trim();
        }
      } else if (data is String && data.trim().isNotEmpty) {
        message = data.trim();
      }

      if (statusCode == 401 || statusCode == 403) {
        message = 'Incorrect email or password';
      }

      throw RemoteExcption(message ?? 'Failed to login');
    } catch (_) {
      throw const RemoteExcption('Failed to login');
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
    } on DioException catch (exception) {
      final data = exception.response?.data;
      String? message;

      if (data is Map<String, dynamic>) {
        final value = data['message'];
        if (value is String && value.trim().isNotEmpty) {
          message = value.trim();
        }
      } else if (data is String && data.trim().isNotEmpty) {
        message = data.trim();
      }

      throw ApiException(message ?? 'Failed to register');
    } catch (_) {
      throw const ApiException('Failed to register');
    }
  }
}

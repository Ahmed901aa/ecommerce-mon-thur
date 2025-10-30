import 'package:dio/dio.dart';
import 'package:ecommerce/core/constant.dart';
import 'package:ecommerce/core/errors/api_exception.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_respone.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_requst.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_response.dart';

class AuthApiClient {
  final Dio _dio;

  AuthApiClient({Dio? dio}) : _dio = dio ?? _createDefaultDio();

  static Dio _createDefaultDio() {
    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  Future<LoginResponse> signIn(LoginRequest request) async {
    try {
      final response = await _dio.post(ApiConstants.loginEndpoint, data: request.toJson());
      return LoginResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final resp = e.response?.data;
      final msg = _extractErrorMessage(resp) ?? e.message ?? 'Login failed';
      throw ApiException(msg, details: resp ?? e.message);
    }
  }

  Future<RegisterResponse> signUp(RegisterRequest request) async {
    try {
      final response = await _dio.post(ApiConstants.registerEndpoint, data: request.toJson());
      return RegisterResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final resp = e.response?.data;
      final msg = _extractErrorMessage(resp) ?? e.message ?? 'Registration failed';
      throw ApiException(msg, details: resp ?? e.message);
    }
  }

  String? _extractErrorMessage(dynamic data) {
    if (data == null) return null;
    try {
      if (data is Map<String, dynamic>) {
        if (data['message'] != null) return data['message'].toString();
        if (data['error'] != null) return data['error'].toString();
        if (data['errors'] != null) return data['errors'].toString();
        // sometimes backend nests payload inside `data`
        final nested = data['data'];
        if (nested is Map<String, dynamic>) {
          if (nested['message'] != null) return nested['message'].toString();
        }
        return data.toString();
      }
      return data.toString();
    } catch (_) {
      return null;
    }
  }
}

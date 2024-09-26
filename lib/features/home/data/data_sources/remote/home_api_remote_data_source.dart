import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/categories_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeAPIRemoteDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  const HomeAPIRemoteDataSource(this._dio);

  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await _dio.get(
        APIConstants.categoriesEndpoint,
      );
      return CategoriesResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to get categories');
    }
  }
}

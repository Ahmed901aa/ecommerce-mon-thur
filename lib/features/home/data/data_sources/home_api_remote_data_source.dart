import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/constant.dart';
import 'package:ecommerce/core/errors/api_exception.dart';
import 'package:ecommerce/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/categories_respoines.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeApiRemoteDataSource implements HomeRemoteDataSource {

  final Dio _dio;

  HomeApiRemoteDataSource(this._dio);

  @override
  Future<CategoriesRespoines> getCategories() async{

     try{
      final response = await _dio.get(ApiConstants.categoriesEndpoint);
      return CategoriesRespoines.fromJson(response.data);
    } catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteExcption(message ?? 'Failed to get categories');
    }
  }
}
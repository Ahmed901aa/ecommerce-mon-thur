import 'package:dartz/dartz.dart';

import 'package:ecommerce/core/errors/api_exception.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/domain/entities/entities_category.dart';
import 'package:ecommerce/features/home/data/mappers/category_mappers.dart';
import 'package:ecommerce/features/home/data/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository )
class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<EntitiesCategory>>> getCategories() async {
    try {
      final response = await _remoteDataSource.getCategories();
      return Right(
        response.categories.map((categorieModel) => categorieModel.entites).toList(),
      );
    } on RemoteExcption catch (exception) {
      return Left(Failure(massage: exception.message));
    }
  }
} 
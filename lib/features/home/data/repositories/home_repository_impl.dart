import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/mappers/category_mappers.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  const HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final response = await _remoteDataSource.getCategories();
      return Right(
        response.categories
            .map((categoryModel) => categoryModel.toEntity)
            .toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}

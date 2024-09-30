import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce/features/products/data/mappers/product_mappers.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _remoteDataSource;

  const ProductsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts({
    String? categoryId,
  }) async {
    try {
      final response =
          await _remoteDataSource.getProducts(categoryId: categoryId);
      return Right(
        response.products.map((productModel) => productModel.toEntity).toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}

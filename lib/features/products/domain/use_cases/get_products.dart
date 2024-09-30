import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProducts {
  final ProductsRepository _productsRepository;

  const GetProducts(this._productsRepository);

  Future<Either<Failure, List<Product>>> call({String? categoryId}) =>
      _productsRepository.getProducts(categoryId: categoryId);
}

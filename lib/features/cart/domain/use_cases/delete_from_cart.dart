import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteFromCart {
  final CartRepository _cartRepository;

  const DeleteFromCart(this._cartRepository);

  Future<Either<Failure, Cart>> call(String productId) =>
      _cartRepository.deleteFromCart(productId);
}

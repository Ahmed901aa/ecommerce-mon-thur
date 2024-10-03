import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCart {
  final CartRepository _cartRepository;

  const GetCart(this._cartRepository);

  Future<Either<Failure, Cart>> call() => _cartRepository.getCart();
}

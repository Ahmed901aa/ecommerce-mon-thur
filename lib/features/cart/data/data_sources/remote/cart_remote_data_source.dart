import 'package:ecommerce/features/cart/data/models/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(String productId);

  Future<CartResponse> getCart();

  Future<CartResponse> updateCart(String productId, int quantity);

  Future<CartResponse> deleteFromCart(String productId);
}

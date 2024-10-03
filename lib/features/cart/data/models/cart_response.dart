import 'package:ecommerce/features/cart/data/models/cart_model.dart';

class CartResponse {
  final String status;
  final int numOfCartItems;
  final String? cartId;
  final CartModel cart;

  const CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.cart,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        status: json['status'] as String,
        numOfCartItems: json['numOfCartItems'] as int,
        cartId: json['cartId'] as String?,
        cart: CartModel.fromJson(json['data'] as Map<String, dynamic>),
      );
}

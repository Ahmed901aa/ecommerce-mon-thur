import 'package:ecommerce/features/cart/domain/entities/cart_product.dart';

class CartItemData {
  final String id;
  final int count;
  final int price;
  final CartProduct product;

  const CartItemData({
    required this.id,
    required this.count,
    required this.price,
    required this.product,
  });
}

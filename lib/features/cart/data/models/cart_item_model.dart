import 'package:ecommerce/features/cart/data/models/cart_product_model.dart';

class CartItemModel {
  final String id;
  final int count;
  final int price;
  final CartProductModel product;

  const CartItemModel({
    required this.id,
    required this.count,
    required this.price,
    required this.product,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json['_id'] as String,
        count: json['count'] as int,
        price: json['price'] as int,
        product: CartProductModel.fromJson(
          json['product'] as Map<String, dynamic>,
        ),
      );
}

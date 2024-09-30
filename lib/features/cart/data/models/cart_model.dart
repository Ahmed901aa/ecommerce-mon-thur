import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';

class CartModel {
  final String id;
  final String cartOwnerId;
  final List<CartItemModel> items;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final int totalPrice;

  const CartModel({
    required this.id,
    required this.cartOwnerId,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['_id'] as String,
        cartOwnerId: json['cartOwner'] as String,
        items: (json['products'] as List<dynamic>)
            .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int,
        totalPrice: json['totalCartPrice'] as int,
      );
}

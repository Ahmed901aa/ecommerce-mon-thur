import 'package:ecommerce/features/cart/data/mappers/cart_item_mappers.dart';
import 'package:ecommerce/features/cart/data/models/cart_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';

extension CartMapper on CartModel {
  Cart get toEntity => Cart(
        items: items
            .map(
              (cartItemModel) => cartItemModel.toEntity,
            )
            .toList(),
        totalPrice: totalPrice,
      );
}

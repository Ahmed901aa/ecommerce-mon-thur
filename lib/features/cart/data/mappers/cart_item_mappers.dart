import 'package:ecommerce/features/cart/data/mappers/cart_product_mappers.dart';
import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_data.dart';

extension CartItemMapper on CartItemModel {
  CartItemData get toEntity => CartItemData(
        id: id,
        count: count,
        price: price,
        product: product.toEntity,
      );
}

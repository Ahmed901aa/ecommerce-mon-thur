import 'package:ecommerce/features/cart/data/models/cart_product_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_product.dart';

extension CartProductMapper on CartProductModel {
  CartProduct get toEntity => CartProduct(
        id: id,
        title: title,
        imageCoverURL: imageCoverURL,
        ratingsAverage: ratingsAverage,
      );
}

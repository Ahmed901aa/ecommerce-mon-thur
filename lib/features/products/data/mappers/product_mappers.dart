import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';

extension ProductMapper on ProductModel {
  Product get toEntity => Product(
        id: id,
        title: title,
        description: description,
        quantity: quantity,
        price: price,
        imageCoverURL: imageCoverURL,
        sold: sold,
        imagesURLs: imagesURLs,
        ratingsQuantity: ratingsQuantity,
        ratingsAverage: ratingsAverage,
      );
}

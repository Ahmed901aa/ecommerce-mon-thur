import 'package:ecommerce/core/models/brand_model.dart';
import 'package:ecommerce/core/models/category_model.dart';

class ProductModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final String imageCoverURL;
  final int sold;
  final List<String> imagesURLs;
  final int ratingsQuantity;
  final CategoryModel category;
  final BrandModel brand;
  final double ratingsAverage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? priceAfterDiscount;

  const ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCoverURL,
    required this.sold,
    required this.imagesURLs,
    required this.ratingsQuantity,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    this.priceAfterDiscount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        title: json['title'] as String,
        slug: json['slug'] as String,
        description: json['description'] as String,
        quantity: json['quantity'] as int,
        price: json['price'] as int,
        imageCoverURL: json['imageCover'] as String,
        sold: json['sold'] as int,
        imagesURLs: (json['images'] as List<dynamic>).cast<String>(),
        ratingsQuantity: json['ratingsQuantity'] as int,
        category:
            CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
        brand: BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
        ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        id: json['id'] as String,
        priceAfterDiscount: json['priceAfterDiscount'] as int?,
      );
}

import 'package:ecommerce/core/models/metadata.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';

class ProductsResponse {
  final int results;
  final Metadata metadata;
  final List<ProductModel> products;

  const ProductsResponse({
    required this.results,
    required this.metadata,
    required this.products,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      results: json['results'] as int,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      products: (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

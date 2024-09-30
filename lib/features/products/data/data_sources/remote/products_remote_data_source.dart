import 'package:ecommerce/features/products/data/models/products_response.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsResponse> getProducts({String? categoryId});
}

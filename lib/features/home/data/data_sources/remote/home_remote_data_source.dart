import 'package:ecommerce/features/home/data/models/categories_response.dart';

abstract class HomeRemoteDataSource {
  Future<CategoriesResponse> getCategories();
}

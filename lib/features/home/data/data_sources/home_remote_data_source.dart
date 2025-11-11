import 'package:ecommerce/features/home/data/models/categories_respoines.dart';

abstract class HomeRemoteDataSource {
  Future<CategoriesRespoines> getCategories();
}

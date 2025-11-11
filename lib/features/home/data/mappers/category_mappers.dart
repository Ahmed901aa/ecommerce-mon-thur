import 'package:ecommerce/features/home/data/domain/entities/entities_category.dart';
import 'package:ecommerce/features/home/data/models/categorie_model.dart';

extension CategoryMappers on CategorieModel {
  EntitiesCategory get entites => EntitiesCategory(id, name, image);
}

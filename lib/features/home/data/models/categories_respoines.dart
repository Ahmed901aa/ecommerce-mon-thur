import 'categorie_model.dart';
  import 'metadata.dart';


class CategoriesRespoines {
  final int results;
  final Metadata metadata;
  final List<CategorieModel> categories;

  const CategoriesRespoines({
    required this.results,
    required this.metadata,
    required this.categories
      });

  factory CategoriesRespoines.fromJson(Map<String, dynamic> json) =>
   CategoriesRespoines(
        results: json['results'] as int,
        metadata:  Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        categories: (json['data'] as List<dynamic>)
            .map((e) => CategorieModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );  
}

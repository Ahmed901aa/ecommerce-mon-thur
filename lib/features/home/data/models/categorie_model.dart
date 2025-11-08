class CategorieModel {
  final String id;
  final String name;
  final String slug;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CategorieModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategorieModel.fromJson(Map<String, dynamic> json) => CategorieModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        slug: json['slug'] as String,
        image: json['image'] as String,
        createdAt:  DateTime.parse(json['createdAt'] as String),
        updatedAt : DateTime.parse(json['updatedAt'] as String),
      );

  
}

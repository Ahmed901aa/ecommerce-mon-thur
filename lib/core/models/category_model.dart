class CategoryModel {
  final String id;
  final String name;
  final String slug;
  final String imageURL;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageURL,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        slug: json['slug'] as String,
        imageURL: json['image'] as String,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );
}

class BrandModel {
  final String id;
  final String name;
  final String slug;
  final String image;

  const BrandModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        slug: json['slug'] as String,
        image: json['image'] as String,
      );
}

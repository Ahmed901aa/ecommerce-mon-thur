import 'package:collection/collection.dart';


class Category {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const Category({this.id, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
      );

  
}

import 'package:collection/collection.dart';

import 'datum.dart';
import 'metadata.dart';


class Products {
  final int? results;
  final Metadata? metadata;
  final List<Datum>? data;

  const Products({this.results, this.metadata, this.data});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        results: json['results'] as int?,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );


}

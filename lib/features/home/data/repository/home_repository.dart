import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/home/data/domain/entities/entities_category.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<EntitiesCategory>>> getCategories();
}

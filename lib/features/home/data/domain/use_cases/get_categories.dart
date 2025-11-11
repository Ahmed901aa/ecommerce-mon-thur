import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/home/data/domain/entities/entities_category.dart';
import 'package:ecommerce/features/home/data/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategories {
  final HomeRepository _homeRepository;

  GetCategories(this._homeRepository);

  Future<Either<Failure, List<EntitiesCategory>>> call() =>
      _homeRepository.getCategories();
}

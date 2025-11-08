import 'package:ecommerce/features/home/data/domain/entities/entities_category.dart';


abstract class HomeStateCubit {}

class HomeInitial extends HomeStateCubit{}

class GetCategoriesLoading extends HomeStateCubit{}

class GetCategoriesSucess extends HomeStateCubit{

  final List<EntitiesCategory> categories;

  GetCategoriesSucess(this.categories);
}

class GetCategoriesFailure extends HomeStateCubit{

  final String message;

  GetCategoriesFailure(this.message);
}
import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getCategories,
  ) : super(HomeInitial()) {
    getCategories();
  }

  final GetCategories _getCategories;

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final result = await _getCategories();
    result.fold(
      (failure) => emit(GetCategoriesError(failure.message)),
      (categories) => emit(GetCategoriesSuccess(categories)),
    );
  }
}

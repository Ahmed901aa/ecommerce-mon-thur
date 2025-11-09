import 'package:ecommerce/features/home/data/domain/use_cases/get_categories.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeStateCubit> {

  HomeCubit(this._getCategories) :
  super(HomeInitial()){
     getCategories();
  } 

  final GetCategories _getCategories;

  Future<void> getCategories()async{
    emit(GetCategoriesLoading());

  final result = await  _getCategories();

  result.fold(
    (failure) => emit(GetCategoriesFailure(failure.massage)), 
    (categories) => emit(GetCategoriesSucess(categories)));
  }

}
import 'package:ecommerce/features/products/domain/use_cases/get_products.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this._getProducts,
  ) : super(ProductsInitial());

  final GetProducts _getProducts;

  Future<void> getProducts({String? categoryId}) async {
    emit(GetProductsLoading());
    final result = await _getProducts(categoryId: categoryId);
    result.fold(
      (failure) => emit(GetProductsError(failure.message)),
      (products) => emit(GetProductsSuccess(products)),
    );
  }

  void onQuantityChanged() => emit(QuantityChanged());
}

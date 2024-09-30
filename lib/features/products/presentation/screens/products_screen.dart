import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/home_screen_app_bar.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_states.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen();

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final String categoryId =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: BlocProvider(
        create: (_) => serviceLocator.get<ProductsCubit>()
          ..getProducts(categoryId: categoryId),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is GetProductsLoading) {
              return const LoadingIndicator();
            } else if (state is GetProductsError) {
              return ErrorIndicator(state.message);
            } else if (state is GetProductsSuccess) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 7 / 9,
                ),
                itemBuilder: (_, index) => ProductItem(state.products[index]),
                itemCount: state.products.length,
                padding: EdgeInsets.all(Insets.s16.sp),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

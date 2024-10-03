import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:ecommerce/features/cart/presentation/widgets/total_price_and_checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final _cartCubit = context.read<CartCubit>();

  @override
  void initState() {
    super.initState();
    _cartCubit.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.text),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(Insets.s14.sp),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (_, state) {
            if (state is UpdateCartLoading || state is DeleteFromCartLoading) {
              UIUtils.showLoading(context);
            } else if (state is UpdateCartError) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage(state.message);
            } else if (state is DeleteFromCartError) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage(state.message);
            } else if (state is UpdateCartSuccess ||
                state is DeleteFromCartSuccess) {
              UIUtils.hideLoading(context);
            }
          },
          builder: (context, state) {
            if (state is GetCartLoading) {
              return const LoadingIndicator();
            } else if (state is GetCartError) {
              return ErrorIndicator(state.message);
            } else {
              return Column(
                children: [
                  Expanded(
                    child: _cartCubit.cart.items.isEmpty
                        ? const Center(
                            child: Text('Your cart is empty'),
                          )
                        : ListView.separated(
                            itemBuilder: (_, index) =>
                                CartItem(_cartCubit.cart.items[index]),
                            itemCount: _cartCubit.cart.items.length,
                            separatorBuilder: (_, __) =>
                                SizedBox(height: Sizes.s12.h),
                          ),
                  ),
                  Visibility(
                    visible: _cartCubit.cart.items.isNotEmpty,
                    child: TotalPriceAndCheckoutButton(
                      totalPrice: _cartCubit.cart.totalPrice,
                      checkoutButtonOnTap: () {},
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

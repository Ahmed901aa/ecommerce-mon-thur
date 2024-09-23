import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:ecommerce/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.text),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(
                IconsAssets.search,
              ),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(IconsAssets.cart),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(Insets.s14.sp),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, __) => CartItem(
                  imagePath: ImageAssets.categoryCardImage,
                  title: 'Nike Air Jordon',
                  price: 1500,
                  quantity: 1,
                  onDeleteTap: () {},
                  onDecrementTap: (value) {},
                  onIncrementTap: (value) {},
                  size: 40,
                  color: Colors.black,
                  colorName: 'Black',
                ),
                separatorBuilder: (_, __) => SizedBox(height: Sizes.s12.h),
                itemCount: 2,
              ),
            ),
            TotalPriceAndCheckoutButton(
              totalPrice: 1200,
              checkoutButtonOnTap: () {},
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

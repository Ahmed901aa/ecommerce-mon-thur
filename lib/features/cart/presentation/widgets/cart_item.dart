import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/product_counter.dart';
import 'package:ecommerce/features/cart/presentation/widgets/color_and_size_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    required this.imagePath,
    required this.title,
    required this.color,
    required this.colorName,
    required this.size,
    required this.price,
    required this.onDeleteTap,
    required this.quantity,
    required this.onIncrementTap,
    required this.onDecrementTap,
  });

  final String imagePath;
  final String title;
  final Color color;
  final String colorName;
  final int size;
  final int price;
  final void Function() onDeleteTap;
  final int quantity;
  final void Function(int value) onIncrementTap;
  final void Function(int value) onDecrementTap;

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(Routes.productDetails),
      child: Container(
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border:
                    Border.all(color: ColorManager.primary.withOpacity(0.3)),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: isPortrait ? height * 0.142 : height * 0.23,
                width: isPortrait ? width * 0.29 : 165.w,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Insets.s8.w,
                  vertical: Insets.s8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getBoldStyle(
                              color: ColorManager.text,
                              fontSize: FontSize.s18,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onDeleteTap,
                          child: Image.asset(
                            IconsAssets.delete,
                            color: ColorManager.text,
                            height: 22.h,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ColorAndSizeCartItem(
                      color: color,
                      colorName: colorName,
                      size: size,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'EGP $price',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getBoldStyle(
                              color: ColorManager.text,
                              fontSize: FontSize.s18,
                            ),
                          ),
                        ),
                        ProductCounter(
                          onAddClicked: onIncrementTap,
                          counter: quantity,
                          onRemoveClicked: onDecrementTap,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

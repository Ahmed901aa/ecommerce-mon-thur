import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_color.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_description.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_image.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_label.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_rating.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_size.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitle)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(IconsAssets.search),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsetsDirectional.only(start: 16.w, end: 16.w, bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductSlider(
                items: [
                  ProductImage(
                    imageUrl:
                        'https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg',
                  ),
                  ProductImage(
                    imageUrl:
                        'https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg',
                  ),
                  ProductImage(
                    imageUrl:
                        'https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg',
                  ),
                ],
                initialIndex: 0,
              ),
              SizedBox(
                height: 24.h,
              ),
              const ProductLabel(
                name: 'Nike Air Jordon',
                price: 'EGP 3,500',
              ),
              SizedBox(
                height: 16.h,
              ),
              const ProductRating(
                buyers: '3,230',
                rating: '4.8 (7,500)',
              ),
              SizedBox(
                height: 16.h,
              ),
              const ProductDescription(
                description:
                    'Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories',
              ),
              ProductSize(
                sizes: const [35, 38, 39, 40],
                onSelected: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Color',
                style: getMediumStyle(color: ColorManager.appBarTitle)
                    .copyWith(fontSize: 18.sp),
              ),
              ProductColor(
                color: const [
                  Colors.red,
                  Colors.blueAccent,
                  Colors.green,
                  Colors.yellow,
                ],
                onSelected: () {},
              ),
              SizedBox(
                height: 48.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total price',
                        style: getMediumStyle(
                          color: ColorManager.primary.withOpacity(.6),
                        ).copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        'EGP 3,500',
                        style: getMediumStyle(color: ColorManager.appBarTitle)
                            .copyWith(fontSize: 18.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      label: 'Add to cart',
                      onTap: () {},
                      prefixIcon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

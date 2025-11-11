import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/home_screen_app_bar.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: GridView.builder(
        
       
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 7 / 9,
        ),
        itemBuilder: (_, __) => ProductItem(
          image: ImageAssets.categoryHomeImage,
          title: 'Nike Air Jordon',
          price: 1100,
          rating: 4.7,
          discountPercentage: 10,
          height: screenSize.height,
          width: screenSize.width,
          description:
              'Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories',
        ),
         itemCount: 20,
         padding: EdgeInsets.all(Insets.s16.sp), 
      //  scrollDirection: Axis.vertical,
      ),
    );
  }
}

import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRating extends StatelessWidget {
  final String rating;
  final String buyers;

  const ProductRating({
    required this.rating,
    required this.buyers,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorManager.primary.withOpacity(0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(
            '$buyers Sold',
            overflow: TextOverflow.ellipsis,
            style: getMediumStyle(color: ColorManager.primary)
                .copyWith(fontSize: 18.sp),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Image.asset(
          ImageAssets.rate,
          width: 30.w,
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: Text(
            rating,
            overflow: TextOverflow.ellipsis,
            style: getMediumStyle(color: ColorManager.appBarTitle)
                .copyWith(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}

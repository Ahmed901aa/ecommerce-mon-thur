import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/heart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;

  const ProductItem({
    required this.width,
    required this.height,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(Routes.productDetails),
      child: Container(
        width: width * 0.4,
        height: height * 0.3,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary.withOpacity(0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(14.r)),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: width,
                    ),
                  ),
                  PositionedDirectional(
                    top: height * 0.01,
                    end: width * 0.02,
                    child: HeartButton(onTap: () {}),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _truncateTitle(title),
                      style: getMediumStyle(
                        color: ColorManager.text,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: height * 0.002),
                    Text(
                      _truncateDescription(description),
                      style: getRegularStyle(
                        color: ColorManager.text,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    SizedBox(
                      width: width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EGP $price',
                            style: getRegularStyle(
                              color: ColorManager.text,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            '$discountPercentage %',
                            style: getTextWithLine(),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Review ($rating)',
                                style: getRegularStyle(
                                  color: ColorManager.text,
                                  fontSize: 12.sp,
                                ),
                              ),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: ColorManager.starRate,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: height * 0.036,
                              width: width * 0.08,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorManager.primary,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
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

  String _truncateTitle(String title) {
    final List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return '${words.sublist(0, 2).join(' ')}..';
    }
  }

  String _truncateDescription(String description) {
    final List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return '${words.sublist(0, 4).join(' ')}..';
    }
  }
}

import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceAndCheckoutButton extends StatelessWidget {
  const TotalPriceAndCheckoutButton({
    required this.totalPrice,
    required this.checkoutButtonOnTap,
  });

  final int totalPrice;
  final void Function() checkoutButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total price',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getMediumStyle(
                color: ColorManager.text.withOpacity(0.6),
                fontSize: FontSize.s18,
              ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 90.w,
              child: Text(
                'EGP $totalPrice',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getMediumStyle(
                  color: ColorManager.text,
                  fontSize: FontSize.s18,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 18.h),
        Expanded(
          child: CustomElevatedButton(
            label: 'Check Out',
            onTap: checkoutButtonOnTap,
            suffixIcon: const Icon(
              Icons.arrow_forward,
              color: ColorManager.white,
            ),
          ),
        ),
      ],
    );
  }
}

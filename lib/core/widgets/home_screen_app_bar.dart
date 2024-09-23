import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  const HomeScreenAppBar({this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      title: SvgPicture.asset(
        SvgAssets.route,
        height: 25.h,
        width: 25.w,
        colorFilter: const ColorFilter.mode(ColorManager.text, BlendMode.srcIn),
      ),
      bottom: PreferredSize(
        preferredSize: Size(Sizes.s100.w, Sizes.s60.h),
        child: Padding(
          padding: EdgeInsets.all(Insets.s8.sp),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: ColorManager.primary,
                  style: getRegularStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s16,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Insets.s12.w,
                      vertical: Insets.s8.h,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: Sizes.s1,
                        color: ColorManager.primary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: Sizes.s1,
                        color: ColorManager.primary,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: Sizes.s1,
                        color: ColorManager.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: Sizes.s1,
                        color: ColorManager.primary,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: Sizes.s1,
                        color: ColorManager.error,
                      ),
                    ),
                    prefixIcon: const ImageIcon(
                      AssetImage(IconsAssets.search),
                      color: ColorManager.primary,
                    ),
                    hintText: 'what do you search for?',
                    hintStyle: getRegularStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s16,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pushNamed(Routes.cart),
                icon: const ImageIcon(
                  AssetImage(IconsAssets.cart),
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}

import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab();

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  bool _isFullNameReadOnly = true;
  bool _isEmailReadOnly = true;
  bool _isPasswordReadOnly = true;
  bool _isPhoneReadOnly = true;
  bool _isAddressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Insets.s20.sp),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                SvgAssets.route,
                height: Sizes.s40.h,
                colorFilter: const ColorFilter.mode(
                  ColorManager.primary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: Sizes.s20.h),
              Text(
                'Welcome, Mohamed',
                style: getSemiBoldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
              ),
              Text(
                'mohamed.N@gmail.com',
                style: getRegularStyle(
                  color: ColorManager.primary.withOpacity(.5),
                  fontSize: FontSize.s14,
                ),
              ),
              SizedBox(height: Sizes.s18.h),
              CustomTextField(
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: _isFullNameReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your full name',
                label: 'Full Name',
                controller:
                    TextEditingController(text: 'Mohamed Mohamed Nabil'),
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () => setState(() => _isFullNameReadOnly = false),
                ),
                textInputType: TextInputType.text,
                validation: Validator.validateFullName,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: Sizes.s18.h),
              CustomTextField(
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: _isEmailReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your email address',
                label: 'E-mail address',
                controller: TextEditingController(text: 'mohamed.N@gmail.com'),
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () => setState(() => _isEmailReadOnly = false),
                ),
                textInputType: TextInputType.emailAddress,
                validation: Validator.validateEmail,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: Sizes.s18.h),
              CustomTextField(
                onTap: () => setState(() => _isPasswordReadOnly = false),
                controller: TextEditingController(text: '123456789123456'),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: _isPasswordReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your password',
                label: 'Password',
                isObscured: true,
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: SvgPicture.asset(SvgAssets.edit),
                textInputType: TextInputType.text,
                validation: Validator.validatePassword,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: Sizes.s18.h),
              CustomTextField(
                controller: TextEditingController(text: '01122118855'),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: _isPhoneReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your mobile no.',
                label: 'Your mobile number',
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () => setState(() => _isPhoneReadOnly = false),
                ),
                textInputType: TextInputType.phone,
                validation: Validator.validatePhoneNumber,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: Sizes.s18.h),
              CustomTextField(
                controller:
                    TextEditingController(text: '6th October, street 11.....'),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: _isAddressReadOnly,
                backgroundColor: ColorManager.white,
                hint: '6th October, street 11.....',
                label: 'Your Address',
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () => setState(() => _isAddressReadOnly = false),
                ),
                textInputType: TextInputType.streetAddress,
                validation: Validator.validateFullName,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: Sizes.s50.h),
            ],
          ),
        ),
      ),
    );
  }
}

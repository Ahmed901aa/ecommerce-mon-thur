import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/widgets/custom_text_field.dart';
import 'package:ecommerce/features/auth/presentation/auth_cubit.dart';
import 'package:ecommerce/features/auth/screens/data/models/register_requst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Insets.s20.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Sizes.s40.h,
                ),
                Center(child: SvgPicture.asset(SvgAssets.route)),
                SizedBox(
                  height: Sizes.s40.h,
                ),
                CustomTextField(
                  backgroundColor: ColorManager.white,
                  hint: 'enter your full name',
                  label: 'Full Name',
                  textInputType: TextInputType.name,
                  validation: Validator.validateFullName,
                  controller: nameController,
                ),
                SizedBox(
                  height: Sizes.s18.h,
                ),
                CustomTextField(
                  hint: 'enter your mobile no.',
                  backgroundColor: ColorManager.white,
                  label: 'Mobile Number',
                  validation: Validator.validatePhoneNumber,
                  textInputType: TextInputType.phone,
                  controller: phoneController,
                ),
                SizedBox(
                  height: Sizes.s18.h,
                ),
                CustomTextField(
                  hint: 'enter your email address',
                  backgroundColor: ColorManager.white,
                  label: 'E-mail address',
                  validation: Validator.validateEmail,
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(
                  height: Sizes.s18.h,
                ),
                CustomTextField(
                  hint: 'enter your password',
                  backgroundColor: ColorManager.white,
                  label: 'password',
                  validation: Validator.validatePassword,
                  isObscured: true,
                  textInputType: TextInputType.text,
                  controller: passwordController,
                ),
                SizedBox(
                  height: Sizes.s50.h,
                ),
                Center(
                  child: SizedBox(
                    height: Sizes.s60.h,
                    width: MediaQuery.sizeOf(context).width * .9,
                    child: CustomElevatedButton(
                      label: 'Sign Up',
                      backgroundColor: ColorManager.white,
                      isStadiumBorder: false,
                      textStyle: getBoldStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s20,
                      ),
                      onTap: () {
                        BlocProvider.of<AuthCubit>(context).register(
                          RegisterRequest(
                            username: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                            password: passwordController.text,
                          ), 
                          
                         
                         
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}

import 'dart:async';

import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/credentials_storage.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/widgets/custom_text_field.dart';
import 'package:ecommerce/features/auth/presentation/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/auth_state.dart';
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
  final formkey = GlobalKey<FormState>();
  String? _authError;
  Timer? _errorTimer;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    _errorTimer?.cancel();
    super.dispose();
  }

  void _setAuthError(String? message) {
    _errorTimer?.cancel();
    if (message == null) {
      setState(() => _authError = null);
      return;
    }
    setState(() => _authError = message);
    _errorTimer = Timer(const Duration(seconds: 10), () {
      if (mounted) setState(() => _authError = null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Insets.s20.sp),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
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
                      child: BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is RegisterLoading) {
                            UiUtils.showLoading(context);
                            _setAuthError(null);
                          } else if (state is RegisterSuccess) {
                            UiUtils.hideLoading(context);
                            _setAuthError(null);
                            // Save credentials so user can sign in faster next time
                            CredentialsStorage.saveCredentials(
                              emailController.text,
                              passwordController.text,
                            );
                            Navigator.of(context).pushReplacementNamed(Routes.home);
                          } else if (state is RegisterFailure) {
                            UiUtils.hideLoading(context);
                            _setAuthError(state.message);
                          }
                        },
                        child: CustomElevatedButton(
                          label: 'Sign Up',
                          backgroundColor: ColorManager.white,
                          isStadiumBorder: false,
                          textStyle: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s20,
                          ),
                          onTap: () {
                            if (formkey.currentState!.validate() == true) {
                              BlocProvider.of<AuthCubit>(context).register(
                                RegisterRequest(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phoneNumber: phoneController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  if (_authError != null)
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _authError!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 
}

import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/credentials_storage.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/widgets/custom_text_field.dart';
import 'package:ecommerce/features/auth/presentation/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/auth_state.dart';
import 'package:ecommerce/features/auth/screens/data/models/login_requst.dart';
import 'package:ecommerce/features/auth/screens/mixins/login_screen_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginScreenMixin {
  @override
  late final emailController = TextEditingController();
  @override
  late final passwordController = TextEditingController();
  
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initLoginScreen();
  }

  @override
  void dispose() {
    disposeLoginScreen();
    super.dispose();
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
                  Text(
                    'Welcome Back To Route',
                    style: getBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s24),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: getLightStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s16),
                  ),
                  SizedBox(
                    height: Sizes.s50.h,
                  ),
                  CustomTextField(
                    backgroundColor: ColorManager.white,
                    hint: 'enter your email',
                    label: 'Email',
                    textInputType: TextInputType.emailAddress,
                    validation: Validator.validateEmail,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: Sizes.s28.h,
                  ),
                  CustomTextField(
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'Password',
                    validation: Validator.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: Sizes.s8.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forget password?',
                          style: getMediumStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.s60.h,
                  ),
                  Center(
                    child: SizedBox(
                      child: BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is LoginLoading) {
                            UiUtils.showLoading(context);
                            setAuthError(null);
                          } else if (state is LoginSuccess) {
                            UiUtils.hideLoading(context);
                            setAuthError(null);
                            // Save credentials for next time (consider secure storage for passwords)
                            CredentialsStorage.saveCredentials(
                              emailController.text,
                              passwordController.text,
                            );
                            Navigator.of(context).pushReplacementNamed(Routes.home);
                          } else if (state is LoginFailure) {
                            UiUtils.hideLoading(context);
                            setAuthError(state.message);
                          }
                        },
                        child: CustomElevatedButton(
                          label: 'sgin In',
                          backgroundColor: ColorManager.white,
                          isStadiumBorder: false,
                          textStyle: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s18,
                          ),
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).login(
                                LoginRequest(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: getSemiBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16),
                      ),
                      SizedBox(
                        width: Sizes.s8.w,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(Routes.register),
                        child: Text(
                          'Create Account',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  if (authError != null)
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          authError!,
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

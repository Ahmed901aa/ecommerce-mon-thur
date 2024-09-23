import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/widgets/custom_text_field.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Insets.s20.sp),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                    controller: _emailController,
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
                    controller: _passwordController,
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
                        listener: (_, state) {
                          if (state is LoginLoading) {
                            UIUtils.showLoading(context);
                          } else if (state is LoginSuccess) {
                            UIUtils.hideLoading(context);
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.home);
                          } else if (state is LoginError) {
                            UIUtils.hideLoading(context);
                            UIUtils.showMessage(state.message);
                          }
                        },
                        child: CustomElevatedButton(
                          label: 'Login',
                          backgroundColor: ColorManager.white,
                          isStadiumBorder: false,
                          textStyle: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s18,
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().login(
                                    LoginRequest(
                                      email: _emailController.text,
                                      password: _passwordController.text,
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
                        'Don’t have an account?',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

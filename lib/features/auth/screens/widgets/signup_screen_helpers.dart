part of '../sign_up_screen.dart';

extension _SignUpScreenHelpers on _RegisterScreenState {
  List<Widget> buildSignUpContent(BuildContext context) => [
        SizedBox(height: Sizes.s40.h),
        Center(child: SvgPicture.asset(SvgAssets.route)),
        SizedBox(height: Sizes.s40.h),
        CustomTextField(
          backgroundColor: ColorManager.white,
          hint: 'enter your full name',
          label: 'Full Name',
          textInputType: TextInputType.name,
          validation: Validator.validateFullName,
          controller: nameController,
        ),
        SizedBox(height: Sizes.s18.h),
        CustomTextField(
          hint: 'enter your mobile no.',
          backgroundColor: ColorManager.white,
          label: 'Mobile Number',
          validation: Validator.validatePhoneNumber,
          textInputType: TextInputType.phone,
          controller: phoneController,
        ),
        SizedBox(height: Sizes.s18.h),
        CustomTextField(
          hint: 'enter your email address',
          backgroundColor: ColorManager.white,
          label: 'E-mail address',
          validation: Validator.validateEmail,
          textInputType: TextInputType.emailAddress,
          controller: emailController,
        ),
        SizedBox(height: Sizes.s18.h),
        CustomTextField(
          hint: 'enter your password',
          backgroundColor: ColorManager.white,
          label: 'password',
          validation: Validator.validatePassword,
          isObscured: true,
          textInputType: TextInputType.text,
          controller: passwordController,
        ),
        SizedBox(height: Sizes.s50.h),
        buildSignUpButton(context),
        SizedBox(height: 30.h),
        buildSignInPrompt(context),
        SizedBox(height: 10.h),
        if (_authError != null) buildSignUpErrorBanner(),
      ];

  Widget buildSignUpButton(BuildContext context) => Center(
        child: SizedBox(
          height: Sizes.s60.h,
          width: MediaQuery.sizeOf(context).width * .9,
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterLoading) {
                UiUtils.showLoading(context);
              } else if (state is RegisterSuccess) {
                UiUtils.hideLoading(context);
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
                if (!_formKey.currentState!.validate()) return;
                BlocProvider.of<AuthCubit>(context).register(
                  RegisterRequest(
                    name: nameController.text,
                    email: emailController.text,
                    phoneNumber: phoneController.text,
                    password: passwordController.text,
                  ),
                );
              },
            ),
          ),
        ),
      );

  Widget buildSignInPrompt(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Do you have an account?',
              style: getSemiBoldStyle(color: ColorManager.white)
                  .copyWith(fontSize: FontSize.s16),),
          SizedBox(width: Sizes.s8.w),
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(Routes.login),
            child: Text('Sign In',
                style: getSemiBoldStyle(color: ColorManager.white)
                    .copyWith(fontSize: FontSize.s16),),
          ),
        ],
      );

  Widget buildSignUpErrorBanner() => Center(
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
      );
}

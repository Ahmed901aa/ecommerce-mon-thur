part of '../sgin_in_screen.dart';

extension _LoginScreenHelpers on _LoginScreenState {
  List<Widget> buildContent(BuildContext context) => [
        SizedBox(height: Sizes.s40.h),
        Center(child: SvgPicture.asset(SvgAssets.route)),
        SizedBox(height: Sizes.s40.h),
        Text('Welcome Back To Route',
            style: getBoldStyle(color: ColorManager.white)
                .copyWith(fontSize: FontSize.s24)),
        Text('Please sign in with your mail',
            style: getLightStyle(color: ColorManager.white)
                .copyWith(fontSize: FontSize.s16)),
        SizedBox(height: Sizes.s50.h),
        CustomTextField(
          backgroundColor: ColorManager.white,
          hint: 'enter your email',
          label: 'Email',
          textInputType: TextInputType.emailAddress,
          validation: Validator.validateEmail,
          controller: _emailController,
        ),
        SizedBox(height: Sizes.s28.h),
        CustomTextField(
          hint: 'enter your password',
          backgroundColor: ColorManager.white,
          label: 'Password',
          validation: Validator.validatePassword,
          isObscured: true,
          textInputType: TextInputType.text,
          controller: _passwordController,
        ),
        SizedBox(height: Sizes.s8.h),
        Row(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text('Forget password?',
                  style: getMediumStyle(color: ColorManager.white)
                      .copyWith(fontSize: FontSize.s18)),
            ),
          ],
        ),
        SizedBox(height: Sizes.s60.h),
        buildLoginButton(context),
        SizedBox(height: 30.h),
        buildSignUpPrompt(context),
        SizedBox(height: 10.h),
        if (_authError != null) buildErrorBanner(),
      ];

  Widget buildLoginButton(BuildContext context) => Center(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              UiUtils.showLoading(context);
            } else if (state is LoginSuccess) {
              UiUtils.hideLoading(context);
              CredentialsStorage.saveCredentials(
                _emailController.text,
                _passwordController.text,
              );
              Navigator.of(context).pushReplacementNamed(Routes.home);
            } else if (state is LoginFailure) {
              UiUtils.hideLoading(context);
              _setAuthError(state.message);
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
              if (!_formKey.currentState!.validate()) return;
              BlocProvider.of<AuthCubit>(context).login(
                LoginRequest(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              );
            },
          ),
        ),
      );

  Widget buildSignUpPrompt(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account?",
              style: getSemiBoldStyle(color: ColorManager.white)
                  .copyWith(fontSize: FontSize.s16)),
          SizedBox(width: Sizes.s8.w),
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(Routes.register),
            child: Text('Create Account',
                style: getSemiBoldStyle(color: ColorManager.white)
                    .copyWith(fontSize: FontSize.s16)),
          ),
        ],
      );

  Widget buildErrorBanner() => Center(
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

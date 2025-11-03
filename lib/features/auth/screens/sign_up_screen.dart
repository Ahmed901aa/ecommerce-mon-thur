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

part 'widgets/signup_screen_helpers.dart';

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
  final _formKey = GlobalKey<FormState>();
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
    if (!mounted) return;
    setState(() => _authError = message);
    if (message == null) return;
    _errorTimer = Timer(const Duration(seconds: 10), () {
      if (mounted) setState(() => _authError = null);
    });
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Insets.s20.sp),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildSignUpContent(context),
                ),
              ),
            ),
          ),
        ),
      );
}

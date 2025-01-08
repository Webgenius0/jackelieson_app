import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/common_widgets/app_custom_buttom.dart';
import 'package:jackelieson/common_widgets/custom_text_feild.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/all_routes.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: 50.h,
          left: 20.w,
          right: 20.w,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 24.sp,
                        color: AppColors.c222222,
                      ),
                    ),
                    Text(
                      'Login to get started',
                      style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 14.sp,
                        color: AppColors.c555555,
                      ),
                    ),
                    UIHelper.verticalSpace(50.h),
                    Text(
                      'Email Address',
                      style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 14.sp,
                        color: AppColors.c222222,
                      ),
                    ),
                    UIHelper.verticalSpace(8.h),
                    CustomTextFormField(
                      controller: _emailController,
                      isPrefixIcon: true,
                      fillColor: AppColors.cF7F7F7,
                      prefixImage: Assets.icons.mail,
                      hintText: 'Enter Email',
                      borderRadius: 4.r,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        String pattern =
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(8.h),
                    GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(
                          Routes.forgotPasswordScreen,
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                              .copyWith(
                            fontSize: 14.sp,
                            color: AppColors.allPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(12.h),
                    Text(
                      'Password',
                      style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 14.sp,
                        color: AppColors.c222222,
                      ),
                    ),
                    UIHelper.verticalSpace(8.h),
                    CustomTextFormField(
                      controller: _passwordController,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      isPrefixIcon: true,
                      obscureText: provider.isObsecure,
                      fillColor: AppColors.cF7F7F7,
                      prefixImage: Assets.icons.lockPass,
                      hintText: 'Enter Password',
                      isBorder: false,
                      suffixIcon: provider.isObsecure
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onSuffixIconTap: () {
                        provider.toggleObsecure();
                        print('object');
                      },
                      borderRadius: 4.r,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(70.h),
                    AppCustomButtom(
                      btnName: 'Log in',
                      borderRadius: 10.r,
                      isBorder: false,
                      borderColor: AppColors.allPrimaryColor,
                      bgColor: AppColors.allPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      textColor: AppColors.cFFFFFF,
                      onTap: () {
                        // if (_formKey.currentState!.validate()) {}
                        NavigationService.navigateTo(Routes.navigation);
                      },
                    ),
                    UIHelper.verticalSpace(20.h),
                    GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(
                          Routes.createAccountScreen,
                        );
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Create Account',
                          style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                              .copyWith(
                            fontSize: 18.sp,
                            color: AppColors.allPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

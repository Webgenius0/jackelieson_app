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
import 'package:jackelieson/networks/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _newPssController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _newPssController.dispose();
    _confirmPassController.dispose();
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
                      'Create New Password',
                      style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 24.sp,
                        color: AppColors.c222222,
                      ),
                    ),
                    Text(
                      'Create a new Password to access your account',
                      style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 14.sp,
                        color: AppColors.c555555,
                      ),
                    ),
                    UIHelper.verticalSpace(70.h),
                    Text(
                      'New Password',
                      style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 14.sp,
                        color: AppColors.c222222,
                      ),
                    ),
                    UIHelper.verticalSpace(8.h),
                    CustomTextFormField(
                      controller: _newPssController,
                      isPrefixIcon: true,
                      obscureText: provider.isObsecure,
                      fillColor: AppColors.cF7F7F7,
                      prefixImage: Assets.icons.lockPass,
                      suffixIcon: provider.isObsecure
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onSuffixIconTap: () {
                        provider.toggleObsecure();
                        print('object');
                      },
                      hintText: 'Enter New password',
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
                    UIHelper.verticalSpace(12.h),
                    Text(
                      'Confirm Password',
                      style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 14.sp,
                        color: AppColors.c222222,
                      ),
                    ),
                    UIHelper.verticalSpace(8.h),
                    CustomTextFormField(
                      controller: _confirmPassController,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      isPrefixIcon: true,
                      obscureText: provider.isObsecure,
                      fillColor: AppColors.cF7F7F7,
                      prefixImage: Assets.icons.lockPass,
                      hintText: 'Enter Confirm Password',
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
                    UIHelper.verticalSpace(80.h),
                    AppCustomButtom(
                      btnName: 'Cnange Password',
                      borderRadius: 10.r,
                      isBorder: false,
                      borderColor: AppColors.allPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      textColor: AppColors.cFFFFFF,
                      onTap: () {
                        // if (_formKey.currentState!.validate()) {

                        // }
                        NavigationService.navigateTo(
                          Routes.loginScreen,
                        );
                      },
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

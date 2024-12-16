import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/common_widgets/custom_auth_button.dart';
import 'package:jackelieson/common_widgets/custom_text_feild.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextFontStyle.headline18w600cFEFFFFStyleRoboto.copyWith(
                fontSize: 24.sp,
                color: AppColors.c222222,
              ),
            ),
            Text(
              'Login to get started',
              style: TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                fontSize: 14.sp,
                color: AppColors.c555555,
              ),
            ),
            UIHelper.verticalSpace(50.h),
            Text(
              'Email Address',
              style: TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                fontSize: 14.sp,
                color: AppColors.c555555,
              ),
            ),
            UIHelper.verticalSpace(8.h),
            CustomTextFormField(
              isPrefixIcon: true,
              fillColor: AppColors.cF7F7F7,
              prefixImage: Assets.icons.mail,
              hintText: 'Enter Email',
            ),
            UIHelper.verticalSpace(8.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.allPrimaryColor,
                ),
              ),
            ),
            UIHelper.verticalSpace(12.h),
            Text(
              'Password',
              style: TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                fontSize: 14.sp,
                color: AppColors.c555555,
              ),
            ),
            UIHelper.verticalSpace(8.h),
            CustomTextFormField(
              isPrefixIcon: true,
              fillColor: AppColors.cF7F7F7,
              prefixImage: Assets.icons.mail,
              hintText: 'Enter Password',
              isBorder: false,
              borderRadius: 4.r,
            ),
            UIHelper.verticalSpace(70.h),
            AuthCustomeButton(
              name: 'Log in',
              color: AppColors.allPrimaryColor,
              borderRadius: 10.r,
              context: context,
              height: 50.h,
              minWidth: double.maxFinite,
              onCallBack: () {},
              textStyle:
                  TextFontStyle.headline16w500cFEFFFFStyleRoboto.copyWith(
                fontSize: 16.sp,
                color: AppColors.cFFFFFF,
              ),
            ),
            UIHelper.verticalSpace(20.h),
            GestureDetector(
              onTap: () {},
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Create Account',
                  style:
                      TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.allPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/common_widgets/app_custom_buttom.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class PasswordChangeSuccessScreen extends StatefulWidget {
  const PasswordChangeSuccessScreen({super.key});

  @override
  State<PasswordChangeSuccessScreen> createState() =>
      _PasswordChangeSuccessScreenState();
}

class _PasswordChangeSuccessScreenState
    extends State<PasswordChangeSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 62.w,
              height: 62.h,
              image: AssetImage(Assets.images.successmark.path),
            ),
            UIHelper.verticalSpace(12.h),
            Text(
              'Password Changed!',
              style: TextFontStyle.headline18w600cFEFFFFStyleRoboto.copyWith(
                fontSize: 24.sp,
                color: AppColors.c000000,
              ),
            ),
            UIHelper.verticalSpace(8.h),
            Text(
              'Your password has been changed successfully.',
              textAlign: TextAlign.center,
              style: TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                fontSize: 14.sp,
                color: AppColors.c555555,
              ),
            ),
            UIHelper.verticalSpace(32.h),
            AppCustomButtom(
              btnName: 'Okay',
              borderRadius: 8,
            )
          ],
        ),
      ),
    );
  }
}

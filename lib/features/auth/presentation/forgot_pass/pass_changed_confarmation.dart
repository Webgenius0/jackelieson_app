import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class PassChangedConfarmation extends StatefulWidget {
  const PassChangedConfarmation({super.key});

  @override
  State<PassChangedConfarmation> createState() =>
      _PassChangedConfarmationState();
}

class _PassChangedConfarmationState extends State<PassChangedConfarmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.successmark.path,
              width: 62.w,
              height: 62.h,
            ),
            UIHelper.verticalSpaceMediumLarge,
            Text('Password Changed!',
                textAlign: TextAlign.center,
                style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                    .copyWith(fontSize: 24.sp, color: AppColors.c1E232C)),
            SizedBox(
              width: 227.w,
              child: Text(
                'Your password has been changed successfully.',
                textAlign: TextAlign.center,
                style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                    .copyWith(color: AppColors.c555555, fontSize: 14.sp),
              ),
            ),
            UIHelper.verticalSpaceSemiLarge,
            // InkWell(
            //   onTap: () => NavigationService.navigateTo(Routes.loginScreen),
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 28.w),
            //     child: AppCustomButtom(
            //       btnName: 'Okay',
            //       borderRadius: 10.r,
            //       isBorder: false,
            //       borderColor: AppColors.allPrimaryColor,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w900,
            //       textColor: AppColors.cFFFFFF,
            //       // onTap: () {
            //       //   log("message");;
            //       //   // Get.to(() => LoginScreen());
            //       // },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

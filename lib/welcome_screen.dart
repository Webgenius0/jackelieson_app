import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment(0, 0),
        // fit: StackFit.loose,
        children: [
          Image(
            image: AssetImage(Assets.images.splashBg.path),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Assets.images.logo.path),
                  height: 52.h,
                  width: 52.w,
                ),
                UIHelper.verticalSpace(20.h),
                Text(
                  'Priority Planner',
                  style:
                      TextFontStyle.headline22w800cFEFFFFStyleRoboto.copyWith(
                    fontSize: 32.sp,
                    color: AppColors.cFFFFFF,
                  ),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: 25.w,
          //     vertical: 20.h,
          //   ),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: GestureDetector(
          //       onTap: () {
          //         NavigationService.navigateTo(Routes.loginScreen);
          //       },
          //       child: Container(
          //         alignment: Alignment.center,
          //         height: 48.h,
          //         width: double.infinity,
          //         padding: EdgeInsets.symmetric(
          //           horizontal: 58.w,
          //           vertical: 8.h,
          //         ),
          //         decoration: ShapeDecoration(
          //           gradient: LinearGradient(
          //             begin: Alignment(1.00, 0.01),
          //             end: Alignment(-1, -0.01),
          //             colors: [
          //               Color(0xFF0077FF),
          //               Color(0xFF4EC4FF),
          //             ],
          //           ),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10.r),
          //           ),
          //         ),
          //         child: Text(
          //           'Let\'s Go',
          //           style:
          //               TextFontStyle.headline16w500cFEFFFFStyleRoboto.copyWith(
          //             fontSize: 20.sp,
          //             color: AppColors.cFFFFFF,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

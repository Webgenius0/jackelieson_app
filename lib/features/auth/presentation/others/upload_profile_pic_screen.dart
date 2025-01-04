import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/common_widgets/app_custom_buttom.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/all_routes.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class UploadProfilePicScreen extends StatefulWidget {
  const UploadProfilePicScreen({super.key});

  @override
  State<UploadProfilePicScreen> createState() => _UploadProfilePicScreenState();
}

class _UploadProfilePicScreenState extends State<UploadProfilePicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 50.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Skip',
                      style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 16.sp,
                        color: AppColors.c000000,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                UIHelper.verticalSpace(60.h),
                Container(
                  width: 180.w,
                  height: 180.h,
                  padding: EdgeInsets.all(60.r),
                  decoration: ShapeDecoration(
                    color: AppColors.cF7F7F7,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.94,
                        color: AppColors.allPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  child: Image(
                    height: 50.h,
                    width: 50.w,
                    image: AssetImage(
                      Assets.images.uploadProfilePic.path,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                Text(
                  'Take/Upload profile pic',
                  style:
                      TextFontStyle.headline16w500cFEFFFFStyleRoboto.copyWith(
                    fontSize: 20.sp,
                    color: AppColors.c000000,
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Text(
                  'Select your profile pic by taping the profile icon',
                  style:
                      TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.c000000.withOpacity(
                      0.6,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(150.h),
                AppCustomButtom(
                  onTap: () {
                    NavigationService.navigateTo(Routes.chooseHabitsScreen);
                  },
                  btnName: 'Set profile pic',
                  borderRadius: 8,
                  textColor: AppColors.cFFFFFF,
                  fontWeight: FontWeight.w600,
                  bgColor: AppColors.allPrimaryColor,
                )
              ],
            ),
          ),
        ));
  }
}

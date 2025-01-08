import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class AddPlanWidget extends StatelessWidget {
  const AddPlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * .5,
      padding: EdgeInsets.all(16.sp),
      // margin: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(24)),

      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                Assets.icons.closeCircle,
                height: 30.sp,
                fit: BoxFit.cover,
              ),
            ),
          ),
          UIHelper.verticalSpace(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Add plan',
                  style: TextFontStyle.headline16w600c686868StyleRoboto
                      .copyWith(fontSize: 24.sp)),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => _buildPlanDetails(),
                  );
                },
                child: SvgPicture.asset(
                  Assets.icons.detailInfoIcon,
                  height: 28.sp,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          UIHelper.verticalSpace(24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                decoration: ShapeDecoration(
                  color: Color(0xFF1497FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text('Save',
                      style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                          .copyWith(fontSize: 20.sp)),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                decoration: ShapeDecoration(
                  color: Color(0xFF1497FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text('Save',
                      style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                          .copyWith(fontSize: 20.sp)),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                decoration: ShapeDecoration(
                  color: Color(0xFF1497FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text('Save',
                      style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                          .copyWith(fontSize: 20.sp)),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(24.h),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 130.w,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              decoration: ShapeDecoration(
                color: Color(0xFF1497FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text('Save',
                    style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                        .copyWith(fontSize: 20.sp)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildPlanDetails() => Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 34.w),
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(10.r),
        ),
        height: 200.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.icons.habitGroup,
                  color: AppColors.c1497FF,
                  height: 24.sp,
                ),
                UIHelper.horizontalSpaceSmall,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Habits: ",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 17.sp,
                          color: AppColors.c1497FF,
                        ),
                      ),
                      TextSpan(
                        text: "Tasks that repeat over time",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 15.sp,
                          color: AppColors.c686868,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            UIHelper.verticalSpace(21.h),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.icons.tasks,
                  color: AppColors.c1497FF,
                  height: 24.sp,
                ),
                UIHelper.horizontalSpaceSmall,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Tasks: ",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 17.sp,
                          color: AppColors.c1497FF,
                        ),
                      ),
                      TextSpan(
                        text: "Actions you need to complete",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 15.sp,
                          color: AppColors.c686868,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            UIHelper.verticalSpace(21.h),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.icons.tasks,
                  color: AppColors.c1497FF,
                  height: 24.sp,
                ),
                UIHelper.horizontalSpaceSmall,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Tasks: ",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 17.sp,
                          color: AppColors.c1497FF,
                        ),
                      ),
                      TextSpan(
                        text: "Actions you need to complete",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 15.sp,
                          color: AppColors.c686868,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            UIHelper.verticalSpace(21.h),
          ],
        ),
      );
}

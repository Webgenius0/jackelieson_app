import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/common_widgets/custom_network_image.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class ProfileHeaderImageWidget extends StatelessWidget {
  const ProfileHeaderImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBackButton(),
        Container(
          padding: EdgeInsets.all(2.sp),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.c242760),
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: EdgeInsets.all(2.sp),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.c242760),
              shape: BoxShape.circle,
            ),
            child: CustomNetworkImageWidget(
              urls:
                  "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
              height: 140.h,
              width: 140.w,
            ),
          ),
        ),
        _buildSaveButton()
      ],
    );
  }

  GestureDetector _buildSaveButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: ShapeDecoration(
          color: AppColors.c0070F0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child:
            Text('Save', style: TextFontStyle.headline16w500cFEFFFFStyleRoboto),
      ),
    );
  }

  GestureDetector _buildBackButton() {
    return GestureDetector(
      onTap: () {
        NavigationService.goBack;
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.c686868,
          ),
          UIHelper.horizontalSpace(5.w),
          Text(
            "Back",
            style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                .copyWith(fontSize: 17.sp, color: AppColors.c686868),
          )
        ],
      ),
    );
  }
}

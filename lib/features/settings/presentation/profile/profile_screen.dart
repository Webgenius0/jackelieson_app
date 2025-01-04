import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jackelieson/common_widgets/my_custom_text_feild.dart';
import 'package:jackelieson/features/settings/presentation/profile/widget/profile_header_image_widget.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 25.h),
          child: Column(
            children: [
              ProfileHeaderImageWidget(),
              UIHelper.verticalSpaceMedium,
              Container(
                height: 371,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                decoration: ShapeDecoration(
                  color: AppColors.cFFFFFF,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50.w,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: AppColors.cDDDDDD,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 14,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Color(0xFF686868),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0.88,
                      ),
                    ),
                    UIHelper.verticalSpaceSmall,
                    MyCustomTextFormField(
                      isPrefixIcon: false,
                      isBorder: true,
                      borderColor: AppColors.cE7E6E6,
                      hintText: "Melissa Peters",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jackelieson/common_widgets/custom_dropdown.dart';
import 'package:jackelieson/features/settings/presentation/setting/widgets/setting_list_tile_items.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';

class SettingUserContainer extends StatelessWidget {
  const SettingUserContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(16.sp),
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
        children: [
          //--------- start -----------
          SettingListTileItems(
            iconPath: Assets.icons.profile,
            label: "Profile",
            trailingWidget: SvgPicture.asset(Assets.icons.nextTile),
          ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),

          SettingListTileItems(
            iconPath: Assets.icons.language,
            label: "Language",
            trailingWidget: MyCustomDropdown(
              height: 40.h,
              width: 63.w,
              // selectedValue: 'Eng',
              hinttext: "Eng",
              horizonPadding: 0,
              dropDownValue: const ["Eng", "Bn"],
              isImageNull: true,
            ), //,
          ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),

          SettingListTileItems(
            iconPath: Assets.icons.theme,
            label: "Theme",
            trailingWidget: MyCustomDropdown(
              height: 40.h,
              width: 63.w,
              // selectedValue: 'Eng',
              hinttext: "Light",
              horizonPadding: 0,
              dropDownValue: const ["Light", "Dark"],
              isImageNull: true,
            ), //,
          ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),

          SettingListTileItems(
            iconPath: Assets.icons.synceCalender,
            label: "Sync calendar",
            trailingWidget: MyCustomDropdown(
              height: 40.h,
              width: 70.w,
              // selectedValue: 'Eng',
              hinttext: "Google",
              horizonPadding: 0,
              dropDownValue: const ["Light", "Dark"],
              isImageNull: true,
            ), //,
          ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),
          SettingListTileItems(
            iconPath: Assets.icons.startWeek,
            label: "Week starts on",
            trailingWidget: MyCustomDropdown(
              height: 40.h,
              width: 70.w,
              // selectedValue: 'Eng',
              hinttext: "Sunday",
              horizonPadding: 0,
              dropDownValue: const ["Light", "Dark"],
              isImageNull: true,
            ), //,
          ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),
          SettingListTileItems(
            iconPath: Assets.icons.notification,
            label: "Notification",
            trailingWidget: MyCustomDropdown(
              height: 40.h,
              width: 63.w,
              // selectedValue: 'Eng',
              hinttext: "OFF",
              horizonPadding: 0,
              dropDownValue: const ["OFF", "ON"],
              isImageNull: true,
            ), //,
          ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),
          SettingListTileItems(
            iconPath: Assets.icons.vibration,
            label: "Vibration",
            trailingWidget: MyCustomDropdown(
              height: 40.h,
              width: 63.w,
              // selectedValue: 'Eng',
              hinttext: "OFF",
              horizonPadding: 0,
              dropDownValue: const ["OFF", "ON"],
              isImageNull: true,
            ), //,
          ),
          DottedLine(
            dashColor: AppColors.cB7B7B7,
          ),
        ],
      ),
    );
  }
}

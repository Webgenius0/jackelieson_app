import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class SettingHeaderDesignWidget extends StatelessWidget {
  const SettingHeaderDesignWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: AppColors.cF7F7F7,
              borderRadius: BorderRadius.circular(32.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icons.settings),
              UIHelper.horizontalSpaceSmall,
              Text('Settings',
                  style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                      .copyWith(color: AppColors.c686868)),
            ],
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}

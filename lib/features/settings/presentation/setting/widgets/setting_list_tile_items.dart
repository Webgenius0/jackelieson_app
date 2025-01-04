import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/colors.gen.dart';

class SettingListTileItems extends StatelessWidget {
  const SettingListTileItems({
    super.key,
    required this.iconPath,
    required this.label,
    required this.trailingWidget,
    this.onTap,
  });

  final String iconPath;
  final String label;
  final Widget trailingWidget;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.all(8.sp),
      leading: SvgPicture.asset(
        iconPath,
        height: 20.h,
        width: 20.h,
      ),
      title: Text(
        label,
        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto.copyWith(
          color: AppColors.c686868,
          fontSize: 14.sp,
        ),
      ),
      trailing: trailingWidget,
    );
  }
}

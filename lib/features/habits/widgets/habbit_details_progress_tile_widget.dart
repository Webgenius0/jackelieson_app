import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class HabbitDetailsProgressTileWidget extends StatelessWidget {
  const HabbitDetailsProgressTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cF7F7F7, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(18.sp),
            child: Row(
              children: [
                SvgPicture.asset(Assets.icons.workOutIcon),
                UIHelper.horizontalSpaceSmall,
                Column(
                  children: [
                    Text(
                      'Work out',
                      style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                          .copyWith(
                        color: AppColors.c686868,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      'Sun - Mon',
                      style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                          .copyWith(
                        color: AppColors.c686868,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 80.w,
            child: Stack(
              alignment: Alignment(0, 0),
              children: [
                CircularProgressIndicator(
                  strokeWidth: 5,
                  value: 0.7,
                  backgroundColor: AppColors.allPrimaryColor.withOpacity(.2),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.allPrimaryColor),
                ),
                Text(
                  '25%',
                  style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                      .copyWith(
                          fontSize: 11.sp, color: AppColors.allPrimaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

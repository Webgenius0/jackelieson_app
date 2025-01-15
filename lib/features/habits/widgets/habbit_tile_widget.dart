import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class HabbitTileWidget extends StatelessWidget {
  const HabbitTileWidget({
    super.key, this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 19.h),
          width: double.maxFinite,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.allPrimaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.workOutIcon,
                    height: 32.h,
                    width: 32.w,
                  ),
                  UIHelper.horizontalSpace(12.w),
                  Column(
                    children: [
                      Text(
                        'Work out',
                        style: TextFontStyle.headline20w700cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Sun - Mon',
                        style: TextFontStyle.headline20w700cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.w),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4.71),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.71),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.icons.fireStrickReate,
                              height: 18.sp,
                            ),
                            Text(
                              ' 12 d',
                              style: TextFontStyle
                                  .headline20w700cFEFFFFStyleRoboto
                                  .copyWith(
                                      color: Color(0xFFFF2828), fontSize: 18.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 60.w,
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(20.r),
                            value: .5,
                            minHeight: 3,
                            backgroundColor: Colors.black12,
                            color: Color(0xFFFF2828),
                          ),
                        ),
                      ],
                    ),
                  ),
                  UIHelper.horizontalSpaceSmall,
                  CircleAvatar(
                    radius: 16.sp,
                    backgroundColor: AppColors.cFFFFFF,
                    child: Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                  ),
                  UIHelper.horizontalSpaceSmall,
                  CircleAvatar(
                    radius: 16.sp,
                    backgroundColor: AppColors.cFFFFFF,
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/common_widgets/custom_network_image.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class HabbitTileWidget extends StatelessWidget {
  const HabbitTileWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
    required this.week,
    required this.streak,
    this.onDoneTap,
    this.onCancelTap,
    required this.status,
    required this.isStatus,
  });

  final VoidCallback? onTap;
  final String title;
  final String icon;
  final String week;
  final String streak;
  final VoidCallback? onDoneTap;
  final VoidCallback? onCancelTap;
  final String status;
  final bool isStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.allPrimaryColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CustomNetworkImageWidget(
                    urls: icon,
                    height: 30.h,
                    width: 30.h,
                  ),
                  UIHelper.horizontalSpace(12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextFontStyle.headline20w700cFEFFFFStyleRoboto
                              .copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          week.isNotEmpty ? week : "week - week",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextFontStyle.headline20w700cFEFFFFStyleRoboto
                              .copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.icons.fireStrickReate,
                              height: 18.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              streak,
                              style: TextFontStyle
                                  .headline20w700cFEFFFFStyleRoboto
                                  .copyWith(
                                color: const Color(0xFFFF2828),
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: 60.w,
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(20.r),
                            value: 0.5,
                            minHeight: 3.h,
                            backgroundColor: Colors.black12,
                            color: const Color(0xFFFF2828),
                          ),
                        ),
                      ],
                    ),
                  ),
                  UIHelper.horizontalSpaceSmall,
                  isStatus
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: onDoneTap,
                              child: CircleAvatar(
                                radius: 16.r,
                                backgroundColor: AppColors.cFFFFFF,
                                child: Icon(
                                  Icons.done,
                                  color: Colors.green,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall,
                            GestureDetector(
                              onTap: onCancelTap,
                              child: CircleAvatar(
                                radius: 16.r,
                                backgroundColor: AppColors.cFFFFFF,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Text(
                          status.toUpperCase(),
                          style: TextFontStyle.headline20w700cFEFFFFStyleRoboto
                              .copyWith(
                            fontSize: 16.sp,
                            color:
                                status == "cancel" ? Colors.red : Colors.green,
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

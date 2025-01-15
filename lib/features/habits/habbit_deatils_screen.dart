import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/habits/widgets/habbit_details_progress_tile_widget.dart';
import 'package:jackelieson/features/habits/widgets/habbit_streak_chart_widget.dart';
import 'package:jackelieson/features/habits/widgets/streak_calender_widget.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class HabbitDeatilsScreen extends StatefulWidget {
  const HabbitDeatilsScreen({super.key});

  @override
  State<HabbitDeatilsScreen> createState() => _HabbitDeatilsScreenState();
}

class _HabbitDeatilsScreenState extends State<HabbitDeatilsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18.sp),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  NavigationService.goBack;
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: AppColors.c686868),
                    Text('Back',
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          color: AppColors.c686868,
                          fontSize: 17.sp,
                        ))
                  ],
                ),
              ),
              UIHelper.verticalSpaceSmall,
              HabbitDetailsProgressTileWidget(),
              UIHelper.verticalSpaceMedium,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, -0.02),
                    end: Alignment(1, 0.02),
                    colors: [Color(0xFFFF2828), Color(0xFFFF5900)],
                  ),
                ),
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Streak ',
                                  textAlign: TextAlign.center,
                                  style: TextFontStyle
                                      .headline20w700cFEFFFFStyleRoboto
                                      .copyWith(fontSize: 20.sp)),
                              UIHelper.horizontalSpace(5.w),
                              SvgPicture.asset(
                                Assets.icons.trophyIcon,
                                height: 20.sp,
                              ),
                              UIHelper.horizontalSpace(5.w),
                              Text(' 79 days',
                                  textAlign: TextAlign.center,
                                  style: TextFontStyle
                                      .headline20w700cFEFFFFStyleRoboto
                                      .copyWith(fontSize: 20.sp)),
                            ],
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'You’re ahead of 45% of people.',
                                    style: TextFontStyle
                                        .headline16w600c686868StyleRoboto
                                        .copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.cFFFFFF,
                                    )),
                                TextSpan(
                                  text: ' Keep up the good work',
                                  style: TextFontStyle
                                      .headline16w600c686868StyleRoboto
                                      .copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.cFFFFFF,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8.w),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4.71),
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
                                height: 36.sp,
                              ),
                              Text(
                                ' 12 days',
                                style: TextFontStyle
                                    .headline20w700cFEFFFFStyleRoboto
                                    .copyWith(
                                        color: Color(0xFFFF2828),
                                        fontSize: 22.sp),
                              ),
                            ],
                          ),
                          UIHelper.verticalSpace(3),
                          SizedBox(
                            width: 110.w,
                            child: LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(20.r),
                              value: .5,
                              minHeight: 6,
                              backgroundColor: Colors.black12,
                              color: Color(0xFFFF2828),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceMedium,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: AppColors.c000000.withOpacity(.2),
                    ),
                  ],
                ),
                child: WorkoutCalendar(),
              ),
              UIHelper.verticalSpaceMedium,
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'History',
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                                fontSize: 16.sp, color: AppColors.c686868),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: AppColors.c686868,
                  )),
                ],
              ),
              UIHelper.verticalSpaceSmall,
              Container(
                  decoration: ShapeDecoration(
                    color: Color(0x51D9ECFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  height: 300,
                  child: CustomBarChart()),
            ],
          ),
        ),
      ),
    );
  }
}

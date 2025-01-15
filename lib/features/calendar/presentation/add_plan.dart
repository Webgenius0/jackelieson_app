import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/calendar/presentation/create_event/create_event.dart';
import 'package:jackelieson/features/habits/create_habbit/create_habbit.dart';
import 'package:jackelieson/features/tasks/presentation/create_task/create_task.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class AddPlanWidget extends StatefulWidget {
  const AddPlanWidget({super.key, required this.selectedIndex});

  final int selectedIndex;
  @override
  State<AddPlanWidget> createState() => _AddPlanWidgetState();
}

class _AddPlanWidgetState extends State<AddPlanWidget>
    with SingleTickerProviderStateMixin {
  List tabItem = [
    {
      "title": "Events",
      "icon": Assets.icons.eventCalenderIcon,
    },
    {
      "title": "Task",
      "icon": Assets.icons.tasks,
    },
    {
      "title": "Habit",
      "icon": Assets.icons.habitGroup,
    },
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabItem.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(24.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              Text(_buildTitle(widget.selectedIndex),
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
              ),
            ],
          ),
          UIHelper.verticalSpace(24.h),
          _buildEvent(widget.selectedIndex),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: List.generate(
          //     tabItem.length,
          //     (index) => GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           _tabController.index = index;
          //         });
          //       },
          //       child: Container(
          //         padding:
          //             EdgeInsets.symmetric(vertical: 8.sp, horizontal: 12.sp),
          //         decoration: BoxDecoration(
          //           color: _tabController.index == index
          //               ? AppColors.allPrimaryColor
          //               : AppColors.cFFFFFF,
          //           border: Border.all(color: AppColors.allPrimaryColor),
          //           borderRadius: BorderRadius.circular(8.r),
          //         ),
          //         child: Row(
          //           children: [
          //             SvgPicture.asset(
          //               tabItem[index]["icon"],
          //               color: _tabController.index == index
          //                   ? AppColors.cFFFFFF
          //                   : AppColors.allPrimaryColor,
          //             ),
          //             UIHelper.horizontalSpaceSmall,
          //             Text(
          //               tabItem[index]["title"],
          //               style: TextStyle(
          //                 color: _tabController.index == index
          //                     ? AppColors.cFFFFFF
          //                     : AppColors.allPrimaryColor,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // UIHelper.verticalSpace(20.h),
          // Expanded(
          //     child: IndexedStack(
          //   index: _tabController.index,
          //   children: [
          //     CreateEventWidget(),
          //     CreateEventWidget(),
          //     CreateEventWidget(),
          //   ],
          // )),
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.icons.habitGroup,
                  color: AppColors.c1497FF,
                  height: 22.sp,
                ),
                UIHelper.horizontalSpaceSmall,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Habits: ",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 15.sp,
                          color: AppColors.c1497FF,
                        ),
                      ),
                      TextSpan(
                        text: "Tasks that repeat over time",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 13.sp,
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
                  height: 22.sp,
                ),
                UIHelper.horizontalSpaceSmall,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Tasks: ",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 15.sp,
                          color: AppColors.c1497FF,
                        ),
                      ),
                      TextSpan(
                        text: "Actions you need to complete",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 13.sp,
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
                  Assets.icons.calender,
                  color: AppColors.c1497FF,
                  height: 22.sp,
                ),
                UIHelper.horizontalSpaceSmall,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Event: ",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 15.sp,
                          color: AppColors.c1497FF,
                        ),
                      ),
                      TextSpan(
                        text: "A scheduled activity or occasion",
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 13.sp,
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

  _buildEvent(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return CreateEventWidget();
      case 1:
        return CreateHabbitWidget();
      case 2:
        return CreateTaskWidget();
      default:
        return SizedBox.shrink();
    }
  }

  _buildTitle(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return 'Add Event';
      case 1:
        return 'Add Habbit';
      case 2:
        return "Add Task";
      default:
        return "Title";
    }
  }
}

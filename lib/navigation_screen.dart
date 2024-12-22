import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/calendar/presentation/calendar_screen.dart';
import 'package:jackelieson/features/settings/presentation/setting/settings_screen.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;

  // List<StatefulWidget>
  List bodyItemList = [
    CalendarScreen(),
    Center(
      child: Text("Home"),
    ),
    Center(
      child: Text("Home"),
    ),
    SettingsScreen(),
  ];

  List<Map<String, dynamic>> itemList = [
    {"icon": Assets.icons.calender, "label": "Calendar"},
    {"icon": Assets.icons.habits, "label": "Habit"},
    {"icon": Assets.icons.tasks, "label": "Tasks"},
    {
      "icon": Assets.icons.settings,
      "label": "Settings"
    }, // Corrected key reference
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyItemList[selectedIndex],
      backgroundColor: AppColors.cFFFFFF,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        height: 80.h,
        width: double.infinity,
        color: AppColors.cF4F4F4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            itemList.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: selectedIndex == index
                            ? AppColors.c0070F0
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                      ),
                      child: SvgPicture.asset(
                        itemList[index]["icon"] ?? Assets.icons.calender,
                        height: 21.h,
                        width: 21.h,
                        fit: BoxFit.cover,
                        color: selectedIndex == index
                            ? AppColors.cFFFFFF
                            : AppColors.c686868,
                      ),
                    ),
                    UIHelper.verticalSpace(4.h),
                    Text(
                      itemList[index]["label"],
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 12.sp,
                        color: selectedIndex == index
                            ? AppColors.c0070F0
                            : AppColors.c686868,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

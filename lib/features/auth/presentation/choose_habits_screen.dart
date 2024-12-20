// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/common_widgets/app_custom_buttom.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/auth/model/choose_model.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class ChooseHabitsScreen extends StatefulWidget {
  const ChooseHabitsScreen({super.key});

  @override
  State<ChooseHabitsScreen> createState() => _ChooseHabitsScreenState();
}

class _ChooseHabitsScreenState extends State<ChooseHabitsScreen> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: FloatingActionButton(
          backgroundColor: AppColors.c1497FF,
          elevation: 0,
          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 45.sp,
            color: AppColors.cFFFFFF,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 40.h,
          left: 20.w,
          right: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose habits',
                  style:
                      TextFontStyle.headline18w600cFEFFFFStyleRoboto.copyWith(
                    fontSize: 24.sp,
                    color: AppColors.c222222,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Skip',
                      style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 16.sp,
                        color: AppColors.c000000,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ],
            ),
            UIHelper.verticalSpace(8.h),
            Text(
              'Choose your Daily Habits, you can pick more\nthan once.',
              style: TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                fontSize: 14.sp,
                color: AppColors.c555555,
              ),
            ),
            UIHelper.verticalSpace(20.h),
            Expanded(
              child: GridView.builder(
                itemCount: chooseHabitsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ChooseHabitWidgets(
                    borderColro: selectedIndex == index
                        ? AppColors.allPrimaryColor
                        : Colors.grey.withOpacity(
                            0.3,
                          ),
                    onSelectedColor: selectedIndex == index
                        ? AppColors.allPrimaryColor
                        : Colors.white,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    icon: chooseHabitsList[index].icon,
                    title: chooseHabitsList[index].title,
                  );
                },
              ),
            ),
            AppCustomButtom(
              btnName: 'Next',
              borderRadius: 8,
              onTap: () {},
              fontWeight: FontWeight.w600,
            ),
            UIHelper.verticalSpace(10.h),
          ],
        ),
      ),
    );
  }
}

class ChooseHabitWidgets extends StatelessWidget {
  String icon;
  String title;
  VoidCallback? onTap;
  Color? borderColro;
  Color? onSelectedColor;
  ChooseHabitWidgets({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.borderColro,
    this.onSelectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 160.w,
        // height: 160.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2.w,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: borderColro ??
                  Colors.grey.withOpacity(
                    0.3,
                  ),
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(icon),
                UIHelper.verticalSpace(10.h),
                Text(
                  title,
                  style:
                      TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.c555555,
                  ),
                )
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 16,
                height: 16,
                decoration: ShapeDecoration(
                  color: onSelectedColor,
                  shape: OvalBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

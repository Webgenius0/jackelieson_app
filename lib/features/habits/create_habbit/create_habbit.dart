import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jackelieson/common_widgets/custom_text_field_app_plan.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class CreateHabbitWidget extends StatefulWidget {
  const CreateHabbitWidget({super.key});

  @override
  State<CreateHabbitWidget> createState() => _CreateHabbitWidgetState();
}

class _CreateHabbitWidgetState extends State<CreateHabbitWidget> {
  final TextEditingController _titleController = TextEditingController();
  List listOfWeekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  Set selectedDay = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _titleController,
                  hintText: "Habbit title ",
                ),
              ),
              UIHelper.horizontalSpaceMedium,
              SvgPicture.asset(
                Assets.icons.habbitIcon,
                height: 52.h,
              )
            ],
          ),
          UIHelper.verticalSpace(20.h),
          Align(
            alignment: Alignment.center,
            child: Text('Pick days for Habit',
                style: TextFontStyle.headline20w700cFEFFFFStyleRoboto
                    .copyWith(fontSize: 17.sp, color: AppColors.c686868)),
          ),
          UIHelper.verticalSpace(20.h),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.cF7F7F7,
                borderRadius: BorderRadius.circular(0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  listOfWeekDays.length,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        // selectedDay = listOfWeekDays[index];

                        if (selectedDay.contains(listOfWeekDays[index])) {
                          selectedDay.remove(listOfWeekDays[index]);
                        } else {
                          selectedDay.add(listOfWeekDays[index]);
                        }
                      });
                    },
                    child: Container(
                      color: selectedDay.contains(listOfWeekDays[index])
                          ? AppColors.allPrimaryColor
                          : null,
                      padding: EdgeInsets.all(8.sp),
                      child: Text(
                        listOfWeekDays[index],
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(
                                fontSize: 14.sp,
                                color:
                                    selectedDay.contains(listOfWeekDays[index])
                                        ? AppColors.cFFFFFF
                                        : AppColors.c686868),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          UIHelper.verticalSpace(20.h),
          Row(
            children: [
              UIHelper.horizontalSpace(8.w),
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(100)),
              ),
              UIHelper.horizontalSpace(8.w),
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100)),
              ),
              UIHelper.horizontalSpace(8.w),
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(100)),
              ),
              UIHelper.horizontalSpace(8.w),
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(
                  Icons.add,
                  color: AppColors.cFFFFFF,
                ),
              )
            ],
          ),
          UIHelper.verticalSpace(24.h),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 52.h,
              width: 131.w,
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                  color: AppColors.c1497FF,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "Save",
                style: TextFontStyle.customizePoppinsFont.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cFFFFFF),
              )),
            ),
          )
        ],
      ),
    );
  }
}

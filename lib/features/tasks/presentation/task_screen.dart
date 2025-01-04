import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<String> items = [
    'January',
    'February',
    'March',
    'April',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.allPrimaryColor,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          size: 40.sp,
          color: AppColors.cFFFFFF,
        ),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                height: 55.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.cF7F7F7,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Task list',
                      style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.c686868,
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Select Month',
                            style: TextFontStyle
                                .headline14w400cFEFFFFStyleRoboto
                                .copyWith(color: AppColors.c686868),
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextFontStyle
                                          .headline14w400cFEFFFFStyleRoboto
                                          .copyWith(color: AppColors.c686868),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: 140,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(16.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 94.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                color: AppColors.allPrimaryColor,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: AppColors.cFFFFFF,
                                  ),
                                  UIHelper.horizontalSpace(4.w),
                                  Text(
                                    'Today',
                                    style: TextFontStyle
                                        .headline12w300cFEFFFFStyleRoboto
                                        .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            UIHelper.horizontalSpace(8.w),
                            Expanded(
                              child: Container(
                                height: 0.5.h,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: AppColors.c000000,
                                ),
                              ),
                            )
                          ],
                        ),
                        UIHelper.verticalSpace(16.h),
                        SizedBox(
                          height: 250.h,
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  width: double.maxFinite,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    color: index.isOdd
                                        ? AppColors.allPrimaryColor
                                        : AppColors.cE90909,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 35.h,
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                          color: AppColors.cFFFFFF,
                                          borderRadius:
                                              BorderRadius.circular(16.w),
                                        ),
                                        child: Text(
                                          '11:30 am',
                                          style: TextFontStyle
                                              .headline14w400c686868StyleRoboto
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.c000000,
                                          ),
                                        ),
                                      ),
                                      UIHelper.horizontalSpace(12.w),
                                      Text(
                                        'Take out the trash',
                                        style: TextFontStyle
                                            .headline20w700cFEFFFFStyleRoboto
                                            .copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jackelieson/common_widgets/exit_button.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/calendar/presentation/add_plan.dart';
import 'package:jackelieson/features/tasks/model/delete_task_response_model.dart';
import 'package:jackelieson/features/tasks/model/get_all_task_response_model.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/loadding_indicator_circle_widget.dart';
import 'package:jackelieson/helper/lodding_helper.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/api_acess.dart';
import 'package:popup_menu_plus/popup_menu_plus.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int month = DateTime.now().month, year = DateTime.now().year;
  String convertTimeTo12Hour(String time24Hour) =>
      DateFormat("hh:mm a").format(DateFormat("HH:mm").parse(time24Hour));

  @override
  void initState() {
    super.initState();

    allTaskRxObj.getAllTask(month: DateFormat.MMMM().format(DateTime.now()));
  }

  final List<String> monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final btn4 = GlobalKey();

  String? selectedValue;

  onItemTap(
    PopUpMenuItemProvider item,
    dynamic id,
    dynamic date,
    dynamic time,
    dynamic title,
    dynamic color,
  ) async {
    if (item.menuTitle == 'Edit Task') {
      showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(16.sp),
            child: Dialog(
              backgroundColor: AppColors.cFFFFFF,
              insetPadding: EdgeInsets.zero,
              alignment: Alignment.bottomCenter,
              child: AddPlanWidget(
                isEditTask: true,
                selectedIndex: 2,
                editTaskDate: date,
                editTaskTime: time,
                editTaskTitle: title,
                editTaskId: id,
                editTaskColor: color,
              ),
            ),
          );
        },
      );
    } else {
      showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text(
                  "Do you want to delete the Task?",
                  textAlign: TextAlign.center,
                  // style: TextFontStyle.headline14StyleMontserrat,
                ),
                actions: <Widget>[
                  ExitButton(
                      name: "No",
                      onCallBack: () {
                        Navigator.of(context).pop(false);
                      },
                      height: 30.sp,
                      minWidth: .3.sw,
                      borderRadius: 30.r,
                      color: AppColors.allPrimaryColor,
                      textStyle: GoogleFonts.montserrat(
                          fontSize: 17.sp,
                          color: AppColors.cFFFFFF,
                          fontWeight: FontWeight.w700),
                      context: context),
                  ExitButton(
                      name: "Yes",
                      onCallBack: () async {
                        await deleteTaskRxObj
                            .deleteTask(id: id)
                            .waitingForFuture()
                            .then((res) async {
                          DeleteTaskResponseModel data = res;
                          if (data.success == true) {
                            log("message 78963214");

                            await allTaskRxObj
                                .getAllTask(month: monthList[month - 1])
                                .waitingForFuture();
                            NavigationService.goBack;
                          }
                        });
                      },
                      height: 30.sp,
                      minWidth: .3.sw,
                      borderRadius: 30.r,
                      color: AppColors.allPrimaryColor,
                      textStyle: GoogleFonts.montserrat(
                          fontSize: 17.sp,
                          color: AppColors.cFFFFFF,
                          fontWeight: FontWeight.w700),
                      context: context),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    log('Initial month: $month, year: $year');
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    GestureDetector(
                      onTap: () async {
                        showMonthPicker(
                          context,
                          onSelected: (month, year) async {
                            if (kDebugMode) {
                              log('Selected month: $month, year: $year');
                            }

                            await allTaskRxObj
                                .getAllTask(month: monthList[month - 1])
                                .waitingForFuture();
                            setState(() {
                              this.month = month;
                              this.year = year;
                            });
                          },
                          initialSelectedMonth: month,
                          initialSelectedYear: year,
                          firstEnabledMonth: 3,
                          lastEnabledMonth: 10,
                          firstYear: 2000,
                          lastYear: 2050,
                          selectButtonText: 'OK',
                          cancelButtonText: 'Cancel',
                          highlightColor: AppColors.allPrimaryColor,
                          textColor: Colors.black,
                          contentBackgroundColor: Colors.white,
                          dialogBackgroundColor: Colors.grey[200],
                        );
                      },
                      child: Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "${monthList[month - 1]}, $year",
                              style: TextFontStyle
                                  .headline14w400cFEFFFFStyleRoboto
                                  .copyWith(
                                color: AppColors.c686868,
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall,
                            Icon(
                              Icons.calendar_month,
                              color: AppColors.c686868,
                              size: 22.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(16.h),
              StreamBuilder<AllTaskResponseModel>(
                stream: allTaskRxObj.dataFetcher,
                builder: (context, snapshot) {
                  String convertTime(String time) => DateFormat("HH:mm")
                      .format(DateFormat("HH:mm:ss").parse(time));

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('An error occurred: ${snapshot.error}',
                          style: const TextStyle(color: Colors.red)),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: loadingIndicatorCircle(context: context));
                  }

                  if (snapshot.hasData) {
                    final responseData = snapshot.data?.data;

                    if (responseData != null && responseData.isNotEmpty) {
                      final keys = responseData.keys.toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: keys.length,
                        itemBuilder: (context, index) {
                          final items = responseData[keys[index]];

                          final List<GlobalKey> popupKeys = List.generate(
                            items?.length ?? 0,
                            (_) => GlobalKey(),
                          );

                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.allPrimaryColor,
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: AppColors.cFFFFFF,
                                        ),
                                        UIHelper.horizontalSpace(4.w),
                                        Text(
                                          DateTime.parse(keys[index])
                                                      .toLocal()
                                                      .toIso8601String()
                                                      .substring(0, 10) ==
                                                  DateTime.now()
                                                      .toIso8601String()
                                                      .substring(0, 10)
                                              ? "Today"
                                              : keys[index],
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
                                    child: Divider(
                                      color: AppColors.c000000.withOpacity(.8),
                                    ),
                                  )
                                ],
                              ),
                              UIHelper.verticalSpace(16.h),
                              ListView.builder(
                                itemCount: items?.length ?? 0,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, subIndex) {
                                  final itemData = items?[subIndex];
                                  final GlobalKey menuKey = popupKeys[subIndex];
                                  String convertTimeTo12Hour(
                                          String time24Hour) =>
                                      DateFormat("hh:mm a").format(
                                          DateFormat("HH:mm")
                                              .parse(time24Hour));

                                  return GestureDetector(
                                    onTap: () {
                                      PopupMenu menu = PopupMenu(
                                        context: context,
                                        config: MenuConfig.forList(
                                          border: BorderConfig(
                                              width: 2, color: Colors.black),
                                        ),
                                        items: [
                                          PopUpMenuItem.forList(
                                            title: 'Delete Task',
                                            image: const Icon(Icons.delete,
                                                color: Color(0xFF181818),
                                                size: 20),
                                          ),
                                          PopUpMenuItem.forList(
                                            title: 'Edit Task',
                                            image: const Icon(
                                                Icons.edit_note_rounded,
                                                color: Color(0xFF181818),
                                                size: 20),
                                          ),
                                        ],
                                        onClickMenu: (item) {
                                          log(item.menuTitle);
                                          onItemTap(
                                            item,
                                            itemData?.id,
                                            itemData?.date.toString(),
                                            convertTimeTo12Hour(
                                                itemData?.startTime ?? ""),
                                            itemData?.title,
                                            itemData?.color,
                                          );
                                        },
                                      );

                                      if (menuKey.currentContext != null) {
                                        menu.show(widgetKey: menuKey);
                                      } else {
                                        debugPrint(
                                            'Key does not have a valid BuildContext.');
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 8.h),
                                      child: Container(
                                        key: menuKey,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        width: double.maxFinite,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              "0xFF${itemData?.color?.substring(2)}")),
                                          borderRadius:
                                              BorderRadius.circular(16.r),
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
                                                convertTimeTo12Hour(
                                                    itemData?.startTime ?? ""),
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
                                              itemData?.title ??
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
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'No Task Available',
                          style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                              .copyWith(
                            fontSize: 24.sp,
                            color: AppColors.c222222,
                          ),
                        ),
                      );
                    }
                  } else {
                    return Center(
                      child: Text(
                        'No Habit Available',
                        style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 24.sp,
                          color: AppColors.c222222,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

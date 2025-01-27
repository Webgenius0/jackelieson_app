import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jackelieson/common_widgets/custom_network_image.dart';
import 'package:jackelieson/common_widgets/custom_text_field_app_plan.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/auth/model/all_habbit_response_model.dart';
import 'package:jackelieson/features/auth/presentation/others/choose_habits_screen.dart';
import 'package:jackelieson/features/habits/model/create_habbit_response_model.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/loadding_indicator_circle_widget.dart';
import 'package:jackelieson/helper/lodding_helper.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/api_acess.dart';

class CreateHabbitWidget extends StatefulWidget {
  const CreateHabbitWidget({super.key});

  @override
  State<CreateHabbitWidget> createState() => _CreateHabbitWidgetState();
}

class _CreateHabbitWidgetState extends State<CreateHabbitWidget> {
  String? iconUrl;
  List habbitID = [];
  Color pickerColor = Color.fromARGB(255, 0, 0, 0);
  Color currentColor = Color(0xff443a49);
  bool isEveryday = true;
  bool isReminer = true;

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
  void initState() {
    allHabbitRxObj.getAllHabbit();
    super.initState();
  }

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
              GestureDetector(
                onTap: () async {
                  final data = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          color: AppColors.cFFFFFF,
                          child: StreamBuilder<AllHabbitResponseModel>(
                            stream: allHabbitRxObj.dataFetcher,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    'An error occurred: ${snapshot.error}',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                );
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child:
                                      loadingIndicatorCircle(context: context),
                                );
                              }

                              if (snapshot.hasData) {
                                if (snapshot.data!.data!.isNotEmpty) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10.h),
                                    child: GridView.builder(
                                      itemCount: snapshot.data!.data!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final items =
                                            snapshot.data!.data?[index];
                                        return ChooseHabitWidgets(
                                          onTap: () {
                                            Navigator.pop(context, {
                                              'habbit_id': items?.id,
                                              'icon': items?.imageUrl,
                                              'title': items?.name,
                                            });
                                          },
                                          icon: items?.imageUrl ?? "",
                                          title: items?.name ?? "",
                                        );
                                      },
                                    ),
                                  );
                                }

                                return Center(
                                  child: Text(
                                    'No Habbit Available1123',
                                    style: TextFontStyle
                                        .headline18w600cFEFFFFStyleRoboto
                                        .copyWith(
                                      fontSize: 24.sp,
                                      color: AppColors.c222222,
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    'No Habbit Available456',
                                    style: TextFontStyle
                                        .headline18w600cFEFFFFStyleRoboto
                                        .copyWith(
                                      fontSize: 24.sp,
                                      color: AppColors.c222222,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  );

                  setState(() {
                    iconUrl = data["icon"];
                    _titleController.text = data["title"];
                    habbitID.add(data["habbit_id"]);
                  });
                  log("${data["title"]}");
                },
                child: iconUrl == null
                    ? SvgPicture.asset(
                        Assets.icons.habbitIcon,
                        height: 52.h,
                      )
                    : CustomNetworkImageWidget(
                        urls: iconUrl!,
                        height: 50.h,
                        width: 50.h,
                      ),
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
          UIHelper.verticalSpace(5.h),
          InkWell(
            onTap: () {
              setState(() {
                isEveryday = !isEveryday;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Checkbox(
                    activeColor: AppColors.allPrimaryColor,
                    checkColor: AppColors.cFFFFFF,
                    side: BorderSide(color: AppColors.c686868),
                    value: isEveryday,
                    onChanged: (value) {
                      setState(() {
                        isEveryday = !isEveryday;
                      });
                      if (value == true) {
                        selectedDay.clear();
                      }
                    },
                  ),
                ),
                Text(
                  "Is Everyday",
                  style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                      .copyWith(color: AppColors.c686868),
                )
              ],
            ),
          ),
          UIHelper.verticalSpace(5.h),
          AbsorbPointer(
            absorbing: isEveryday,
            child: Align(
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
                                  color: selectedDay
                                          .contains(listOfWeekDays[index])
                                      ? AppColors.cFFFFFF
                                      : AppColors.c686868),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // UIHelper.verticalSpace(20.h),
          // Row(
          //   children: [
          //     UIHelper.horizontalSpace(8.w),
          //     Container(
          //       width: 36.w,
          //       height: 36.h,
          //       decoration: BoxDecoration(
          //           color: pickerColor,
          //           borderRadius: BorderRadius.circular(100)),
          //     ),
          //     UIHelper.horizontalSpace(8.w),
          //     GestureDetector(
          //       onTap: () {
          //         changeColor();
          //       },
          //       child: Container(
          //         width: 36.w,
          //         height: 36.h,
          //         decoration: BoxDecoration(
          //             color: Colors.blue,
          //             borderRadius: BorderRadius.circular(100)),
          //         child: Icon(
          //           Icons.add,
          //           color: AppColors.cFFFFFF,
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          UIHelper.verticalSpace(24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reminder",
                style: TextFontStyle.headline16w600c686868StyleRoboto,
              ),
              CupertinoSwitch(
                activeColor: AppColors.allPrimaryColor,
                value: isReminer,
                onChanged: (value) {
                  setState(() {
                    isReminer = value;
                  });
                },
              ),
            ],
          ),
          UIHelper.verticalSpace(24.h),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () async {
                if (_titleController.text.isNotEmpty) {
                  await createHabbitRxObj
                      .createHabbit(
                        habbitID: habbitID,
                        habbitName: _titleController.text.trim(),
                        isReminder: isReminer,
                        days: isEveryday,
                      )
                      .waitingForFuture()
                      .then((res) async {
                    CreateHabbitResponseModel data = res;

                    if (data.code == 201 || data.code == 200) {
                      await getHabbitRxObj
                          .getAllTask(day: "wed")
                          .waitingForFuture();
                      NavigationService.goBack;
                    } else {
                      NavigationService.goBack;
                    }
                  });
                } else {
                  ToastUtil.showShortToast("Title and Icon are Required*");
                }
              },
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
            ),
          )
        ],
      ),
    );
  }

  changeColor() {
    // create some values

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: currentColor,
            onColorChanged: (Color color) {
              log("Color : ${color.toHexString()}");

              setState(() {
                // Parse the color string correctly
                pickerColor =
                    Color(int.parse("0xFF${color.toHexString().substring(2)}"));
                currentColor = pickerColor;
              });

              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}

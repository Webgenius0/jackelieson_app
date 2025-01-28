import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:jackelieson/common_widgets/custom_text_field_app_plan.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/calendar/model/create_event_response_model.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/lodding_helper.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/api_acess.dart';
import 'package:jackelieson/provider/calender_update_provider.dart';
import 'package:provider/provider.dart';

class CreateEventWidget extends StatefulWidget {
  const CreateEventWidget({super.key});

  @override
  State<CreateEventWidget> createState() => _CreateEventWidgetState();
}

class _CreateEventWidgetState extends State<CreateEventWidget> {
  Color pickerColor = Color.fromARGB(255, 0, 0, 0);
  Color currentColor = Color(0xff443a49);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2026),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-DD').format(pickedDate);
      });
    }
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(
        () {
          controller.text =
              "${pickedTime.hourOfPeriod == 0 ? 12 : pickedTime.hourOfPeriod}:${pickedTime.minute.toString().padLeft(2, '0')} ${pickedTime.period == DayPeriod.am ? 'AM' : 'PM'}";
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();

    // if (widget.isEditTask == true) {
    //   _timeController.text = widget.editTaskTime;
    //   _titleController.text = widget.editTaskTitle;
    //   _dateController.text = widget.editTaskDate;
    //   pickerColor =
    //       Color(int.parse("0xFF${widget.editTaskColor.substring(2)}"));
    // } else {
    _dateController.text = DateFormat("yyyy-MM-DD").format(DateTime.now());
    _timeController.text = DateFormat("hh:mm a").format(DateTime.now());
    _endTimeController.text =
        DateFormat("hh:mm a").format(DateTime.now().add(Duration(hours: 1)));
    // }
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
                  hintText: "Event title ",
                ),
              ),
              UIHelper.horizontalSpaceMedium,
              Image.asset(
                Assets.images.aiButtonEventCreate.path,
                height: 52.h,
              )
            ],
          ),
          UIHelper.verticalSpace(20.h),
          TextFormField(
            controller: _dateController,
            readOnly: true, // Prevent manual editing
            decoration: InputDecoration(
              hintText: "Sunday, November 14",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onTap: () => _selectDate(context),
          ),
          UIHelper.verticalSpace(
            20,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectTime(context, _timeController),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _timeController,
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.watch_later_outlined),
                        hintText: "10:20 am",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onTap: () => _selectTime(context, _timeController),
                    ),
                  ),
                ),
              ),
              UIHelper.horizontalSpaceSmall,
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectTime(context, _endTimeController),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _endTimeController,
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.watch_later_outlined),
                        hintText: "10:20 am",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _dateController.text =
                                pickedDate.toLocal().toString().split(' ')[0];
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(20.h),
          Row(
            children: [
              UIHelper.horizontalSpace(8.w),
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                    color: pickerColor,
                    borderRadius: BorderRadius.circular(100)),
              ),
              UIHelper.horizontalSpace(8.w),
              GestureDetector(
                onTap: () {
                  changeColor();
                },
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.add,
                    color: AppColors.cFFFFFF,
                  ),
                ),
              )
            ],
          ),
          UIHelper.verticalSpace(24.h),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                createEventRxObj
                    .createHabbit(
                      title: _titleController.text.trim(),
                      date: _dateController.text.trim(),
                      startTime: DateFormat("HH:mm").format(
                          DateFormat("hh:mm a")
                              .parse(_timeController.text.trim())),
                      endTime: DateFormat("HH:mm").format(DateFormat("hh:mm a")
                          .parse(_endTimeController.text.trim())),
                      color: pickerColor.toHexString(),
                    )
                    .waitingForFuture()
                    .then((res) async {
                  CreateEventResponseModel data = res;

                  if (data.success == true) {
                    await getEventRxObj
                        .getEvent()
                        .waitingForFuture()
                        .then((res) {
                      var provider = Provider.of<CalenderUpdateProvider>(
                          context,
                          listen: false);

                      provider.getResponse(res: res);

                      log("message852");
                      NavigationService.goBack;
                    });
                  } else {
                    NavigationService.goBack;
                  }
                });
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

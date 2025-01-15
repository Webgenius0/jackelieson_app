import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/common_widgets/custom_text_field_app_plan.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class CreateTaskWidget extends StatefulWidget {
  const CreateTaskWidget({super.key});

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     Expanded(
          //       child: ,
          //     ),
          //     UIHelper.horizontalSpaceMedium,
          //     Image.asset(
          //       Assets.images.aiButtonEventCreate.path,
          //       height: 52.h,
          //     )
          //   ],
          // ),
          CustomTextField(
            controller: _titleController,
            hintText: "Task title ",
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
            onTap: () async {
              // Show date picker when user taps on the field
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                setState(() {
                  _timeController.text = pickedDate
                      .toLocal()
                      .toString()
                      .split(' ')[0]; // Format the date to YYYY-MM-DD
                });
              }
            },
          ),
          UIHelper.verticalSpace(
            20,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _timeController,
                  readOnly: true, // Prevent manual editing
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.watch_later_outlined),
                    hintText: "9:30 am",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onTap: () async {
                    // Show date picker when user taps on the field
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _dateController.text = pickedDate
                            .toLocal()
                            .toString()
                            .split(' ')[0]; // Format the date to YYYY-MM-DD
                      });
                    }
                  },
                ),
              ),
              UIHelper.horizontalSpaceSmall,
              Expanded(
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

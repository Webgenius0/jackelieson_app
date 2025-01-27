import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:table_calendar/table_calendar.dart';

class WorkoutCalendar extends StatefulWidget {
  const WorkoutCalendar({super.key, required this.dateList});

  final List<DateTime> dateList;

  @override
  State<WorkoutCalendar> createState() => _WorkoutCalendarState();
}

class _WorkoutCalendarState extends State<WorkoutCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool _isWorkoutDay(DateTime day) {
    return widget.dateList.any((workoutDay) =>
        workoutDay.year == day.year &&
        workoutDay.month == day.month &&
        workoutDay.day == day.day);
  }
  

  @override
  Widget build(BuildContext context) {
    log("List of Dates : ${widget.dateList.toString()}");
    return AbsorbPointer(
      child: TableCalendar(
        headerVisible: false,
        daysOfWeekHeight: 49.h,
        daysOfWeekStyle: DaysOfWeekStyle(
          decoration: BoxDecoration(color: AppColors.cF7F7F7),
          weekdayStyle: TextFontStyle.headline16w500cFEFFFFStyleRoboto
              .copyWith(fontSize: 14.sp, color: AppColors.c686868),
          weekendStyle: TextFontStyle.headline16w500cFEFFFFStyleRoboto
              .copyWith(fontSize: 14.sp, color: AppColors.c686868),
        ),
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update focused day
          });
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            if (_isWorkoutDay(day)) {
              return Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, -0.02),
                    end: Alignment(1, 0.02),
                    colors: [Color(0xFFFF2828), Color(0xFFFF5900)],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
            return null;
          },
          todayBuilder: (context, day, focusedDay) {
            return Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: AppColors.allPrimaryColor.withOpacity(.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: AppColors.allPrimaryColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

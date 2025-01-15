import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/calendar/presentation/calendar_screen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget(
      {super.key,
      required this.controller,
      required this.calenderview,
      this.getDataSource,
      required this.is3Day});

  final CalendarController controller;
  final dynamic getDataSource;
  final CalendarView calenderview;
  final bool is3Day;

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      // onSelectionChanged: (calendarSelectionDetails) {},

      initialSelectedDate: DateTime.now(),
      allowViewNavigation: false,
      viewNavigationMode: ViewNavigationMode.none,
      dataSource: MeetingDataSource(getDataSource), // ===== Data Source =====
      showCurrentTimeIndicator: false, // ===== Time Indicator =====
      todayHighlightColor:
          AppColors.allPrimaryColor, // ===== header Highlighter color =====

      //
      timeSlotViewSettings: TimeSlotViewSettings(
        numberOfDaysInView: is3Day ? 3 : -1,
        timeTextStyle: TextFontStyle.headline14w400cFEFFFFStyleRoboto
            .copyWith(fontSize: 14.sp, color: AppColors.c686868),
        timeInterval: Duration(hours: 1),
        timeIntervalHeight: 60,
        timeRulerSize: 70,
        timeIntervalWidth: 0,
      ),
      //

      selectionDecoration: BoxDecoration(
        border: Border.all(
          color: calenderview == CalendarView.month
              ? AppColors.allPrimaryColor
              : Colors.transparent,
        ),
      ), // selected date cell Decoration

      showDatePickerButton: false,
      scheduleViewSettings: ScheduleViewSettings(
        hideEmptyScheduleWeek: true,
        dayHeaderSettings: DayHeaderSettings(
          dayFormat: 'EEEE',
          width: 70,
          dayTextStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w300,
            color: Colors.red,
          ),
          dateTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.red,
          ),
        ),
      ),

      view: calenderview,
      controller: controller,

      monthViewSettings: MonthViewSettings(
        showAgenda: true,
        appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
      ),

      headerHeight: 0,
      viewHeaderHeight: 60.h,
      firstDayOfWeek: 1,
      viewHeaderStyle: ViewHeaderStyle(
        dateTextStyle: TextFontStyle.headline14w400cFEFFFFStyleRoboto
            .copyWith(fontSize: 14.sp, color: AppColors.c686868),
        dayTextStyle: TextStyle(color: Colors.red, fontSize: 16),
        backgroundColor: AppColors.cF7F7F7,
      ),

      appointmentBuilder: (context, calendarAppointmentDetails) {
        final Meeting appointment =
            calendarAppointmentDetails.appointments.first;

        return Container(
          padding: EdgeInsets.all(5.sp),
          margin: EdgeInsets.only(left: 12.sp),
          decoration: BoxDecoration(
            color: appointment.background,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              appointment.eventName,
              style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                  .copyWith(fontSize: 16.sp),
            ),
          ),
        );
      },
    );
  }
}

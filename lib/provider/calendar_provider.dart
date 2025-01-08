import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:jackelieson/constant/app_constants.dart';
import 'package:jackelieson/helper/di.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarProvider extends ChangeNotifier {
  CalendarView? calenderview;
  SfCalendar? temp;

  toggleMenu(result) {
    if (result != null) {
      switch (result) {
        case 'Daily View':
          calenderview = CalendarView.day;

          break;
        case 'Schedule View':
          calenderview = CalendarView.schedule;

          break;
        case '3 Day View':
          calenderview = CalendarView.timelineDay;

          // is3DayView = true;

          break;
        case 'Weekly View':
          calenderview = CalendarView.week;

          break;
        case 'Monthly View':
          calenderview = CalendarView.month;

          break;
      }
      appData.write(kKeyCalenderView, calenderview.toString());
    }
    notifyListeners();
  }

  buildCalenderViews() {
    log(calenderview.toString());
    switch (calenderview) {
      case CalendarView.day:
        temp = SfCalendar(view: CalendarView.day);
      case CalendarView.schedule:
        temp = SfCalendar(view: CalendarView.schedule);
      case CalendarView.timelineDay:
        temp = SfCalendar(view: CalendarView.timelineDay);
      case CalendarView.week:
        temp = SfCalendar(view: CalendarView.week);
      case CalendarView.month:
        temp = SfCalendar(view: CalendarView.month);
      default:
        temp = SfCalendar(view: CalendarView.month);
    }
    notifyListeners();
    return temp;
  }
}

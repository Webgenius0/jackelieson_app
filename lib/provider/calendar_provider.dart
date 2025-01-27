import 'dart:developer';

import 'package:flutter/cupertino.dart';

class CalendarProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  setInitialTime(initialDate) {
    selectedDate = initialDate;
    log(initialDate.toString());
  }

  // DateTime get selectedDate => selectedDate;

  int get daysInMonth {
    return DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
  }

  int get daysInText {
    return DateTime(selectedDate.year, selectedDate.month + 1, 0).weekday;
  }

  int get selectedIndex {
    return selectedDate.day - 1;
  }

  void selectDate(int day) {
    selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
    log(selectedDate.day.toString());
    notifyListeners();
  }


  String getWeekdayName(int day) {
    DateTime date = DateTime(selectedDate.year, selectedDate.month, day);
    int weekdat = date.weekday;

    switch (weekdat) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "$weekdat";
    }
  }
}

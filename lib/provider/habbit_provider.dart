import 'dart:developer';

import 'package:flutter/foundation.dart';

class EventController extends ChangeNotifier {
  final List<CalendarEventData> _events = [];

  List<CalendarEventData> get events => _events;

  void add(CalendarEventData event) {
    _events.add(event);
  }

  void remove(CalendarEventData event) {
    _events.remove(event);
    notifyListeners();
  }
}

class CalendarEventData {
  final DateTime date;
  final String title;
  final String event;
  final String description;
  final DateTime startTime;
  final DateTime endTime;

  CalendarEventData({
    required this.date,
    required this.title,
    required this.event,
    required this.description,
    required this.startTime,
    required this.endTime,
  });
}

class Calendar extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  int get daysInMonth {
    return DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
  }

  int get daysInText {
    return DateTime(_selectedDate.year, _selectedDate.month + 1, 0).weekday;
  }

  int get selectedIndex {
    return _selectedDate.day - 1;
  }

  void selectDate(int day) {
    _selectedDate = DateTime(_selectedDate.year, selectedDate.month, day);
    log(_selectedDate.day.toString());
    notifyListeners();
  }

  String getWeekdayName(int day) {
    DateTime date = DateTime(_selectedDate.year, _selectedDate.month, day);
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



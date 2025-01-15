import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jackelieson/features/calendar/presentation/widgets/calender_header_widget.dart';
import 'package:jackelieson/features/calendar/presentation/widgets/calender_widget.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<StatefulWidget> createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  final CalendarController calendarController = CalendarController();

  // final List<Color> _colorCollection = <Color>[];

  bool is3DayView = false;
  CalendarView calenderview = CalendarView.day;

  final menuItems = [
    {
      'value': 'Schedule View',
      'icon': Assets.icons.scheduleViewIcon,
      'label': 'Schedule View',
      'view': CalendarView.schedule
    },
    {
      'value': 'Daily View',
      'icon': Assets.icons.dayView,
      'label': 'Daily View',
      'view': CalendarView.day
    },
    {
      'value': '3 Day View',
      'icon': Assets.icons.dailyViewIcon,
      'label': '3 Day View',
      'view': CalendarView.day
    },
    {
      'value': 'Weekly View',
      'icon': Assets.icons.weeklyView,
      'label': 'Weekly View',
      'view': CalendarView.week
    },
    {
      'value': 'Monthly View',
      'icon': Assets.icons.monthView,
      'label': 'Monthly View',
      'view': CalendarView.month
    },
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   _initializeEventColors();
  // }

  String selectedDate = DateFormat("MMMM d, yyyy").format(DateTime.now());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2026),
    );

    final DateFormat formatter = DateFormat('MMMM d, yyyy');

    if (pickedDate != null) {
      setState(
        () {
          selectedDate = formatter.format(pickedDate);
          calendarController.displayDate = pickedDate;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    log(selectedDate);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              UIHelper.verticalSpace(14.h),
              CalenderHeaderWidget(
                calenderDate: selectedDate,
                onCalenderTap: () {
                  _selectDate(context);
                },
                showPopupMenu: _showPopupMenu,
              ),
              UIHelper.verticalSpace(8.h),
              Expanded(
                child: CalenderWidget(
                  controller: calendarController,
                  calenderview: calenderview,
                  getDataSource: _getDataSource(),
                  is3Day: is3DayView,
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: AddEventButton(
        //   onTap: () => _showAddEventDialog(context),
        // ),
      ),
    );
  }

  void _showPopupMenu() async {
    final result = await showMenu(
      color: AppColors.cFFFFFF,
      context: context,
      position: RelativeRect.fromLTRB(200.w, 100.h, 0.h, 0.w),
      items: menuItems.map((item) {
        return PopupMenuItem<String>(
          value: item['value'].toString(),
          child: ListTile(
            leading: SvgPicture.asset(item['icon'].toString()),
            title: Text(item['label'].toString()),
          ),
        );
      }).toList(),
      elevation: 8.0,
    );

    if (result != null) {
      setState(() {
        final selectedItem =
            menuItems.firstWhere((item) => item['value'] == result);
        calenderview = selectedItem['view'] as CalendarView;
        is3DayView = result == '3 Day View';
        calendarController.view = calenderview;

        // Optionally, persist the selected view
        // appData.write(kKeyCalenderView, calenderview.toString());
      });
    }
  }

  // void _showAddEventDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.all(16.sp),
  //         child: Dialog(
  //           backgroundColor: AppColors.cFFFFFF,
  //           insetPadding: EdgeInsets.zero,
  //           alignment: Alignment.bottomCenter,
  //           child: AddPlanWidget(),
  //         ),
  //       );
  //     },
  //   );
  // }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];

    // Add an example meeting
    final DateTime now = DateTime.now();
    final DateTime startTime = DateTime(now.year, now.month, now.day, 10, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 1));

    meetings.add(
      Meeting(
        'Team Meeting',
        startTime,
        endTime,
        Colors.blue,
        false,
      ),
    );

    final DateTime anotherStart = DateTime(now.year, now.month, now.day, 14, 0);
    final DateTime anotherEnd = anotherStart.add(const Duration(hours: 2));

    meetings.add(Meeting(
      'Client Call',
      anotherStart,
      anotherEnd,
      Colors.green,
      false,
    ));

    return meetings;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

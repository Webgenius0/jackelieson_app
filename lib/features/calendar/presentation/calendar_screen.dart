import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jackelieson/features/calendar/model/get_event_response_model.dart';
import 'package:jackelieson/features/calendar/presentation/widgets/calender_header_widget.dart';
import 'package:jackelieson/features/calendar/presentation/widgets/calender_widget.dart';
import 'package:jackelieson/features/habits/presentation/habbit_screen.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/di.dart';
import 'package:jackelieson/helper/lodding_helper.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/api_acess.dart';
import 'package:jackelieson/provider/calendar_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  final CalendarController calendarController = CalendarController();

  GetEventResponseModel? res;
  late ScrollController _scrollController;
  dynamic avatar;

  bool is3DayView = false;
  CalendarView calenderview = CalendarView.day;

  int initialMonth = DateTime.now().month;
  int initialYear = DateTime.now().year;
  int initialDay = DateTime.now().day;

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

  String selectedDate = DateFormat("MMMM d, yyyy").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    avatar = appData.read("kkavatar");

    _scrollController = ScrollController();
    calendarController.selectedDate =
        DateTime(initialYear, initialMonth, initialDay);
    // _eventController = Provider.of<EventController>(context, listen: false);
    // addEventToController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToSelectedDate();
    });
  }

  Future<void> getData() async {
    try {
      final data = await getEventRxObj.getEvent().waitingForFuture();
      setState(() {
        res = data;
        avatar = appData.read("kkavatar");
      });
    } catch (e) {
      log("Error fetching data: $e");
    }
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = [];

    if (res?.data != null) {
      for (var event in res!.data!) {
        try {
          final DateTime date = event.date!;
          final List<String> startParts = event.startTime!.split(':');
          final List<String> endParts = event.endTime!.split(':');

          final DateTime startTime = DateTime(
            date.year,
            date.month,
            date.day,
            int.parse(startParts[0]),
            int.parse(startParts[1]),
          );

          final DateTime endTime = DateTime(
            date.year,
            date.month,
            date.day,
            int.parse(endParts[0]),
            int.parse(endParts[1]),
          );

          final Color eventColor =
              Color(int.parse("0xFF${event.color!.substring(2)}"));

          meetings.add(
            Meeting(
              event.title ?? 'Untitled Event',
              startTime,
              endTime,
              eventColor,
              false,
            ),
          );
        } catch (e) {
          log("Error parsing event data: $e");
        }
      }
    }

    return meetings;
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2026),
  //   );

  //   if (pickedDate != null) {
  //     setState(() {
  //       selectedDate = DateFormat('MMMM d, yyyy').format(pickedDate);
  //       calendarController.displayDate = pickedDate;
  //     });
  //   }
  // }

  void _showPopupMenu() async {
    final result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(200.w, 100.h, 0.w, 0.h),
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
      });
    }
  }

  void scrollToSelectedDate() {
    var calendarProvider =
        Provider.of<CalendarProvider>(context, listen: false);
    final daysInMonth = calendarProvider.daysInMonth;
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 54.w;
    double totalWidth = daysInMonth * itemWidth;

    double selectedPosition = calendarProvider.selectedIndex * itemWidth;
    double centerOffset = (screenWidth - itemWidth) / 2;

    double scrollPosition = selectedPosition - centerOffset;

    scrollPosition = scrollPosition.clamp(0.0, totalWidth - screenWidth);

    _scrollController.animateTo(
      scrollPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  showMonthCalender({
    required BuildContext context,
    required int? month,
    required int? year,
    required CalendarProvider calendarProvider,
  }) {
    showMonthPicker(
      context,
      onSelected: (month, year) async {
        if (kDebugMode) {
          log('Selected month: $month, year: $year');
        }

        setState(() {
          initialMonth = month;
          initialYear = year;
        });

        calendarProvider.selectedDate = DateTime.now();

        // await allTaskRxObj
        //     .getAllTask(month: monthList[month - 1])
        //     .waitingForFuture();
        // setState(() {
        // this.month = month;
        // this.year = year;
        // });
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
  }

  @override
  Widget build(BuildContext context) {
    var calendarProvider =
        Provider.of<CalendarProvider>(context, listen: false);
    int daysInMonth = calendarProvider.daysInMonth;
    calendarProvider
        .setInitialTime(DateTime(initialYear, initialMonth, initialDay));
    // int daysInText = calendarProvider.daysInText;

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
                imageUrl: avatar,
                calenderDate: DateFormat('MMM, yyyy')
                    .format(DateTime(initialYear, initialMonth)),
                onCalenderTap: () => showMonthCalender(
                  context: context,
                  month: initialMonth,
                  year: initialYear,
                  calendarProvider: calendarProvider,
                ),
                showPopupMenu: _showPopupMenu,
              ),
              UIHelper.verticalSpace(8.h),
              _buildHorizontalDateScroller(calendarProvider, daysInMonth),
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
      ),
    );
  }

  Widget _buildHorizontalDateScroller(
      CalendarProvider calendarProvider, int daysInText) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(daysInText, (index) {
          int day = index + 1;

          bool isSelected = calendarProvider.selectedIndex == index;
          log("$day");
          return GestureDetector(
            onTap: () {
              calendarProvider.selectDate(index);
              // calendarProvider.printSelectedDate(day);
              scrollToSelectedDate();

              setState(() {
                initialDay = index + 1;
              });
              calendarController.displayDate =
                  DateTime(initialYear, initialMonth, initialDay);
            },
            child: DateDayTile(
              today: calendarProvider.selectedIndex == index,
              isSelected: isSelected,
              date: calendarProvider.getWeekdayName(day),
              day: "$day",
            ),
          );
        }),
      ),
    );
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
  DateTime getStartTime(int index) => appointments![index].from;

  @override
  DateTime getEndTime(int index) => appointments![index].to;

  @override
  String getSubject(int index) => appointments![index].eventName;

  @override
  Color getColor(int index) => appointments![index].background;

  @override
  bool isAllDay(int index) => appointments![index].isAllDay;
}

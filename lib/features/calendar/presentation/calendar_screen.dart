import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
  final List<Color> _colorCollection = <Color>[];

  final ScrollController _scrollController = ScrollController();
  DateTime? _currentDate;

  @override
  void initState() {
    _initializeEventColor();
    super.initState();
  }

  void showPopupMenu() async {
    await showMenu(
      color: AppColors.cFFFFFF,
      context: context,
      position: RelativeRect.fromLTRB(200.w, 100.h, 0.h, 0.w),
      items: [
        PopupMenuItem<String>(
          value: 'Schedule View',
          child: ListTile(
            leading: SvgPicture.asset(Assets.icons.scheduleViewIcon),
            title: Text('Schedule View'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Daily View',
          child: ListTile(
            leading: SvgPicture.asset(Assets.icons.dayView),
            title: Text('SDaily View'),
          ),
        ),
        PopupMenuItem<String>(
          value: '3 Day View',
          child: ListTile(
            leading: SvgPicture.asset(Assets.icons.dailyViewIcon),
            title: Text('3 Day View'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Weekly View',
          child: ListTile(
            leading: SvgPicture.asset(Assets.icons.weeklyView),
            title: Text('Weekly View'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Monthly View',
          child: ListTile(
            leading: SvgPicture.asset(Assets.icons.monthView),
            title: Text('Monthly View'),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: FloatingActionButton(
            backgroundColor: AppColors.c1497FF,
            elevation: 0,
            shape: CircleBorder(),
            onPressed: () {},
            child: Icon(
              CupertinoIcons.add,
              size: 45.sp,
              color: AppColors.cFFFFFF,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                width: double.maxFinite,
                height: 55.h,
                decoration: BoxDecoration(
                  color: AppColors.cF7F7F7,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset(
                        height: 32.h,
                        width: 32.w,
                        Assets.images.perons.path,
                      ),
                    ),
                    UIHelper.horizontalSpace(8.w),
                    Container(
                      alignment: Alignment.center,
                      width: 135.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                      child: Text('Oct 7, 2025'),
                    ),
                    SvgPicture.asset(Assets.icons.search),
                    SvgPicture.asset(Assets.icons.startCalender),
                    GestureDetector(
                      onTap: () {
                        showPopupMenu();
                      },
                      child: SvgPicture.asset(Assets.icons.menu),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(8.h),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  thickness: 20,
                  interactive: true,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 1000,
                      child: SfCalendar(
                        view: CalendarView.day,
                        dataSource: _getAppointments(),
                        onViewChanged: (viewChangedDetails) => {
                          if (_currentDate != null &&
                              _currentDate !=
                                  viewChangedDetails.visibleDates[0])
                            {_scrollController.jumpTo(0)}
                          else
                            {_currentDate = viewChangedDetails.visibleDates[0]}
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataSource _getAppointments() {
    return DataSource(
      List<Appointment>.generate(
        10,
        (int index) => Appointment(
          subject: 'Meeting $index',
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 1)),
          color: _colorCollection[index % 9],
          isAllDay: false,
        ),
      ),
    );
  }

  void _initializeEventColor() {
    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF36B37B));
    _colorCollection.add(const Color(0xFF01A1EF));
    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFFE47C73));
    _colorCollection.add(const Color(0xFF636363));
    _colorCollection.add(const Color(0xFF0A8043));
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}

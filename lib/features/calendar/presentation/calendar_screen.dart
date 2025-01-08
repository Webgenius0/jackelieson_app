import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/features/calendar/presentation/add_plan.dart';
import 'package:jackelieson/features/calendar/presentation/widgets/add_event_button.dart';
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
  CalendarController calendarController = CalendarController();

  final List<Color> _colorCollection = <Color>[];

  bool is3DayView = false;

  CalendarView calenderview = CalendarView.day;

  @override
  void initState() {
    super.initState();
    _initializeEventColor();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              UIHelper.verticalSpace(14.h),
              _buildHeader(),
              UIHelper.verticalSpace(8.h),
              Expanded(
                child: SfCalendar(
                  view: calenderview,
                  controller: calendarController,
                  allowDragAndDrop: false,
                  backgroundColor: AppColors.cFFFFFF,
                  firstDayOfWeek: 1,
                  headerHeight: 0,
                  cellBorderColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: AddEventButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Dialog(
                    // elevation: 8,
                    backgroundColor: AppColors.cFFFFFF,
                    insetPadding: EdgeInsets.all(0),
                    alignment: Alignment.bottomCenter,
                    child: AddPlanWidget(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Builds the calendar header
  Widget _buildHeader() {
    return Container(
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
          Expanded(
            flex: 3,
            child: Row(
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
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(Assets.icons.search),
                SvgPicture.asset(Assets.icons.startCalender),
                GestureDetector(
                  onTap: showPopupMenu,
                  child: SvgPicture.asset(Assets.icons.menu),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Initializes event colors
  void _initializeEventColor() {
    _colorCollection.addAll([
      const Color(0xFF0F8644),
      const Color(0xFF8B1FA9),
      const Color(0xFFD20100),
      const Color(0xFFFC571D),
      const Color(0xFF36B37B),
      const Color(0xFF01A1EF),
      const Color(0xFF3D4FB5),
      const Color(0xFFE47C73),
      const Color(0xFF636363),
      const Color(0xFF0A8043),
    ]);
  }

  void showPopupMenu() async {
    final result = await showMenu(
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
            title: Text('Daily View'),
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
        // Add other views...
      ],
      elevation: 8.0,
    );

    setState(() {
      switch (result) {
        case 'Daily View':
          calenderview = CalendarView.day;
          is3DayView = false;
          calendarController.view = calenderview;
          break;
        case 'Schedule View':
          calenderview = CalendarView.schedule;
          is3DayView = false;
          calendarController.view = calenderview;
          break;
        case '3 Day View':
          calenderview = CalendarView.timelineDay;
          is3DayView = true;
          calendarController.view = calenderview;

          break;
        case 'Weekly View':
          calenderview = CalendarView.week;
          is3DayView = false;
          calendarController.view = calenderview;

          break;
        case 'Monthly View':
          calenderview = CalendarView.month;
          is3DayView = false;
          calendarController.view = calenderview;

          break;
      }

      // appData.write(kKeyCalenderView, calenderview.toString());
    });
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}

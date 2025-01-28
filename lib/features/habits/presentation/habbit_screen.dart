import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/habits/model/get_habbit_response_model.dart';
import 'package:jackelieson/features/habits/presentation/habbit_deatils_screen.dart';
import 'package:jackelieson/features/habits/presentation/widgets/habbit_tile_widget.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/loadding_indicator_circle_widget.dart';
import 'package:jackelieson/helper/lodding_helper.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/api_acess.dart';
import 'package:jackelieson/provider/habbit_provider.dart';
import 'package:provider/provider.dart';

DateTime get now => DateTime.now();

class HabitTabScreen extends StatefulWidget {
  const HabitTabScreen({super.key});

  @override
  State<HabitTabScreen> createState() => _HabitTabScreenState();
}

class _HabitTabScreenState extends State<HabitTabScreen> {
  late ScrollController _scrollController;
  late EventController _eventController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _eventController = Provider.of<EventController>(context, listen: false);
    // addEventToController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToSelectedDate();
    });
    getHabbitRxObj.getAllTask(day: "wed");
  }

  // void addEventToController() {
  //   var event = CalendarEventData(
  //     date: DateTime.now(),
  //     title: "Project meeting",
  //     event: "Test Event",
  //     description: "Today is project meeting.",
  //     startTime: DateTime(now.year, now.month, now.day, 9, 30),
  //     endTime: DateTime(now.year, now.month, now.day, 11, 30),
  //   );

  //   _eventController.add(event); // Add the event to the EventController
  //   if (kDebugMode) {
  //     print("Event added: ${event.title} at ${event.date}");
  //   }
  // }

  void scrollToSelectedDate() {
    var calendarProvider = Provider.of<Calendar>(context, listen: false);
    final daysInMonth = calendarProvider.daysInMonth;
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 54.w; // The width of a single item in the scroller
    double totalWidth = daysInMonth * itemWidth;

    // Calculate the scroll position dynamically
    double selectedPosition = calendarProvider.selectedIndex * itemWidth;
    double centerOffset = (screenWidth - itemWidth) / 2;

    // Adjust the scroll position to center the selected date
    double scrollPosition = selectedPosition - centerOffset;

    // Ensure the scroll position is within valid bounds
    scrollPosition = scrollPosition.clamp(0.0, totalWidth - screenWidth);

    _scrollController.animateTo(
      scrollPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var calendarProvider = Provider.of<Calendar>(context, listen: false);
    int daysInMonth = calendarProvider.daysInMonth;
    int daysInText = calendarProvider.daysInText;

    log("$daysInText");

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              UIHelper.verticalSpace(14.h),
              _buildHeader(),
              UIHelper.verticalSpace(8.h),
              _buildHorizontalDateScroller(calendarProvider, daysInMonth),
              UIHelper.verticalSpace(30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tuesday habits",
                    style: TextFontStyle.headline16w600c686868StyleRoboto
                        .copyWith(
                            fontSize: 20.sp,
                            color: AppColors.c686868,
                            fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 11.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.allPrimaryColor,
                        borderRadius: BorderRadius.circular(32.r)),
                    child: Row(
                      children: [
                        Center(child: SvgPicture.asset(Assets.icons.calender)),
                        UIHelper.horizontalSpace(8.w),
                        Text(
                          "Calendar",
                          style: TextFontStyle.text13poppinsc000000.copyWith(
                              color: AppColors.cFFFFFF,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpaceSmall,
              StreamBuilder<GetHabbitResponseModel>(
                stream: getHabbitRxObj.dataFetcher,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'An error occurred: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: loadingIndicatorCircle(context: context),
                    );
                  }

                  if (snapshot.hasData) {
                    final habits = snapshot.data?.data;

                    if (habits == null || habits.isEmpty) {
                      return Center(
                        child: Text(
                          'No Habits Available',
                          style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                              .copyWith(
                            fontSize: 24.sp,
                            color: AppColors.c222222,
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          UIHelper.verticalSpaceSmall,
                      itemCount: habits.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = habits[index];
                        final day1 = item.days?.first;
                        final day2 = item.days?.last;

                        return HabbitTileWidget(
                          isStatus:
                              item.taskStatus?.toLowerCase() == "incomplete",
                          icon: item.imageUrl ?? "",
                          title: item.name ?? "",
                          week: "$day1 - $day2",
                          streak: item.streak?.toString() ?? "0",
                          status: item.taskStatus ?? "",
                          onTap: () async {
                            await habbitDetailsRxObj
                                .habbitDetails(id: item.id)
                                .waitingForFuture()
                                .then((data) async {
                              if (data.success == true) {
                                await Get.to(
                                    () => HabbitDeatilsScreen(data: data));
                              }
                            });
                          },
                          onCancelTap: () async {
                            await habbitStatusRxObj
                                .habbitStatus(status: "cancel", id: item.id)
                                .waitingForFuture()
                                .then((res) async {
                              if (res.success == true) {
                                await getHabbitRxObj
                                    .getAllTask(day: "wed")
                                    .waitingForFuture();
                              }
                            });
                          },
                          onDoneTap: () async {
                            await habbitStatusRxObj
                                .habbitStatus(status: "complete", id: item.id)
                                .waitingForFuture()
                                .then((res) async {
                              if (res.success == true) {
                                await getHabbitRxObj
                                    .getAllTask(day: "wed")
                                    .waitingForFuture();
                              }
                            });
                          },
                        );
                      },
                    );
                  }

                  return Center(
                    child: Text(
                      'No Habits Available',
                      style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                          .copyWith(
                        fontSize: 24.sp,
                        color: AppColors.c222222,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

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
                    Assets.images.perons.path,
                    height: 32.h,
                    width: 32.w,
                  ),
                ),
                UIHelper.horizontalSpace(8.w),
                Container(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Oct, 2025',
                        style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                            .copyWith(color: AppColors.c686868),
                      ),
                      UIHelper.horizontalSpaceSmall,
                      SvgPicture.asset(Assets.icons.dropdownIcon),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(Assets.icons.search),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalDateScroller(
      Calendar calendarProvider, int daysInText) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(daysInText, (index) {
          int day = index + 1;

          bool isSelected = calendarProvider.selectedIndex == index;

          return GestureDetector(
            onTap: () {
              calendarProvider.selectDate(index);
              // calendarProvider.printSelectedDate(day);
              scrollToSelectedDate();
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

class DateDayTile extends StatelessWidget {
  final bool isSelected;
  final bool today;
  final String date;
  final String day;
  final VoidCallback? onTap;

  const DateDayTile({
    super.key,
    required this.isSelected,
    required this.date,
    required this.day,
    required this.today,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        margin: EdgeInsets.only(left: 8.w),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.allPrimaryColor : AppColors.cF7F7F7,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: today ? AppColors.allPrimaryColor : AppColors.cF7F7F7,
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                date,
                style: TextFontStyle.headline16w500cFEFFFFStyleRoboto.copyWith(
                  fontSize: 14.sp,
                  color: isSelected ? AppColors.cFFFFFF : AppColors.c686868,
                ),
              ),
              Text(
                day,
                style: TextFontStyle.headline16w500cFEFFFFStyleRoboto.copyWith(
                  fontSize: 14.sp,
                  color: isSelected ? AppColors.cFFFFFF : AppColors.c686868,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

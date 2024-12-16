import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onTapButton;
  final TextEditingController? controller;

  const CustomButtonWidget({
    super.key,
    required this.onTapButton,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.sp),
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            // TextField inside Expanded
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 10.h),
                      filled: true,
                      fillColor: AppColors.cFFFFFF,
                      hintText: 'Type Your Reminder Here...',
                      hintStyle:
                          TextFontStyle.text13poppinscFF6E5782w600.copyWith(
                        fontSize: 13.sp,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      suffixIcon:
                          const Icon(Icons.image_outlined, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),

            // SpeedDial(
            //   activeBackgroundColor: AppColors.cFFFFF,
            //   backgroundColor: AppColors.cFFFFF,
            //   icon: Icons.send,
            //   children: [
            //     SpeedDialChild(
            //       label: "Hello"
            //     )
            //   ],

            //   // onPress: (){
            //   //   log("Hello");
            //   // },
            // )

            // Circular Button with Send Icon
            GestureDetector(
              onTap: onTapButton,
              onLongPress: () {
                _onButtonHold(context);
              },
              child: Container(
                height: 60.h,
                width: 60.h,
                padding: const EdgeInsets.only(
                    left: 23, right: 13, top: 0, bottom: 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  Assets.icons.telegramSend,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _onButtonHold(BuildContext context) {
    return showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 120.h, right: 10.h),
                    height: 30.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.icons.sliderBg.path),
                            fit: BoxFit.fill)),
                    padding: EdgeInsets.only(right: 10.h, left: 10.h),
                    child: Row(
                      children: [
                        Text(
                          "3 Months",
                          style: TextFontStyle.customizePoppinsFont.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.cFFFFF),
                        ),
                        Flexible(
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: SizedBox(
                              // width: 209.w,
                              // Set your desired width for the slider
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  valueIndicatorShape:
                                      const PaddleSliderValueIndicatorShape(),
                                  trackHeight: 5,
                                  // Increase the track height (vertical size)
                                  activeTrackColor: AppColors.cE90909,
                                  inactiveTrackColor: AppColors.cFFFFFF,
                                  thumbColor: AppColors.cFFFFFF,
                                  valueIndicatorColor: AppColors.cAB1BE2,
                                  valueIndicatorTextStyle:
                                      const TextStyle(color: AppColors.cFFFFFF),
                                  overlayColor:
                                      AppColors.cAB1BE2.withOpacity(0.3),
                                  overlayShape: const RoundSliderOverlayShape(
                                      overlayRadius: 12.0),
                                  thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 10),
                                ),
                                child: Slider(
                                  value: 280,
                                  min: 1,
                                  max: 360,
                                  divisions: 360,
                                  label: 'Days',
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 100.h, right: 10.h),
                    // height: 400.h,
                    width: 70.h,

                    decoration: BoxDecoration(
                        color: AppColors.cFFFFF,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 1.r,
                              offset: const Offset(00, 00),
                              spreadRadius: 1.r)
                        ],
                        borderRadius: BorderRadius.circular(60.r)),
                    child: Column(
                      children: [
                        CustomReminderTimeWidget(
                          onTap: () {},
                          imagePath: Assets.icons.a6month,
                          time: "6",
                          title: "Months",
                        ),
                        CustomReminderTimeWidget(
                          onTap: () {},
                          imagePath: Assets.icons.a60days,
                          time: "30",
                          title: "Days",
                        ),
                        CustomReminderTimeWidget(
                          onTap: () {},
                          imagePath: Assets.icons.a3days,
                          time: "3",
                          title: "Days",
                        ),
                        CustomReminderTimeWidget(
                          isActive: true,
                          onTap: () {},
                          imagePath: Assets.icons.customTime,
                          // time: "30",
                          title: "Custom",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}

class CustomReminderTimeWidget extends StatelessWidget {
  final String imagePath, title;
  final String? time;
  final Function() onTap;
  final bool isActive;
  const CustomReminderTimeWidget(
      {super.key,
      required this.imagePath,
      this.time,
      required this.title,
      this.isActive = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.h, vertical: 2.h),
        child: Stack(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 70.h,
              height: 70.h,
            ),
            Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (time != null)
                      Text(
                        time!,
                        style: TextFontStyle.customizePoppinsFont.copyWith(
                            fontSize: 10.sp,
                            color: AppColors.cFFFFF,
                            fontWeight: FontWeight.w600),
                      ),
                    Text(
                      title,
                      style: TextFontStyle.customizePoppinsFont.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.cFFFFF,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )),
            if (isActive)
              SizedBox(
                width: 70.h,
                height: 70.h,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      Assets.icons.selectedColor,
                      width: 70.h,
                      height: 70.h,
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.all(18.h),
                        child: SvgPicture.asset(
                          Assets.icons.selectIcon,
                          height: 10.h,
                          width: 10.h,
                        ),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

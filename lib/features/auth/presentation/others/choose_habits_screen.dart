// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/common_widgets/app_custom_buttom.dart';
import 'package:jackelieson/common_widgets/custom_network_image.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/auth/model/all_habbit_response_model.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/all_routes.dart';
import 'package:jackelieson/helper/loadding_indicator_circle_widget.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/api_acess.dart';

class ChooseHabitsScreen extends StatefulWidget {
  const ChooseHabitsScreen({super.key});

  @override
  State<ChooseHabitsScreen> createState() => _ChooseHabitsScreenState();
}

class _ChooseHabitsScreenState extends State<ChooseHabitsScreen> {
  List<String> itemList = [];
  final Set<int> selectedIndices = {};

  @override
  void initState() {
    allHabbitRxObj.getAllHabbit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            // right: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose habits',
                    style:
                        TextFontStyle.headline18w600cFEFFFFStyleRoboto.copyWith(
                      fontSize: 24.sp,
                      color: AppColors.c222222,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      NavigationService.navigateTo(Routes.navigation);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Skip',
                          style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                              .copyWith(
                            fontSize: 16.sp,
                            color: AppColors.c000000,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                'Choose your Daily Habits, you can pick more\nthan once.',
                style: TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.c555555,
                ),
              ),
              UIHelper.verticalSpace(20.h),
              StreamBuilder<AllHabbitResponseModel>(
                stream: allHabbitRxObj.dataFetcher,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('An error occurred: ${snapshot.error}',
                          style: const TextStyle(color: Colors.red)),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: loadingIndicatorCircle(context: context));
                  }

                  if (snapshot.hasData) {
                    log("messageasdfghh================================================================");
                    if (snapshot.data!.data!.isNotEmpty) {
                      return Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2, vertical: 10.h),
                          itemCount: snapshot.data!.data!.isNotEmpty ? 6 : 0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final items = snapshot.data!.data?[index];
                            return ChooseHabitWidgets(
                              borderColro: selectedIndices.contains(index)
                                  ? AppColors.allPrimaryColor
                                  : Colors.grey.withOpacity(
                                      0.3,
                                    ),
                              onSelectedColor: selectedIndices.contains(index)
                                  ? AppColors.allPrimaryColor
                                  : Colors.white,
                              onTap: () {
                                setState(() {
                                  if (selectedIndices.contains(index)) {
                                    selectedIndices
                                        .remove(index); // Unselect if selected
                                  } else {
                                    if (selectedIndices.length < 3) {
                                      selectedIndices.add(index);
                                    } else {
                                      ToastUtil.showShortToast(
                                          "Get Premium access");
                                    }
                                  }
                                });
                              },
                              icon: items?.imageUrl ?? "",
                              title: items?.name ?? "",
                            );
                          },
                        ),
                      );
                    }

                    return Expanded(
                      child: Text(
                        'No Habbit Available1123',
                        style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 24.sp,
                          color: AppColors.c222222,
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Text(
                        'No Habbit Available456',
                        style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 24.sp,
                          color: AppColors.c222222,
                        ),
                      ),
                    );
                  }
                },
              ),
              AppCustomButtom(
                btnName: 'Next',
                borderRadius: 8,
                onTap: () async {
                  List<String> selectedItems =
                      selectedIndices.map((index) => itemList[index]).toList();
                  log("Selected Items: $selectedItems");

                  // allHabbitRxObj.getAllHabbit();
                  NavigationService.navigateTo(Routes.navigation);
                },
                fontWeight: FontWeight.w600,
                bgColor: AppColors.allPrimaryColor,
              ),
              UIHelper.verticalSpace(10.h),
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseHabitWidgets extends StatelessWidget {
  String icon;
  String title;
  VoidCallback? onTap;
  Color? borderColro;
  Color? onSelectedColor;
  ChooseHabitWidgets({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.borderColro,
    this.onSelectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 160.w,
        // height: 160.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2.w,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: borderColro ??
                  Colors.grey.withOpacity(
                    0.3,
                  ),
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SvgPicture.asset(icon),
                CustomNetworkImageWidget(
                  urls: icon,
                  height: 50.h,
                  width: 50.h,
                ),
                UIHelper.verticalSpace(10.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style:
                      TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.c555555,
                  ),
                )
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 16,
                height: 16,
                decoration: ShapeDecoration(
                  color: onSelectedColor,
                  shape: OvalBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/ui_helpers.dart';

class CalenderHeaderWidget extends StatelessWidget {
  const CalenderHeaderWidget({
    super.key,
    this.showPopupMenu,
    this.onCalenderTap,
    required this.calenderDate,
  });

  final VoidCallback? showPopupMenu;
  final VoidCallback? onCalenderTap;
  final String calenderDate;


  @override
  Widget build(BuildContext context) {
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
                GestureDetector(
                    onTap: onCalenderTap, child: _buildDateSelector()),
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

  Widget _buildDateSelector() {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Row(
        children: [
          Text(calenderDate),
          UIHelper.horizontalSpaceSmall,
          SvgPicture.asset(Assets.icons.dropdownIcon),
        ],
      ),
    );
  }
}

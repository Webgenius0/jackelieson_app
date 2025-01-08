import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/gen/colors.gen.dart';

class AddEventButton extends StatelessWidget {
  const AddEventButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64.h,
        width: 64.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.c1497FF,
        ),
        child: Icon(
          CupertinoIcons.add,
          size: 45.sp,
          color: AppColors.cFFFFFF,
        ),
      ),
    );
  }
}

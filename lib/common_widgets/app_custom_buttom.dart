import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/colors.gen.dart';

class AppCustomButtom extends StatelessWidget {
  final String btnName;
  final VoidCallback? onTap;
  final double? borderRadius;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool isBorder;
  final Color? borderColor;
  final Color? textColor;
  final Color? bgColor;
  const AppCustomButtom({
    super.key,
    required this.btnName,
    this.onTap,
    this.borderRadius,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.margin,
    this.padding,
    this.isBorder = false,
    this.borderColor,
    this.textColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        padding: padding ?? EdgeInsets.zero,
        height: height ?? 52.h,
        alignment: Alignment.center,
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(
            borderRadius ?? 50.r,
          ),
          border: Border.all(
            color: isBorder ? borderColor ?? Colors.white : Colors.transparent,
          ),
        ),
        child: Text(
          btnName,
          style: TextFontStyle.headline12w300cFEFFFFStyleRoboto.copyWith(
            fontSize: fontSize ?? 18.sp,
            fontWeight: fontWeight ?? FontWeight.w300,
            color: textColor ?? AppColors.cFFFFFF,
          ),
        ),
      ),
    );
  }
}

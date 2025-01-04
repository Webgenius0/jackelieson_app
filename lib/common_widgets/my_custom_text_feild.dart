// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jackelieson/gen/colors.gen.dart';


class MyCustomTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPrefixIcon;
  final double borderRadius;
  final VoidCallback? onSuffixIconTap;
  final String? iconpath;
  final int maxline;
  final bool readOnly;
  final bool isBorder;
  final Color fillColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Color? suffixIconColor;
  final TextInputAction? textInputAction;

  const MyCustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.borderRadius = 10.0, // Set to 10 pixels
    required this.isPrefixIcon,
    this.iconpath,
    this.onSuffixIconTap,
    this.readOnly = false,
    this.maxline = 1,
    this.isBorder = false,
    this.fillColor = Colors.white,
    this.borderColor,
    this.textStyle,
    this.suffixIconColor,
    this.textInputAction,
  });

  @override
  _MyCustomTextFormFieldState createState() => _MyCustomTextFormFieldState();
}

class _MyCustomTextFormFieldState extends State<MyCustomTextFormField> {
  late FocusNode _focusNode;
  // ignore: unused_field
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: TextFormField(
        textInputAction: widget.textInputAction,
        readOnly: widget.readOnly,
        maxLines: widget.maxline,
        focusNode: _focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        // style: widget.textStyle ??
        //     TextFontStyle.headline10w400c838484StyleTouche
        //         .copyWith(color: AppColors.c000000),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          labelText: widget.labelText,
          hintText: widget.hintText,
          // hintStyle: widget.textStyle ??
          //     TextFontStyle.headline10w400c838484StyleTouche,
          prefixIcon: widget.isPrefixIcon && widget.iconpath != null
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 12.w,
                  ),
                  child: SvgPicture.asset(
                    widget.iconpath!,
                    width: 24.w,
                    // color: _isFocused
                    //     ? AppColors.allPrimaryColor
                    //     : AppColors.c17242B,
                  ),
                )
              : null,
          suffixIcon: widget.suffixIcon != null
              ? GestureDetector(
                  onTap: widget.onSuffixIconTap,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Icon(
                      widget.suffixIcon,
                      // color: widget.suffixIconColor ??
                      //     (_isFocused
                      //         ? AppColors.allPrimaryColor
                      //         : AppColors.c17242B),
                    ),
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            // borderSide: widget.isBorder == true
            //     ? BorderSide(
            //         color: widget.borderColor ??
            //             AppColors
            //                 .allPrimaryColor, // Adjust the border width if needed
            //       )
            //     : const BorderSide(color: AppColors.c838484),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: AppColors
                  .allPrimaryColor, // Adjust the border width if needed
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.red),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.allPrimaryColor)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        ),
      ),
    );
  }
}

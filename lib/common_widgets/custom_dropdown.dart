// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';

class MyCustomDropdown extends StatefulWidget {
  final String? selectedValue;
  final List<String> dropDownValue;
  final Function(String?)? onChange;
  final double horizonPadding;
  final double verticPadding;
  final String? hinttext;
  final String? hintIcon;
  final bool isImageNull;
  final double? width;
  final double? height;

  const MyCustomDropdown({
    super.key,
    this.selectedValue,
    required this.dropDownValue,
    this.horizonPadding = 15,
    this.verticPadding = 4,
    this.hinttext,
    this.onChange,
    this.hintIcon,
    required this.isImageNull,
    this.width,
    this.height,
  });

  @override
  _MyCustomDropdownState createState() => _MyCustomDropdownState();
}

class _MyCustomDropdownState extends State<MyCustomDropdown> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode;
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Focus(
        focusNode: _focusNode,
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.symmetric(
              horizontal: widget.horizonPadding.w,
              vertical: widget.verticPadding),
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            border: Border.all(
              color:
                  _focusNode.hasFocus ? AppColors.cFFFFFF : AppColors.cFFFFFF,
              width: 1.w,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text(
                "${widget.hinttext}",
                style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                    .copyWith(color: AppColors.c686868, fontSize: 14.sp),
              ),
              isExpanded: true,
              value: widget.selectedValue,
              icon: SvgPicture.asset(Assets.icons.dropdownIcon),
              items: widget.dropDownValue
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value.toUpperCase(),
                    style: TextFontStyle.headline16w500cFEFFFFStyleRoboto
                        .copyWith(color: AppColors.c686868, fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                widget.onChange?.call(newValue);
                FocusScope.of(context).requestFocus(_focusNode);
              },
              // padding: EdgeInsets.all(0),

              dropdownColor: AppColors.cFFFFFF,
            ),
          ),
        ),
      ),
    );
  }
}

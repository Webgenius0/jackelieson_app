// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jackelieson/common_widgets/app_custom_buttom.dart';
import 'package:jackelieson/common_widgets/my_custom_text_feild.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/settings/presentation/profile/widget/profile_header_image_widget.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 20.h),
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    ProfileHeaderImageWidget(),
                    UIHelper.verticalSpaceSmall,
                    Container(
                      height: 400.h,
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      decoration: ShapeDecoration(
                        color: AppColors.cFFFFFF,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50.w,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: AppColors.cDDDDDD,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x0F000000),
                            blurRadius: 14,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style:
                                TextFontStyle.headline16w600c686868StyleRoboto,
                          ),
                          UIHelper.verticalSpace(8.h),
                          MyCustomTextFormField(
                            isPrefixIcon: false,
                            isBorder: true,
                            borderColor: AppColors.cE7E6E6,
                            hintText: "Enter Your Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            },
                          ),
                          UIHelper.verticalSpaceSmall,
                          Text(
                            'Email',
                            style:
                                TextFontStyle.headline16w600c686868StyleRoboto,
                          ),
                          UIHelper.verticalSpaceSmall,
                          MyCustomTextFormField(
                            isPrefixIcon: false,
                            isBorder: true,
                            borderColor: AppColors.cE7E6E6,
                            hintText: "Enter Your Email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              String pattern =
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          UIHelper.verticalSpaceSmall,
                          Text(
                            'Password',
                            style:
                                TextFontStyle.headline16w600c686868StyleRoboto,
                          ),
                          UIHelper.verticalSpaceSmall,
                          MyCustomTextFormField(
                            obscureText: provider.isObsecure,
                            suffixIcon: provider.isObsecure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onSuffixIconTap: () {
                              provider.toggleObsecure();
                              print('object');
                            },
                            isPrefixIcon: true,
                            isBorder: true,
                            borderColor: AppColors.cE7E6E6,
                            hintText: "Enter password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          UIHelper.verticalSpaceMedium,
                          AppCustomButtom(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            borderRadius: 8,
                            bgColor: AppColors.allPrimaryColor,
                            btnName: 'Change Password',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          )
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(26.h),
                    Container(
                      height: 460.h,
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      decoration: ShapeDecoration(
                        color: AppColors.cFFFFFF,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50.w,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: AppColors.cDDDDDD,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x0F000000),
                            blurRadius: 14,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected package',
                            style:
                                TextFontStyle.headline16w600c686868StyleRoboto,
                          ),
                          UIHelper.verticalSpaceMedium,
                          GestureDetector(
                            onTap: () {
                              upgradeToPremiumDialog();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              width: double.maxFinite,
                              height: 40.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.allPrimaryColor,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                      width: 20.w,
                                      height: 20.h,
                                      Assets.images.successmark.path),
                                  UIHelper.horizontalSpace(8.w),
                                  Text(
                                    'Premium',
                                    style: TextFontStyle
                                        .headline14w400c686868StyleRoboto,
                                  )
                                ],
                              ),
                            ),
                          ),
                          UIHelper.verticalSpaceMedium,
                          Text(
                            'Details',
                            style:
                                TextFontStyle.headline16w600c686868StyleRoboto,
                          ),
                          UIHelper.verticalSpace(8.h),
                          PackageDetailsWidget(
                            title: 'Daily Habit Tracking',
                          ),
                          PackageDetailsWidget(
                            title: 'Advanced Analytics and Insights',
                          ),
                          PackageDetailsWidget(
                            title: 'Habit Streaks and Rewards',
                          ),
                          PackageDetailsWidget(
                            title: 'Personalized Habit Reminders',
                          ),
                          PackageDetailsWidget(
                            title: 'Custom Habit Templates',
                          ),
                          PackageDetailsWidget(
                            title: 'Priority Support and Assistance',
                          ),
                          PackageDetailsWidget(
                            title: 'Advanced Habit Tracking Features',
                          ),
                          PackageDetailsWidget(
                            title: 'Ad-Free Experience',
                          ),
                          UIHelper.verticalSpaceMedium,
                          AppCustomButtom(
                            bgColor: AppColors.cB9B9B9,
                            borderRadius: 8,
                            btnName: 'Canel Plan',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          )
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(35.h)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void upgradeToPremiumDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.cFFFFFF,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                NavigationService.goBack;
              },
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.cancel_outlined)),
            ),
            Text(
              "Upgrade to premium",
              style: TextFontStyle.headline24w600c686868StyleRoboto,
            ),
            UIHelper.verticalSpace(8.h),
            Text(
              "This Package is designed to maximize the user's habit-building experience with advanced tools, personalized tracking",
              style: TextFontStyle.headline12w300cFEFFFFStyleRoboto.copyWith(
                color: AppColors.c686868,
              ),
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpaceSmall,
            Container(
              height: 430.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.49, 0.87),
                  end: Alignment(-0.49, -0.87),
                  colors: [
                    Color(0xFFFF2828),
                    Color(0xFFFF5900),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 10,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Premium Plan',
                    style: TextFontStyle.headline24w600c686868StyleRoboto
                        .copyWith(color: AppColors.cFFFFFF),
                  ),
                  Text(
                    'Habit Tracker Premium Plan',
                    style: TextFontStyle.headline14w400c686868StyleRoboto
                        .copyWith(color: AppColors.cFFFFFF),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Text(
                    '\$29',
                    style: TextFontStyle.headline24w600c686868StyleRoboto
                        .copyWith(color: AppColors.cFFFFFF),
                  ),
                  UIHelper.verticalSpace(8.h),
                  PackageDetailsWidget(
                    iconColor: AppColors.cFFFFFF,
                    textColor: AppColors.cFFFFFF,
                    title: 'Daily Habit Tracking',
                  ),
                  PackageDetailsWidget(
                    iconColor: AppColors.cFFFFFF,
                    textColor: AppColors.cFFFFFF,
                    title: 'Advanced Analytics and Insights',
                  ),
                  PackageDetailsWidget(
                    iconColor: AppColors.cFFFFFF,
                    textColor: AppColors.cFFFFFF,
                    title: 'Habit Streaks and Rewards',
                  ),
                  PackageDetailsWidget(
                    iconColor: AppColors.cFFFFFF,
                    textColor: AppColors.cFFFFFF,
                    title: 'Personalized Habit Reminders',
                  ),
                  PackageDetailsWidget(
                    iconColor: AppColors.cFFFFFF,
                    textColor: AppColors.cFFFFFF,
                    title: 'Custom Habit Templates',
                  ),
                  PackageDetailsWidget(
                    iconColor: AppColors.cFFFFFF,
                    textColor: AppColors.cFFFFFF,
                    title: 'Priority Support and Assistance',
                  ),
                  PackageDetailsWidget(
                    iconColor: AppColors.cFFFFFF,
                    textColor: AppColors.cFFFFFF,
                    title: 'Advanced Habit Tracking Features',
                  ),
                  PackageDetailsWidget(
                    iconColor: AppColors.cFFFFFF,
                    textColor: AppColors.cFFFFFF,
                    title: 'Ad-Free Experience',
                  ),
                  UIHelper.verticalSpace(40.h),
                  AppCustomButtom(
                    onTap: () {},
                    height: 45.h,
                    bgColor: AppColors.cFFFFFF,
                    btnName: 'Subscribe now',
                    fontSize: 16,
                    textColor: AppColors.c0070F0,
                    fontWeight: FontWeight.w700,
                    borderRadius: 8,
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

class PackageDetailsWidget extends StatelessWidget {
  String title;
  Color? textColor;
  Color? iconColor;

  PackageDetailsWidget({
    super.key,
    required this.title,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.icons.rightMark,
            color: iconColor,
          ),
          UIHelper.horizontalSpace(8.w),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextFontStyle.headline14w400c686868StyleRoboto.copyWith(
                fontWeight: FontWeight.w500, color: textColor, fontSize: 13),
          )
        ],
      ),
    );
  }
}

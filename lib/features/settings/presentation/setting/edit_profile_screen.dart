// ignore_for_file: must_be_immutable, deprecated_member_use

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jackelieson/common_widgets/custom_network_image.dart';
import 'package:jackelieson/common_widgets/image_picker.dart';
import 'package:jackelieson/common_widgets/my_custom_text_feild.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/settings/model/update_profile_response_model.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/all_routes.dart';
import 'package:jackelieson/helper/lodding_helper.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/api_acess.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen(
      {super.key, this.avatar, this.name, this.email, this.phone});
  final String? avatar;
  final String? name;
  final String? email;
  final String? phone;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _imageFileNotifier = ValueNotifier<XFile?>(null);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _nameController.text = widget.name ?? "";
    _emailController.text = widget.email ?? "demo@gmail.com";
    _phoneController.text = widget.phone ?? "12345678";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigationService.goBack;
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.c686868,
                          ),
                          UIHelper.horizontalSpace(5.w),
                          Text(
                            "Back",
                            style: TextFontStyle
                                .headline16w500cFEFFFFStyleRoboto
                                .copyWith(
                                    fontSize: 17.sp, color: AppColors.c686868),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(2.sp),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.c242760),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(2.sp),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.c242760),
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ValueListenableBuilder<XFile?>(
                              valueListenable: _imageFileNotifier,
                              builder: (context, imagePath, _) {
                                return ClipOval(
                                  child: imagePath != null
                                      ? Image.file(
                                          File(imagePath.path),
                                          width: 140.w,
                                          height: 140.h,
                                          fit: BoxFit.cover,
                                        )
                                      : CustomNetworkImageWidget(
                                          urls: widget.avatar ?? "",
                                          height: 140.h,
                                          width: 140.w,
                                        ),
                                );
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                log("message");
                                showPickImageBottomSheet(
                                    context, _imageFileNotifier);
                              },
                              child: SizedBox(
                                height: 40.h,
                                width: 40.w,
                                child: SvgPicture.asset(
                                    Assets.icons.cameraIconUpdoad),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await updateProfileRxRxObj
                            .updateProfile(
                              phone: _phoneController.text.trim(),
                              name: _nameController.text.trim(),
                              avatar: _imageFileNotifier.value,
                            )
                            .waitingForFuture()
                            .then((response) {
                          UpdateProfileResponseModel data = response;

                          if (data.code == 200) {
                            NavigationService.navigateTo(Routes.navigation);
                            
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: ShapeDecoration(
                          color: AppColors.c0070F0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                        ),
                        child: Text('Save',
                            style:
                                TextFontStyle.headline16w500cFEFFFFStyleRoboto),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpaceSmall,
                Container(
                  width: Get.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                        style: TextFontStyle.headline16w600c686868StyleRoboto,
                      ),
                      UIHelper.verticalSpace(8.h),
                      MyCustomTextFormField(
                        controller: _nameController,
                        // suffixIcon: Icons.edit_note_rounded,
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
                        'Phone Number',
                        style: TextFontStyle.headline16w600c686868StyleRoboto,
                      ),
                      UIHelper.verticalSpace(8.h),
                      // MyCustomTextFormField(
                      //   controller: _phoneController,
                      //   // suffixIcon: Icons.edit_note_rounded,
                      //   isPrefixIcon: false,
                      //   isBorder: true,
                      //   borderColor: AppColors.cE7E6E6,
                      //   hintText: "Enter Your Phone Number",
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'phone is required';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      IntlPhoneField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          // print(phone.completeNumber);
                        },
                        validator: (value) {
                          if (value == null || value.number.isEmpty) {
                            return 'Phone number is required';
                          }
                          String pattern = r"^\+?[0-9]{7,15}$";
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value.number)) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      UIHelper.verticalSpaceSmall,
                      Text(
                        'Email',
                        style: TextFontStyle.headline16w600c686868StyleRoboto,
                      ),
                      UIHelper.verticalSpaceSmall,
                      AbsorbPointer(
                        child: MyCustomTextFormField(
                          controller: _emailController,
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
                      ),
                      UIHelper.verticalSpaceMedium,
                    ],
                  ),
                ),
                UIHelper.verticalSpace(26.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

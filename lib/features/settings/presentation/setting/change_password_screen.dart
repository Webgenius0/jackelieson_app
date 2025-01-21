import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jackelieson/common_widgets/app_custom_buttom.dart';
import 'package:jackelieson/common_widgets/my_custom_text_feild.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/settings/model/change_pass_response_model.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/all_routes.dart';
import 'package:jackelieson/helper/lodding_helper.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/api_acess.dart';
import 'package:jackelieson/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _oldPassController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 20.h),
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Form(
                key: _formKey,
                child: Column(
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
                    UIHelper.verticalSpaceExtraLarge,
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        // height: 400.h,
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
                              'Old Password',
                              style: TextFontStyle
                                  .headline16w600c686868StyleRoboto,
                            ),
                            UIHelper.verticalSpace(8.h),
                            MyCustomTextFormField(
                              obscureText: provider.isObsecure,
                              suffixIcon: provider.isObsecure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              onSuffixIconTap: () {
                                provider.toggleObsecure();
                              },
                              controller: _oldPassController,
                              isPrefixIcon: false,
                              isBorder: true,
                              borderColor: AppColors.cE7E6E6,
                              hintText: "Enter Your old password",
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
                            UIHelper.verticalSpaceSmall,
                            Text(
                              'New Password',
                              style: TextFontStyle
                                  .headline16w600c686868StyleRoboto,
                            ),
                            UIHelper.verticalSpaceSmall,
                            MyCustomTextFormField(
                              controller: _passController,
                              isPrefixIcon: false,
                              obscureText: provider.isObsecure1,
                              suffixIcon: provider.isObsecure1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              onSuffixIconTap: () {
                                provider.toggleObsecure1();
                              },
                              isBorder: true,
                              borderColor: AppColors.cE7E6E6,
                              hintText: "Enter a new password",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }

                                if (_confirmPassController.text.trim() !=
                                    _passController.text.trim()) {
                                  return 'New Password and Confirm password must be same';
                                }

                                return null;
                              },
                            ),
                            UIHelper.verticalSpaceSmall,
                            Text(
                              'Confirm Password',
                              style: TextFontStyle
                                  .headline16w600c686868StyleRoboto,
                            ),
                            UIHelper.verticalSpaceSmall,
                            MyCustomTextFormField(
                              controller: _confirmPassController,
                              obscureText: provider.isObsecure2,
                              suffixIcon: provider.isObsecure2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              onSuffixIconTap: () {
                                provider.toggleObsecure2();
                              },
                              isPrefixIcon: true,
                              isBorder: true,
                              borderColor: AppColors.cE7E6E6,
                              hintText: "Confirm your password",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }

                                if (_confirmPassController.text.trim() !=
                                    _passController.text.trim()) {
                                  return 'New Password and Confirm password must be same';
                                }

                                return null;
                              },
                            ),
                            UIHelper.verticalSpaceSemiLarge,
                            AppCustomButtom(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await changePassRxRxObj
                                      .changePass(
                                        currentPass:
                                            _oldPassController.text.trim(),
                                        pass: _passController.text.trim(),
                                        passConfirm:
                                            _confirmPassController.text.trim(),
                                      )
                                      .waitingForFuture()
                                      .then((res) {
                                    ChangePassResponseModel data = res;
                                    if (data.success == true) {
                                      NavigationService.navigateTo(
                                          Routes.navigation);
                                    }
                                  });
                                }
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
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

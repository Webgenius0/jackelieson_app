import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jackelieson/common_widgets/app_custom_buttom.dart';
import 'package:jackelieson/common_widgets/custom_text_feild.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/auth/model/create_account_response_model.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/all_routes.dart';
import 'package:jackelieson/helper/lodding_helper.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../../networks/api_acess.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  _onSubmit({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    if (_formKey.currentState!.validate() && _phoneController.text.isNotEmpty) {
      await createAccountRxObj
          .createAccount(
            email: email,
            name: name,
            password: password,
            phone: phone,
          )
          .waitingForFuture()
          .then((response) {
        CreateAccountResponseModel data = response;

        if (data.success == true) {
          NavigationService.navigateToWithArgs(Routes.verificationScreen, {
            "email": data.data?.email,
            "isSignup": true,
          });
        }

        log("message =========== Done");
      });
    } else {
      ToastUtil.showShortToast("Phone Number Required");
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            left: 20.w,
            right: 20.w,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Account',
                        style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 24.sp,
                          color: AppColors.c222222,
                        ),
                      ),
                      Text(
                        'Sign up to get started',
                        style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 14.sp,
                          color: AppColors.c555555,
                        ),
                      ),
                      UIHelper.verticalSpace(50.h),
                      Text(
                        'Name',
                        style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 14.sp,
                          color: AppColors.c222222,
                        ),
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomTextFormField(
                        controller: _nameController,
                        isPrefixIcon: true,
                        fillColor: AppColors.cF7F7F7,
                        prefixImage: Assets.icons.userIcon,
                        hintText: 'Enter First and Last Name',
                        borderRadius: 4.r,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                      UIHelper.verticalSpace(24.h),
                      Text(
                        'Email Address',
                        style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 14.sp,
                          color: AppColors.c222222,
                        ),
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomTextFormField(
                        controller: _emailController,
                        isPrefixIcon: true,
                        fillColor: AppColors.cF7F7F7,
                        prefixImage: Assets.icons.mail,
                        hintText: 'Enter Email',
                        borderRadius: 4.r,
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
                      UIHelper.verticalSpace(24.h),
                      Text(
                        'Phone',
                        style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 14.sp,
                          color: AppColors.c222222,
                        ),
                      ),
                      UIHelper.verticalSpace(8.h),
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
                      Text(
                        'Password',
                        style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 14.sp,
                          color: AppColors.c222222,
                        ),
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomTextFormField(
                        controller: _passwordController,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 8.h,
                        ),
                        isPrefixIcon: true,
                        obscureText: provider.isObsecure,
                        fillColor: AppColors.cF7F7F7,
                        prefixImage: Assets.icons.lockPass,
                        hintText: 'Enter Password',
                        isBorder: false,
                        suffixIcon: provider.isObsecure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onSuffixIconTap: () {
                          provider.toggleObsecure();
                        },
                        borderRadius: 4.r,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                      ),
                      UIHelper.verticalSpace(60.h),
                      AppCustomButtom(
                        btnName: 'Sign up',
                        borderRadius: 8,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        bgColor: AppColors.allPrimaryColor,
                        textColor: AppColors.cFFFFFF,
                        onTap: () => _onSubmit(
                          context: context,
                          email: _emailController.text.trim(),
                          phone: _phoneController.text.trim(),
                          password: _passwordController.text.trim(),
                          name: _nameController.text.trim(),
                        ),
                      ),
                      UIHelper.verticalSpace(30.h),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'OR',
                          style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                              .copyWith(
                            fontSize: 18.sp,
                            color: AppColors.c222222,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(8.h),
                      Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50.r,
                          ),
                          border: Border.all(
                            color: AppColors.c000000,
                            width: 0.2.w,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.icons.google,
                            ),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              'Sign up with Google',
                              style: TextFontStyle
                                  .headline14w400cFEFFFFStyleRoboto
                                  .copyWith(
                                fontSize: 16.sp,
                                color: AppColors.c222222,
                              ),
                            )
                          ],
                        ),
                      ),
                      UIHelper.verticalSpace(24.h),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            NavigationService.navigateTo(
                              Routes.loginScreen,
                            );
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account?',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 16.12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Login',
                                  style: TextStyle(
                                    color: Color(0xFF1C58E1),
                                    fontSize: 16.12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(24.h),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

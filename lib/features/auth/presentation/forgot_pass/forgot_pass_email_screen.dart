import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/common_widgets/app_custom_buttom.dart';
import 'package:jackelieson/common_widgets/custom_text_feild.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_email_response_model.dart';
import 'package:jackelieson/gen/assets.gen.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/all_routes.dart';
import 'package:jackelieson/helper/lodding_helper.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/api_acess.dart';
import 'package:jackelieson/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final TextEditingController _newPssController = TextEditingController();
  // final TextEditingController _confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _newPssController.dispose();
    // _confirmPassController.dispose();
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
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextFontStyle.headline18w600cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 24.sp,
                          color: AppColors.c222222,
                        ),
                      ),
                      Text(
                        ' Enter your email address below and we will send you a code to reset password. ',
                        style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                            .copyWith(

                              
                          fontSize: 14.sp,
                          color: AppColors.c555555,
                        ),
                      ),
                      UIHelper.verticalSpace(70.h),
                      Text(
                        'Email',
                        style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                            .copyWith(
                          fontSize: 14.sp,
                          color: AppColors.c222222,
                        ),
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomTextFormField(
                        controller: _newPssController,
                        isPrefixIcon: true,
                        fillColor: AppColors.cF7F7F7,
                        prefixImage: Assets.icons.mail,
                        hintText: 'Enter New password',
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
                      UIHelper.verticalSpace(80.h),
                      AppCustomButtom(
                        btnName: 'Confirm Email',
                        borderRadius: 10.r,
                        isBorder: false,
                        bgColor: AppColors.allPrimaryColor,
                        borderColor: AppColors.allPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        textColor: AppColors.cFFFFFF,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await forgotPasswordEmailRxObj
                                .forgotPassEmail(
                                  email: _newPssController.text.trim(),
                                )
                                .waitingForFuture()
                                .then((response) {
                              ForgotPassEmailResponseModel data = response;
                              if (data.code == 200) {
                                NavigationService.navigateToWithArgs(
                                    Routes.verificationScreen, {
                                  "email": _newPssController.text.trim(),
                                  "isSignup": false,
                                });
                              }
                            });
                          }
                          // NavigationService.navigateTo(
                          //   Routes.loginScreen,
                          // );
                        },
                      ),
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

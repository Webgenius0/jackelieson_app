import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/common_widgets/app_custom_buttom.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_otp_response_model.dart';
import 'package:jackelieson/features/auth/model/otp_verify_response_model.dart';
import 'package:jackelieson/gen/colors.gen.dart';
import 'package:jackelieson/helper/all_routes.dart';
import 'package:jackelieson/helper/lodding_helper.dart';
import 'package:jackelieson/helper/navigation_service.dart';
import 'package:jackelieson/helper/ui_helpers.dart';
import 'package:jackelieson/networks/api_acess.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen(
      {super.key, required this.email, required this.isSignup});

  final String email;
  final bool isSignup;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _verificationCodeController = TextEditingController();
  // String currentText = "";
  @override
  void dispose() {
    _verificationCodeController.clear(); // Clear the controller
    // _verificationCodeController.dispose(); // Then dispose of it
    super.dispose();
  }

  _onVerifySubmit(
      {required BuildContext context,
      required String email,
      required String otp}) async {
    await createAccountOtpVerifyRxObj
        .otpVerify(email: email, otp: otp)
        .waitingForFuture()
        .then(
      (response) {
        OtpVerifyResponseModel data = response;
        if (data.code == 200) NavigationService.navigateTo(Routes.loginScreen);
      },
    );
  }

  _onForgotPassVerifySubmit(
      {required BuildContext context,
      required String email,
      required String otp}) async {
    await forgotPasswordOtpRxObj
        .forgotPassOtp(email: email, otp: otp)
        .waitingForFuture()
        .then((response) {
      ForgotPassOtpResponseModel data = response;
      if (data.code == 200) NavigationService.navigateToWithArgs(Routes.forgotPasswordScreen,{"email" : widget.email});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 80.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Verification',
                  style:
                      TextFontStyle.headline18w600cFEFFFFStyleRoboto.copyWith(
                    fontSize: 24.sp,
                    color: AppColors.c222222,
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                Text(
                  '4 digit pin have been sent to your number. Enter the code below to continue.',
                  textAlign: TextAlign.center,
                  style:
                      TextFontStyle.headline18w600cFEFFFFStyleRoboto.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.c686868,
                  ),
                ),
                UIHelper.verticalSpace(40.h),
                PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  separatorBuilder: (context, index) =>
                      UIHelper.horizontalSpace(15.w),
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: Colors.grey.withOpacity(
                      0.5,
                    ),
                    inactiveColor: Colors.grey.withOpacity(
                      0.5,
                    ),
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: _verificationCodeController,
                  onCompleted: (v) {
                    // print("Completed");
                  },
                  onChanged: (value) {
                    // print(value);
                    // setState(() {
                    //   // currentText = value;
                    // });
                  },
                  beforeTextPaste: (text) {
                    // print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
                UIHelper.verticalSpace(40.h),
                AppCustomButtom(
                  onTap: () {
                    // NavigationService.navigateTo(Routes.uploadProfilePicScreen);
                    widget.isSignup
                        ? _onVerifySubmit(
                            context: context,
                            email: widget.email,
                            otp: _verificationCodeController.text.trim())
                        : _onForgotPassVerifySubmit(
                            context: context,
                            email: widget.email,
                            otp: _verificationCodeController.text.trim());
                  },
                  btnName: 'Verify',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  borderRadius: 8,
                  bgColor: AppColors.allPrimaryColor,
                ),
                UIHelper.verticalSpace(16.h),
                GestureDetector(
                  onTap: () async {
                    widget.isSignup
                        ? await resendOtpRxObj
                            .resendOtp(email: widget.email)
                            .waitingForFuture()
                        : forgotPasswordOtpResendRxObj
                            .forgotOtpResend(email: widget.email)
                            .waitingForFuture();
                  },
                  child: Text(
                    'Resend Code?',
                    style:
                        TextFontStyle.headline14w400cFEFFFFStyleRoboto.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.allPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

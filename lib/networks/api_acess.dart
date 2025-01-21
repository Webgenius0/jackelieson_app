import 'package:jackelieson/features/auth/data/create_account_rx/rx.dart';
import 'package:jackelieson/features/auth/data/forgot_otp/rx.dart';
import 'package:jackelieson/features/auth/data/forgot_otp_resend/rx.dart';
import 'package:jackelieson/features/auth/data/forgot_pass/rx.dart';
import 'package:jackelieson/features/auth/data/forgot_pass_email/rx.dart';
import 'package:jackelieson/features/auth/data/login_rx/login_rx.dart';
import 'package:jackelieson/features/auth/data/otp_varify/rx.dart';
import 'package:jackelieson/features/auth/data/resend_otp/rx.dart';
import 'package:jackelieson/features/auth/model/create_account_response_model.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_email_response_model.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_otp_response_model.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_resend_response_model.dart';
import 'package:jackelieson/features/auth/model/forgot_password_response_model.dart';
import 'package:jackelieson/features/auth/model/login_response_model.dart';
import 'package:jackelieson/features/auth/model/otp_verify_response_model.dart';
import 'package:jackelieson/features/auth/model/resend_otp_response_model.dart';
import 'package:jackelieson/features/settings/data/change_pass/rx.dart';
import 'package:jackelieson/features/settings/data/get_profile/rx.dart';
import 'package:jackelieson/features/settings/data/logout/rx.dart';
import 'package:jackelieson/features/settings/data/update_profile/rx.dart';
import 'package:jackelieson/features/settings/model/change_pass_response_model.dart';
import 'package:jackelieson/features/settings/model/get_profile_response_model.dart';
import 'package:jackelieson/features/settings/model/setting_response_model.dart';
import 'package:jackelieson/features/settings/model/update_profile_response_model.dart';
import 'package:rxdart/subjects.dart';

LoginRx loginRxObj = LoginRx(
    empty: LoginResponseModel(),
    dataFetcher: BehaviorSubject<LoginResponseModel>());

CreateAccountRx createAccountRxObj = CreateAccountRx(
    empty: CreateAccountResponseModel(),
    dataFetcher: BehaviorSubject<CreateAccountResponseModel>());

CreateAccountOtpVerifyRx createAccountOtpVerifyRxObj = CreateAccountOtpVerifyRx(
    empty: OtpVerifyResponseModel(),
    dataFetcher: BehaviorSubject<OtpVerifyResponseModel>());

ResendOtpRx resendOtpRxObj = ResendOtpRx(
    empty: ResendOtpResponseModel(),
    dataFetcher: BehaviorSubject<ResendOtpResponseModel>());

ForgotPasswordEmailRx forgotPasswordEmailRxObj = ForgotPasswordEmailRx(
    empty: ForgotPassEmailResponseModel(),
    dataFetcher: BehaviorSubject<ForgotPassEmailResponseModel>());

ForgotPasswordOtpRx forgotPasswordOtpRxObj = ForgotPasswordOtpRx(
    empty: ForgotPassOtpResponseModel(),
    dataFetcher: BehaviorSubject<ForgotPassOtpResponseModel>());

ForgotPasswordOtpResendRx forgotPasswordOtpResendRxObj =
    ForgotPasswordOtpResendRx(
        empty: ForgotPasswordOtpResendResponseModel(),
        dataFetcher: BehaviorSubject<ForgotPasswordOtpResendResponseModel>());

ForgotPassRx forgotPasswordRxObj = ForgotPassRx(
    empty: ForgotPasswordResponseModel(),
    dataFetcher: BehaviorSubject<ForgotPasswordResponseModel>());

LogoutRx logoutRxObj = LogoutRx(
    empty: LogoutResponseModel(),
    dataFetcher: BehaviorSubject<LogoutResponseModel>());

GetProfileRx getProfileRxObj = GetProfileRx(
    empty: GetProfileResponseModel(),
    dataFetcher: BehaviorSubject<GetProfileResponseModel>());

UpdateProfileRx updateProfileRxRxObj = UpdateProfileRx(
    empty: UpdateProfileResponseModel(),
    dataFetcher: BehaviorSubject<UpdateProfileResponseModel>());

ChangePassRx changePassRxRxObj = ChangePassRx(
    empty: ChangePassResponseModel(),
    dataFetcher: BehaviorSubject<ChangePassResponseModel>());

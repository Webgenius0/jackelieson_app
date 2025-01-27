import 'package:jackelieson/features/auth/data/create_account_rx/rx.dart';
import 'package:jackelieson/features/auth/data/forgot_otp/rx.dart';
import 'package:jackelieson/features/auth/data/forgot_otp_resend/rx.dart';
import 'package:jackelieson/features/auth/data/forgot_pass/rx.dart';
import 'package:jackelieson/features/auth/data/forgot_pass_email/rx.dart';
import 'package:jackelieson/features/auth/data/get_all_habbit/rx.dart';
import 'package:jackelieson/features/auth/data/login_rx/login_rx.dart';
import 'package:jackelieson/features/auth/data/otp_varify/rx.dart';
import 'package:jackelieson/features/auth/data/resend_otp/rx.dart';
import 'package:jackelieson/features/auth/data/set_profile/rx.dart';
import 'package:jackelieson/features/auth/model/all_habbit_response_model.dart';
import 'package:jackelieson/features/auth/model/create_account_response_model.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_email_response_model.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_otp_response_model.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_resend_response_model.dart';
import 'package:jackelieson/features/auth/model/forgot_password_response_model.dart';
import 'package:jackelieson/features/auth/model/login_response_model.dart';
import 'package:jackelieson/features/auth/model/otp_verify_response_model.dart';
import 'package:jackelieson/features/auth/model/resend_otp_response_model.dart';
import 'package:jackelieson/features/auth/model/set_profile_image_response_model.dart';
import 'package:jackelieson/features/calendar/data/create_event/rx.dart';
import 'package:jackelieson/features/calendar/data/get_event/rx.dart';
import 'package:jackelieson/features/calendar/model/create_event_response_model.dart';
import 'package:jackelieson/features/calendar/model/get_event_response_model.dart';
import 'package:jackelieson/features/habits/data/create_habbit/rx.dart';
import 'package:jackelieson/features/habits/data/get_habbits/rx.dart';
import 'package:jackelieson/features/habits/data/habbit_details/rx.dart';
import 'package:jackelieson/features/habits/data/habbit_history/rx.dart';
import 'package:jackelieson/features/habits/data/habbit_status/rx.dart';
import 'package:jackelieson/features/habits/model/create_habbit_response_model.dart';
import 'package:jackelieson/features/habits/model/get_habbit_response_model.dart';
import 'package:jackelieson/features/habits/model/habbit_details_response_model.dart';
import 'package:jackelieson/features/habits/model/habbit_history_response_model.dart';
import 'package:jackelieson/features/habits/model/habbit_status_response_model.dart';
import 'package:jackelieson/features/settings/data/change_pass/rx.dart';
import 'package:jackelieson/features/settings/data/get_profile/rx.dart';
import 'package:jackelieson/features/settings/data/logout/rx.dart';
import 'package:jackelieson/features/settings/data/update_profile/rx.dart';
import 'package:jackelieson/features/settings/model/change_pass_response_model.dart';
import 'package:jackelieson/features/settings/model/get_profile_response_model.dart';
import 'package:jackelieson/features/settings/model/setting_response_model.dart';
import 'package:jackelieson/features/settings/model/update_profile_response_model.dart';
import 'package:jackelieson/features/tasks/data/create_task/rx.dart';
import 'package:jackelieson/features/tasks/data/delete%20Task/rx.dart';
import 'package:jackelieson/features/tasks/data/edit_task/rx.dart';
import 'package:jackelieson/features/tasks/data/get_all_task/rx.dart';
import 'package:jackelieson/features/tasks/model/delete_task_response_model.dart';
import 'package:jackelieson/features/tasks/model/edit_task_response_model.dart';
import 'package:jackelieson/features/tasks/model/get_all_task_response_model.dart';
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

SetProfileImageRx setProfileImageRxRxObj = SetProfileImageRx(
    empty: SetProfileImageResponseModel(),
    dataFetcher: BehaviorSubject<SetProfileImageResponseModel>());

AllHabbitRx allHabbitRxObj = AllHabbitRx(
    empty: AllHabbitResponseModel(),
    dataFetcher: BehaviorSubject<AllHabbitResponseModel>());

AllTaskRx allTaskRxObj = AllTaskRx(
    empty: AllTaskResponseModel(),
    dataFetcher: BehaviorSubject<AllTaskResponseModel>());

EditTaskRx editTaskRxObj = EditTaskRx(
    empty: EditTaskResponseModel(),
    dataFetcher: BehaviorSubject<EditTaskResponseModel>());

CreateTaskRx createTaskRxObj = CreateTaskRx(
    empty: EditTaskResponseModel(),
    dataFetcher: BehaviorSubject<EditTaskResponseModel>());

DeleteTaskRx deleteTaskRxObj = DeleteTaskRx(
    empty: DeleteTaskResponseModel(),
    dataFetcher: BehaviorSubject<DeleteTaskResponseModel>());

CreateHabbitRx createHabbitRxObj = CreateHabbitRx(
    empty: CreateHabbitResponseModel(),
    dataFetcher: BehaviorSubject<CreateHabbitResponseModel>());

GetHabbitRx getHabbitRxObj = GetHabbitRx(
    empty: GetHabbitResponseModel(),
    dataFetcher: BehaviorSubject<GetHabbitResponseModel>());

CreateEventRx createEventRxObj = CreateEventRx(
    empty: CreateEventResponseModel(),
    dataFetcher: BehaviorSubject<CreateEventResponseModel>());

GetEventRx getEventRxObj = GetEventRx(
    empty: GetEventResponseModel(),
    dataFetcher: BehaviorSubject<GetEventResponseModel>());

HabbitDetailsRx habbitDetailsRxObj = HabbitDetailsRx(
    empty: HabbitDetailsResponseModel(),
    dataFetcher: BehaviorSubject<HabbitDetailsResponseModel>());

HabbitStatusRx habbitStatusRxObj = HabbitStatusRx(
    empty: HabbitStatusResponseModel(),
    dataFetcher: BehaviorSubject<HabbitStatusResponseModel>());

HabbitHistoryRx habbitHistoryRxObj = HabbitHistoryRx(
    empty: HabbitHistoryResponseModel(),
    dataFetcher: BehaviorSubject<HabbitHistoryResponseModel>());

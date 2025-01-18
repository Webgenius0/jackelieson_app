import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/data/forgot_otp_resend/api.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_resend_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class ForgotPasswordOtpResendRx
    extends RxResponseInt<ForgotPasswordOtpResendResponseModel> {
  final api = ForgotPasswordOtpResendApi.instance;

  ForgotPasswordOtpResendRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<ForgotPasswordOtpResendResponseModel> forgotOtpResend({
    required String email,
  }) async {
    try {
      ForgotPasswordOtpResendResponseModel data =
          await api.forgotOtpResend(email: email);
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    ForgotPasswordOtpResendResponseModel response = data;
    String? message = response.message;

    ToastUtil.showShortToast('$message ✔');

    return response;
  }

  @override
  handleErrorWithReturn(error) {
    ForgotPasswordOtpResendResponseModel errorResponse =
        ForgotPasswordOtpResendResponseModel();
    if (error is DioException) {
      if (error.response != null && error.response!.statusCode == 422) {
        final errorData = error.response!.data;
        final errorMessage =
            errorData['message'] ?? "An unknown error occurred";
        ToastUtil.showLongToast(errorMessage);
      } else if (error.response!.statusCode == 404) {
        final errorData = error.response!.data;
        final errorMessage =
            errorData['message'] ?? "An unknown error occurred";

        ToastUtil.showLongToast(errorMessage);
      } else {
        final errorData = error.response!.data;
        final errorMessage =
            errorData['message'] ?? "An unknown error occurred";
        ToastUtil.showLongToast(errorMessage);
      }
    } else {
      // log("Error ====> $error");
    }

    dataFetcher.sink.addError(error);
    return errorResponse;
  }
}

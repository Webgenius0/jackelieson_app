import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/data/resend_otp/api.dart';
import 'package:jackelieson/features/auth/model/resend_otp_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class ResendOtpRx extends RxResponseInt<ResendOtpResponseModel> {
  final api = ResendOtpApi.instance;

  ResendOtpRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<ResendOtpResponseModel> resendOtp({
    required String email,
  }) async {
    try {
      ResendOtpResponseModel data = await api.resendOtp(email: email);
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    ResendOtpResponseModel response = data;
    String? message = response.message;

    ToastUtil.showShortToast('$message ✔');

    return response;
  }

  @override
  handleErrorWithReturn(error) {
    ResendOtpResponseModel errorResponse = ResendOtpResponseModel();
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

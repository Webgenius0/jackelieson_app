import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/data/otp_varify/api.dart';
import 'package:jackelieson/features/auth/model/otp_verify_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class CreateAccountOtpVerifyRx
    extends RxResponseInt<OtpVerifyResponseModel> {
  final api = CreateAccountOtpVerifyApi.instance;

  CreateAccountOtpVerifyRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<OtpVerifyResponseModel> otpVerify({
    required String email,
    required String otp,
  }) async {
    try {
      OtpVerifyResponseModel data = await api.otpVerify(email: email, otp: otp);
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    OtpVerifyResponseModel response = data;
    String? message = response.message;

    ToastUtil.showShortToast('$message ✔');

    return response;
  }

  @override
  handleErrorWithReturn(error) {
    OtpVerifyResponseModel errorResponse = OtpVerifyResponseModel();
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

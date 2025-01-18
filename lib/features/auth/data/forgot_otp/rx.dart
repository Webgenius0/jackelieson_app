import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/data/forgot_otp/api.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_otp_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class ForgotPasswordOtpRx
    extends RxResponseInt<ForgotPassOtpResponseModel> {
  final api = ForgotPasswordOtpApi.instance;

  ForgotPasswordOtpRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<ForgotPassOtpResponseModel> forgotPassOtp({
    required String email,
    required String otp,
  }) async {
    try {
      ForgotPassOtpResponseModel data = await api.forgotPassOtp(
        email: email,
        otp: otp,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log('message');
    ForgotPassOtpResponseModel response = data;
    // String? name = response.data?.name;
    // String? email = response.data?.email;

    // await appData.write(kKeyFullName, name);
    // await appData.write(kKeyUserEmail, email);
    // await appData.write(kKeyIsLoggedIn, true);
    // ToastUtil.showShortToast('Login Success ✔');
    return response;
  }

  @override
  handleErrorWithReturn(error) {
    ForgotPassOtpResponseModel errorResponse = ForgotPassOtpResponseModel();
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

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/data/forgot_pass/api.dart';
import 'package:jackelieson/features/auth/model/forgot_password_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class ForgotPassRx extends RxResponseInt<ForgotPasswordResponseModel> {
  final api = ForgotPassApi.instance;

  ForgotPassRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<ForgotPasswordResponseModel> forgotPass({
    required String email,
    required String password,
    required String confirmPass,
  }) async {
    try {
      ForgotPasswordResponseModel data = await api.forgotPass(
        email: email,
        password: password,
        confirmPass: confirmPass,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log('message');
    ForgotPasswordResponseModel response = data;
    // String? accessToken = response.data?.token;
    // String? name = response.data?.name;
    // String? email = response.data?.email;
    // await appData.write(kKeyAccessToken, accessToken);
    // await appData.write(kKeyFullName, name);
    // await appData.write(kKeyUserEmail, email);
    // await appData.write(kKeyIsLoggedIn, true);
    // DioSingleton.instance.update(accessToken);
    // ToastUtil.showShortToast('Login Success ✔');
    return response;
  }

  @override
  handleErrorWithReturn(error) {
    ForgotPasswordResponseModel errorResponse = ForgotPasswordResponseModel();
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

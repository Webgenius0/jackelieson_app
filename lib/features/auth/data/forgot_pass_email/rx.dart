import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jackelieson/constant/app_constants.dart';
import 'package:jackelieson/features/auth/data/forgot_pass_email/api.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_email_response_model.dart';
import 'package:jackelieson/helper/di.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class ForgotPasswordEmailRx
    extends RxResponseInt<ForgotPassEmailResponseModel> {
  final api = ForgotPasswordEmailApi.instance;

  ForgotPasswordEmailRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<ForgotPassEmailResponseModel> forgotPassEmail({
    required String email,
  }) async {
    try {
      ForgotPassEmailResponseModel data = await api.forgotPassEmail(
        email: email,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log('message');
    ForgotPassEmailResponseModel response = data;
    String? name = response.data?.name;
    String? email = response.data?.email;

    await appData.write(kKeyFullName, name);
    await appData.write(kKeyUserEmail, email);
    await appData.write(kKeyIsLoggedIn, true);
    ToastUtil.showShortToast('Login Success ✔');
    return response;
  }

  @override
  handleErrorWithReturn(error) {
    ForgotPassEmailResponseModel errorResponse = ForgotPassEmailResponseModel();
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

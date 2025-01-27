import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jackelieson/constant/app_constants.dart';
import 'package:jackelieson/features/auth/data/login_rx/login_api.dart';
import 'package:jackelieson/features/auth/model/login_response_model.dart';
import 'package:jackelieson/helper/di.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

import '../../../../networks/dio/dio.dart';

final class LoginRx extends RxResponseInt<LoginResponseModel> {
  final api = LoginApi.instance;

  LoginRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      LoginResponseModel data = await api.login(
        email: email,
        password: password,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log('message');
    LoginResponseModel response = data;
    String? accessToken = response.data?.token;
    String? name = response.data?.name;
    String? email = response.data?.email;
    await appData.write(kKeyAccessToken, accessToken);
    await appData.write(kKeyFullName, name);
    await appData.write(kKeyUserEmail, email);
    await appData.write(kKeyIsLoggedIn, true);
    await appData.write("kkavatar", response.data?.avatar);
    DioSingleton.instance.update(accessToken!);
    ToastUtil.showShortToast('Login Success ✔');
    return response;
  }

  @override
  handleErrorWithReturn(error) {
    LoginResponseModel errorResponse = LoginResponseModel();
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

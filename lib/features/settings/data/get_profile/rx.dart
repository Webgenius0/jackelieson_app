import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jackelieson/features/settings/data/get_profile/api.dart';
import 'package:jackelieson/features/settings/model/get_profile_response_model.dart';
import 'package:jackelieson/helper/di.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class GetProfileRx extends RxResponseInt<GetProfileResponseModel> {
  final api = GetProfileApi.instance;

  GetProfileRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<GetProfileResponseModel> getProfile() async {
    try {
      GetProfileResponseModel data = await api.getProfile();
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log('message');
    GetProfileResponseModel response = data;

    await appData.write("kkavatar", response.data?.avatar);
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
    GetProfileResponseModel errorResponse = GetProfileResponseModel();
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

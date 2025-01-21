import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jackelieson/features/settings/data/update_profile/api.dart';
import 'package:jackelieson/features/settings/model/update_profile_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class UpdateProfileRx extends RxResponseInt<UpdateProfileResponseModel> {
  final api = UpdateProfileApi.instance;

  UpdateProfileRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<UpdateProfileResponseModel> updateProfile({
    required String phone,
    required String name,
    required XFile? avatar,
  }) async {
    try {
      UpdateProfileResponseModel data = await api.updateProfile(
        phone: phone,
        name: name,
        avatar: avatar,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log('message');
    UpdateProfileResponseModel response = data;
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
    UpdateProfileResponseModel errorResponse = UpdateProfileResponseModel();
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

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jackelieson/features/auth/data/set_profile/api.dart';
import 'package:jackelieson/features/auth/model/set_profile_image_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class SetProfileImageRx
    extends RxResponseInt<SetProfileImageResponseModel> {
  final api = SetProfileImageApi.instance;

  SetProfileImageRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<SetProfileImageResponseModel> setProfle({
    XFile? image,
  }) async {
    try {
      SetProfileImageResponseModel data = await api.setProfle(
        image: image,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log('message');
    SetProfileImageResponseModel response = data;

    ToastUtil.showShortToast('${data.message} ✔');
    return response;
  }

  @override
  handleErrorWithReturn(error) {
    SetProfileImageResponseModel errorResponse = SetProfileImageResponseModel();
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

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jackelieson/features/habits/data/habbit_status/api.dart';
import 'package:jackelieson/features/habits/model/habbit_status_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class HabbitStatusRx extends RxResponseInt<HabbitStatusResponseModel> {
  final api = HabbitStatusApi.instance;

  HabbitStatusRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<HabbitStatusResponseModel> habbitStatus({
    required String status,
    required dynamic id,
  }) async {
    try {
      HabbitStatusResponseModel data =
          await api.habbitStatus(id: id, status: status);
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log('message 1234567898');
    HabbitStatusResponseModel response = data;

    return response;
  }

  @override
  handleErrorWithReturn(error) {
    HabbitStatusResponseModel errorResponse = HabbitStatusResponseModel();
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

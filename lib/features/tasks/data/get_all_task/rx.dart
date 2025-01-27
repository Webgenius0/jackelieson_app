import 'package:dio/dio.dart';
import 'package:jackelieson/features/tasks/data/get_all_task/api.dart';
import 'package:jackelieson/features/tasks/model/get_all_task_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class AllTaskRx extends RxResponseInt<AllTaskResponseModel> {
  final api = AllTaskApi.instance;

  AllTaskRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<AllTaskResponseModel> getAllTask({required String month}) async {
    try {
      AllTaskResponseModel data = await api.getAllTask(month: month);
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  // @override
  // handleSuccessWithReturn(data) async {
  //   log('message 1234567898');
  //   AllTaskResponseModel response = data;

  //   return response;
  // }

  @override
  handleErrorWithReturn(error) {
    AllTaskResponseModel errorResponse = AllTaskResponseModel();
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

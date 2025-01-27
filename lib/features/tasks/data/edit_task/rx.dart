import 'package:dio/dio.dart';
import 'package:jackelieson/features/tasks/data/edit_task/api.dart';
import 'package:jackelieson/features/tasks/model/edit_task_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class EditTaskRx extends RxResponseInt<EditTaskResponseModel> {
  final api = EditTaskApi.instance;

  EditTaskRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<EditTaskResponseModel> editTask({
    required dynamic id,
    required String title,
    required String date,
    required String startTime,
    required dynamic color,
  }) async {
    try {
      EditTaskResponseModel data = await api.editTask(
        id: id,
        color: color,
        date: date,
        startTime: startTime,
        title: title,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  // @override
  // handleSuccessWithReturn(data) async {
  //   log('message 1234567898');
  //   EditTaskResponseModel response = data;
  //   return response;
  // }

  @override
  handleErrorWithReturn(error) {
    EditTaskResponseModel errorResponse = EditTaskResponseModel();
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

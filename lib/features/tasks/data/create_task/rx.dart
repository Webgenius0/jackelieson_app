import 'package:dio/dio.dart';
import 'package:jackelieson/features/tasks/data/create_task/api.dart';
import 'package:jackelieson/features/tasks/model/edit_task_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class CreateTaskRx extends RxResponseInt<EditTaskResponseModel> {
  final api = CreateTaskApi.instance;

  CreateTaskRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<EditTaskResponseModel> createTask({
    required String title,
    required String date,
    required String startTime,
    required dynamic color,
  }) async {
    try {
      EditTaskResponseModel data = await api.createTask(
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
  //   CreateTaskResponseModel response = data;

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

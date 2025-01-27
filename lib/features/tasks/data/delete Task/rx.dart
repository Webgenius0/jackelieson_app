import 'package:dio/dio.dart';
import 'package:jackelieson/features/tasks/data/delete%20Task/api.dart';
import 'package:jackelieson/features/tasks/model/delete_task_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class DeleteTaskRx extends RxResponseInt<DeleteTaskResponseModel> {
  final api = DeleteTaskApi.instance;

  DeleteTaskRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<DeleteTaskResponseModel> deleteTask({
    required dynamic id,
  }) async {
    try {
      DeleteTaskResponseModel data = await api.deleteTask(
        id: id,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  // @override
  // handleSuccessWithReturn(data) async {
  //   log('message 1234567898');
  //   DeleteTaskResponseModel response = data;

  //   return response;
  // }

  @override
  handleErrorWithReturn(error) {
    DeleteTaskResponseModel errorResponse = DeleteTaskResponseModel();
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

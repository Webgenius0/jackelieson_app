import 'package:jackelieson/features/habits/data/habbit_history/api.dart';
import 'package:jackelieson/features/habits/model/habbit_history_response_model.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class HabbitHistoryRx extends RxResponseInt<HabbitHistoryResponseModel> {
  final api = HabbitHistoryApi.instance;

  HabbitHistoryRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<HabbitHistoryResponseModel> habbitHistory({required dynamic id}) async {
    try {
      HabbitHistoryResponseModel data = await api.habbitHistory(id: id);
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  // @override
  // handleSuccessWithReturn(data) async {
  //   log('message 1234567898');
  //   HabbitHistoryResponseModel response = data;

  //   return response;
  // }

  // @override
  // handleErrorWithReturn(error) {
  //   HabbitHistoryResponseModel errorResponse = HabbitHistoryResponseModel();
  //   if (error is DioException) {
  //     if (error.response != null && error.response!.statusCode == 422) {
  //       final errorData = error.response!.data;
  //       final errorMessage =
  //           errorData['message'] ?? "An unknown error occurred";
  //       ToastUtil.showLongToast(errorMessage);
  //     } else if (error.response!.statusCode == 404) {
  //       final errorData = error.response!.data;
  //       final errorMessage =
  //           errorData['message'] ?? "An unknown error occurred";

  //       ToastUtil.showLongToast(errorMessage);
  //     } else {
  //       final errorData = error.response!.data;
  //       final errorMessage =
  //           errorData['message'] ?? "An unknown error occurred";
  //       ToastUtil.showLongToast(errorMessage);
  //     }
  //   } else {
  //     // log("Error ====> $error");
  //   }

  //   dataFetcher.sink.addError(error);
  //   return errorResponse;
  // }
}

import 'package:dio/dio.dart';
import 'package:jackelieson/features/calendar/data/get_event/api.dart';
import 'package:jackelieson/features/calendar/model/get_event_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class GetEventRx extends RxResponseInt<GetEventResponseModel> {
  final api = GetEventApi.instance;

  GetEventRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<GetEventResponseModel> getEvent() async {
    try {
      GetEventResponseModel data = await api.getEvent();
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  // @override
  // handleSuccessWithReturn(data) async {
  //   log('message 1234567898');
  //   GetEventResponseModel response = data;

  //   return response;
  // }

  @override
  handleErrorWithReturn(error) {
    GetEventResponseModel errorResponse = GetEventResponseModel();
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

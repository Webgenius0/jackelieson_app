import 'package:dio/dio.dart';
import 'package:jackelieson/features/calendar/data/create_event/api.dart';
import 'package:jackelieson/features/calendar/model/create_event_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class CreateEventRx extends RxResponseInt<CreateEventResponseModel> {
  final api = CreateEventApi.instance;

  CreateEventRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<CreateEventResponseModel> createHabbit({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required String color,
  }) async {
    try {
      CreateEventResponseModel data = await api.createEvent(
        color: color,
        date: date,
        endTime: endTime,
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
  //   CreateEventResponseModel response = data;

  //   return response;
  // }

  @override
  handleErrorWithReturn(error) {
    CreateEventResponseModel errorResponse = CreateEventResponseModel();
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

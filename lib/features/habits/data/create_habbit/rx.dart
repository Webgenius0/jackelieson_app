import 'package:dio/dio.dart';
import 'package:jackelieson/features/habits/data/create_habbit/api.dart';
import 'package:jackelieson/features/habits/model/create_habbit_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class CreateHabbitRx extends RxResponseInt<CreateHabbitResponseModel> {
  final api = CreateHabbitApi.instance;

  CreateHabbitRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<CreateHabbitResponseModel> createHabbit({
    required List habbitID,
    required String habbitName,
    required bool isReminder,
    required bool days,
    List? dayList,
  }) async {
    try {
      CreateHabbitResponseModel data = await api.createHabbit(
        days: days,
        habbitID: habbitID,
        habbitName: habbitName,
        isReminder: isReminder,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  // @override
  // handleSuccessWithReturn(data) async {
  //   log('message 1234567898');
  //   CreateHabbitResponseModel response = data;

  //   return response;
  // }

  @override
  handleErrorWithReturn(error) {
    CreateHabbitResponseModel errorResponse = CreateHabbitResponseModel();
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

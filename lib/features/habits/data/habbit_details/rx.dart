import 'package:dio/dio.dart';
import 'package:jackelieson/features/habits/data/habbit_details/api.dart';
import 'package:jackelieson/features/habits/model/habbit_details_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class HabbitDetailsRx extends RxResponseInt<HabbitDetailsResponseModel> {
  final api = HabbitDetailsApi.instance;

  HabbitDetailsRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<HabbitDetailsResponseModel> habbitDetails({required dynamic id}) async {
    try {
      HabbitDetailsResponseModel data = await api.habbitDetails(id: id);
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  // @override
  // handleSuccessWithReturn(data) async {
  //   log('message 1234567898');
  //   HabbitDetailsResponseModel response = data;

  //   return response;
  // }

  @override
  handleErrorWithReturn(error) {
    HabbitDetailsResponseModel errorResponse = HabbitDetailsResponseModel();
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

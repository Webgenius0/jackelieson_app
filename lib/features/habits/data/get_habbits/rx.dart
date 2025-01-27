import 'package:jackelieson/features/habits/data/get_habbits/api.dart';
import 'package:jackelieson/features/habits/model/get_habbit_response_model.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class GetHabbitRx extends RxResponseInt<GetHabbitResponseModel> {
  final api = GetHabbitApi.instance;

  GetHabbitRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<GetHabbitResponseModel> getAllTask({required String day}) async {
    try {
      GetHabbitResponseModel data = await api.getHabbit(day: day);
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  // @override
  // handleSuccessWithReturn(data) async {
  //   log('message 1234567898');
  //   GetHabbitResponseModel response = data;

  //   return response;
  // }

  // @override
  // handleErrorWithReturn(error) {
  //   GetHabbitResponseModel errorResponse = GetHabbitResponseModel();
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

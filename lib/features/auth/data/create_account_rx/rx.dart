import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/data/create_account_rx/api.dart';
import 'package:jackelieson/features/auth/model/create_account_response_model.dart';
import 'package:jackelieson/helper/toast.dart';
import 'package:jackelieson/networks/rx_base.dart';
import 'package:rxdart/streams.dart';

final class CreateAccountRx extends RxResponseInt<CreateAccountResponseModel> {
  final api = CreateAccountApi.instance;

  CreateAccountRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<CreateAccountResponseModel> createAccount({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      CreateAccountResponseModel data = await api.createAccount(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    CreateAccountResponseModel response = data;
    String? message = response.message;

    ToastUtil.showShortToast('$message ✔');

    return response;
  }

  @override
  handleErrorWithReturn(error) {
    CreateAccountResponseModel errorResponse = CreateAccountResponseModel();
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

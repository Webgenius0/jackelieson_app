import 'package:dio/dio.dart';
import 'package:jackelieson/features/settings/model/change_pass_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class ChangePassApi {
  ChangePassApi._internal();
  static final ChangePassApi _singleton = ChangePassApi._internal();
  static ChangePassApi get instance => _singleton;

  Future<ChangePassResponseModel> changePass({
    required String currentPass,
    required String pass,
    required String passConfirm,
  }) async {
    try {
      final formData = {
        "current_password": currentPass,
        "password": pass,
        "password_confirmation": passConfirm,
      };

      Response response = await postHttp(Endpoints.changePass(), formData);

      if (response.statusCode == 200) {
        var data = ChangePassResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

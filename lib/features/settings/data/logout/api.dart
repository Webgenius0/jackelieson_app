import 'package:dio/dio.dart';
import 'package:jackelieson/features/settings/model/setting_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class LogoutApi {
  LogoutApi._internal();
  static final LogoutApi _singleton = LogoutApi._internal();
  static LogoutApi get instance => _singleton;

  Future<LogoutResponseModel> logout() async {
    try {
      dynamic data = {};
      Response response = await postHttp(Endpoints.logout(), data);

      if (response.statusCode == 200) {
        var data = LogoutResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

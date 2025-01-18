import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/model/login_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class LoginApi {
  LoginApi._internal();
  static final LoginApi _singleton = LoginApi._internal();
  static LoginApi get instance => _singleton;

  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      dynamic data = {"email": email, "password": password};
      Response response = await postHttp(Endpoints.login(), data);

      if (response.statusCode == 200) {
        var data = LoginResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

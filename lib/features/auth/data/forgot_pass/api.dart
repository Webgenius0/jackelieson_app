import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/model/forgot_password_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class ForgotPassApi {
  ForgotPassApi._internal();
  static final ForgotPassApi _singleton = ForgotPassApi._internal();
  static ForgotPassApi get instance => _singleton;

  Future<ForgotPasswordResponseModel> forgotPass({
    required String email,
    required String password,
    required String confirmPass,
  }) async {
    try {
      dynamic data = {
        "email": email,
        "password": password,
        "password_confirmation": confirmPass,
      };
      Response response = await postHttp(Endpoints.forgotPass(), data);

      if (response.statusCode == 200) {
        var data = ForgotPasswordResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

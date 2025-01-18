import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_email_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class ForgotPasswordEmailApi {
  ForgotPasswordEmailApi._internal();
  static final ForgotPasswordEmailApi _singleton =
      ForgotPasswordEmailApi._internal();
  static ForgotPasswordEmailApi get instance => _singleton;

  Future<ForgotPassEmailResponseModel> forgotPassEmail({
    required String email,
  }) async {
    try {
      dynamic data = {
        "email": email,
      };
      Response response = await postHttp(Endpoints.forgotPassEmail(), data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = ForgotPassEmailResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

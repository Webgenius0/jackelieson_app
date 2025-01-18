import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_resend_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class ForgotPasswordOtpResendApi {
  ForgotPasswordOtpResendApi._internal();
  static final ForgotPasswordOtpResendApi _singleton =
      ForgotPasswordOtpResendApi._internal();
  static ForgotPasswordOtpResendApi get instance => _singleton;

  Future<ForgotPasswordOtpResendResponseModel> forgotOtpResend({
    required String email,
  }) async {
    try {
      dynamic data = {
        "email": email,
      };
      Response response = await postHttp(Endpoints.forgotPassOtpResend(), data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = ForgotPasswordOtpResendResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

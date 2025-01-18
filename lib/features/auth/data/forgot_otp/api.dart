import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/model/forgot_pass_otp_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class ForgotPasswordOtpApi {
  ForgotPasswordOtpApi._internal();
  static final ForgotPasswordOtpApi _singleton =
      ForgotPasswordOtpApi._internal();
  static ForgotPasswordOtpApi get instance => _singleton;

  Future<ForgotPassOtpResponseModel> forgotPassOtp({
    required String email,
    required String otp,
  }) async {
    try {
      dynamic data = {
        "email": email,
        "otp": otp,
      };
      Response response = await postHttp(Endpoints.forgotPassOtp(), data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = ForgotPassOtpResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

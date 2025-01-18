import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/model/otp_verify_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class CreateAccountOtpVerifyApi {
  CreateAccountOtpVerifyApi._internal();
  static final CreateAccountOtpVerifyApi _singleton =
      CreateAccountOtpVerifyApi._internal();
  static CreateAccountOtpVerifyApi get instance => _singleton;

  Future<OtpVerifyResponseModel> otpVerify({
    required String otp,
    required String email,
  }) async {
    try {
      dynamic data = {
        "otp": otp,
        "email": email,
      };
      Response response = await postHttp(Endpoints.otpVerify(), data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = OtpVerifyResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

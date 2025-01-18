import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/model/resend_otp_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class ResendOtpApi {
  ResendOtpApi._internal();
  static final ResendOtpApi _singleton = ResendOtpApi._internal();
  static ResendOtpApi get instance => _singleton;

  Future<ResendOtpResponseModel> resendOtp({
    required String email,
  }) async {
    try {
      dynamic data = {
        "email": email,
      };
      Response response = await postHttp(Endpoints.resendOtp(), data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = ResendOtpResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

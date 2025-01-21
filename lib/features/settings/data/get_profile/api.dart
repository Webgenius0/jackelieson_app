import 'package:dio/dio.dart';
import 'package:jackelieson/features/settings/model/get_profile_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class GetProfileApi {
  GetProfileApi._internal();
  static final GetProfileApi _singleton = GetProfileApi._internal();
  static GetProfileApi get instance => _singleton;

  Future<GetProfileResponseModel> getProfile() async {
    try {
      Response response = await getHttp(Endpoints.getProfile());

      if (response.statusCode == 200) {
        var data = GetProfileResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

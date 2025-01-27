import 'package:dio/dio.dart';
import 'package:jackelieson/features/habits/model/habbit_details_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class HabbitDetailsApi {
  HabbitDetailsApi._internal();
  static final HabbitDetailsApi _singleton = HabbitDetailsApi._internal();
  static HabbitDetailsApi get instance => _singleton;

  Future<HabbitDetailsResponseModel> habbitDetails(
      {required dynamic id}) async {
    try {
      Response response = await getHttp(
        Endpoints.habbitDetails(id: id),
      );

      if (response.statusCode == 200) {
        var data = HabbitDetailsResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

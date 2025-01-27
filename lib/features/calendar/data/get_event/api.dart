import 'package:dio/dio.dart';
import 'package:jackelieson/features/calendar/model/get_event_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class GetEventApi {
  GetEventApi._internal();
  static final GetEventApi _singleton = GetEventApi._internal();
  static GetEventApi get instance => _singleton;

  Future<GetEventResponseModel> getEvent() async {
    try {
      Response response = await getHttp(
        Endpoints.getEvent(),
      );

      if (response.statusCode == 200) {
        var data = GetEventResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

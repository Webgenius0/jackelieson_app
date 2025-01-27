import 'package:dio/dio.dart';
import 'package:jackelieson/features/calendar/model/create_event_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class CreateEventApi {
  CreateEventApi._internal();
  static final CreateEventApi _singleton = CreateEventApi._internal();
  static CreateEventApi get instance => _singleton;

  Future<CreateEventResponseModel> createEvent({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required String color,
  }) async {
    try {
      Map<String, String> formData = {
        "title": title,
        "date": date,
        "start_time": startTime,
        "end_time": endTime,
        "color": color,
      };

      Response response = await postHttp(Endpoints.createEvent(), formData);

      if (response.statusCode == 200) {
        var data = CreateEventResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

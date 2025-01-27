import 'package:dio/dio.dart';
import 'package:jackelieson/features/tasks/model/edit_task_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class CreateTaskApi {
  CreateTaskApi._internal();
  static final CreateTaskApi _singleton = CreateTaskApi._internal();
  static CreateTaskApi get instance => _singleton;

  Future<EditTaskResponseModel> createTask({
    required String title,
    required String date,
    required String startTime,
    required dynamic color,
  }) async {
    try {
      final data = {
        "title": title,
        "date": date,
        "start_time": startTime,
        "color": color
      };

      Response response = await postHttp(Endpoints.createTask(), data);

      if (response.statusCode == 200) {
        var data = EditTaskResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:jackelieson/features/tasks/model/edit_task_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class EditTaskApi {
  EditTaskApi._internal();
  static final EditTaskApi _singleton = EditTaskApi._internal();
  static EditTaskApi get instance => _singleton;

  Future<EditTaskResponseModel> editTask({
    required dynamic id,
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
        "color": color,
      };

      Response response = await postHttp(Endpoints.editTask(id: id), data);

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

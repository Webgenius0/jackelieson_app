import 'package:dio/dio.dart';
import 'package:jackelieson/features/tasks/model/delete_task_response_model.dart';
import 'package:jackelieson/features/tasks/model/edit_task_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class DeleteTaskApi {
  DeleteTaskApi._internal();
  static final DeleteTaskApi _singleton = DeleteTaskApi._internal();
  static DeleteTaskApi get instance => _singleton;

  Future<DeleteTaskResponseModel> deleteTask({
    required dynamic id,

  }) async {
    try {
      Response response = await deleteHttp(Endpoints.deleteTask(id: id));

      if (response.statusCode == 200) {
        var data = DeleteTaskResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

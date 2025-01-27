import 'package:dio/dio.dart';
import 'package:jackelieson/features/tasks/model/get_all_task_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class AllTaskApi {
  AllTaskApi._internal();
  static final AllTaskApi _singleton = AllTaskApi._internal();
  static AllTaskApi get instance => _singleton;

  Future<AllTaskResponseModel> getAllTask({
    required String month,
  }) async {
    try {
      Response response = await getHttp(
        Endpoints.getAllTask(month: month),
      );

      if (response.statusCode == 200) {
        var data = AllTaskResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

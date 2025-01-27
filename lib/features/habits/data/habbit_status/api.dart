import 'package:dio/dio.dart';
import 'package:jackelieson/features/habits/model/habbit_status_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class HabbitStatusApi {
  HabbitStatusApi._internal();
  static final HabbitStatusApi _singleton = HabbitStatusApi._internal();
  static HabbitStatusApi get instance => _singleton;

  Future<HabbitStatusResponseModel> habbitStatus({
    required String status,
    required dynamic id,
  }) async {
    try {
      Response response = await getHttp(
        Endpoints.habbitStatus(id: id, status: status),
      );

      if (response.statusCode == 200) {
        var data = HabbitStatusResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

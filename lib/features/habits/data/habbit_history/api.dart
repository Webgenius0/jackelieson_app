import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jackelieson/features/habits/model/habbit_history_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class HabbitHistoryApi {
  HabbitHistoryApi._internal();
  static final HabbitHistoryApi _singleton = HabbitHistoryApi._internal();
  static HabbitHistoryApi get instance => _singleton;

  Future<HabbitHistoryResponseModel> habbitHistory(
      {required dynamic id}) async {
    try {
      Response response = await getHttp(
        Endpoints.habbitHistory(id: id),
      );

      if (response.statusCode == 200) {
        log("message====789=====");

        var data = HabbitHistoryResponseModel.fromJson(response.data);
        log("message====7810=====");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

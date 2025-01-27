import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jackelieson/features/habits/model/get_habbit_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class GetHabbitApi {
  GetHabbitApi._internal();
  static final GetHabbitApi _singleton = GetHabbitApi._internal();
  static GetHabbitApi get instance => _singleton;

  Future<GetHabbitResponseModel> getHabbit({required String day}) async {
    try {
      Response response = await getHttp(
        Endpoints.getHabbit(day: day),
      );

      if (response.statusCode == 200) {
        log("message====789=====");

        var data = GetHabbitResponseModel.fromJson(response.data);
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

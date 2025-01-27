import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/model/all_habbit_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class AllHabbitApi {
  AllHabbitApi._internal();
  static final AllHabbitApi _singleton = AllHabbitApi._internal();
  static AllHabbitApi get instance => _singleton;

  Future<AllHabbitResponseModel> getAllHabbit() async {
    try {
      Response response = await getHttp(
        Endpoints.getAllHabbit(),
      );

      if (response.statusCode == 200) {
        var data = AllHabbitResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

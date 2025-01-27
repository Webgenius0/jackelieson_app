import 'package:dio/dio.dart';
import 'package:jackelieson/features/habits/model/create_habbit_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class CreateHabbitApi {
  CreateHabbitApi._internal();
  static final CreateHabbitApi _singleton = CreateHabbitApi._internal();
  static CreateHabbitApi get instance => _singleton;

  Future<CreateHabbitResponseModel> createHabbit({
    required List habbitID,
    required String habbitName,
    required bool isReminder,
    required bool days,
    List? dayList,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "habit_id": habbitID,
        "name": habbitName,
        "is_reminder": isReminder ? 1 : 0,
        "days": ["everyday"]
      };
      // final data = {
      //   "habit_id": habbitID,
      //   "name": habbitName,
      //   "is_reminder": isReminder ? 1 : 0,
      //   if (days) "days": "everyday",

      // };
      Map<String, String> formData = {};

      // Add other parameters
      formData.addAll({
        "habit_id": "1",
        "name": habbitName,
        "is_reminder": isReminder ? "1" : "0",
        if (true) "days": "everyday"
      });

      // final Map<String, String> formData = {
      //   "habit_id[]": "1",
      //   "name": habbitName,
      //   "is_reminder": isReminder ? "1" : "0",
      //   if (days) "days[]": "everyday"
      // };

      Response response = await postHttp(Endpoints.createHabbit(), data);

      if (response.statusCode == 200) {
        var data = CreateHabbitResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

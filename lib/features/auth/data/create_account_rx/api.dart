import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jackelieson/features/auth/model/create_account_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class CreateAccountApi {
  CreateAccountApi._internal();
  static final CreateAccountApi _singleton = CreateAccountApi._internal();
  static CreateAccountApi get instance => _singleton;

  Future<CreateAccountResponseModel> createAccount({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      dynamic data = {
        "phone": phone,
        "name": name,
        "email": email,
        "password": password,
      };
      Response response = await postHttp(Endpoints.createAccount(), data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = CreateAccountResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

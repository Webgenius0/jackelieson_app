import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jackelieson/features/settings/model/update_profile_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class UpdateProfileApi {
  UpdateProfileApi._internal();
  static final UpdateProfileApi _singleton = UpdateProfileApi._internal();
  static UpdateProfileApi get instance => _singleton;

  Future<UpdateProfileResponseModel> updateProfile({
    required String phone,
    required String name,
    XFile? avatar,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "phone": phone,
        "name": name,
      });

      if (avatar != null) {
        if (await File(avatar.path).exists()) {
          formData.files.add(
              MapEntry('avatar', await MultipartFile.fromFile(avatar.path)));
        }
      }

      Response response = await postHttp(Endpoints.updateProfile(), formData);

      if (response.statusCode == 200) {
        var data = UpdateProfileResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

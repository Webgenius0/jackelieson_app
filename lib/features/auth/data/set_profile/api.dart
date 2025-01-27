import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jackelieson/features/auth/model/set_profile_image_response_model.dart';
import 'package:jackelieson/networks/dio/dio.dart';
import 'package:jackelieson/networks/endpoints.dart';
import 'package:jackelieson/networks/exception_handler/data_source.dart';

final class SetProfileImageApi {
  SetProfileImageApi._internal();
  static final SetProfileImageApi _singleton = SetProfileImageApi._internal();
  static SetProfileImageApi get instance => _singleton;

  Future<SetProfileImageResponseModel> setProfle({
    XFile? image,
  }) async {
    try {
      FormData formData = FormData.fromMap({});

      if (image != null) {
        if (await File(image.path).exists()) {
          formData.files.add(
              MapEntry('avatar', await MultipartFile.fromFile(image.path)));
        }
      }

      Response response = await postHttp(Endpoints.setProfle(), formData);

      if (response.statusCode == 200) {
        var data = SetProfileImageResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}

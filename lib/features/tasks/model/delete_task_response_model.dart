import 'dart:convert';

class DeleteTaskResponseModel {
    bool? success;
    String? message;
    List<dynamic>? data;
    int? code;

    DeleteTaskResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    DeleteTaskResponseModel copyWith({
        bool? success,
        String? message,
        List<dynamic>? data,
        int? code,
    }) => 
        DeleteTaskResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory DeleteTaskResponseModel.fromRawJson(String str) => DeleteTaskResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteTaskResponseModel.fromJson(Map<String, dynamic> json) => DeleteTaskResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "code": code,
    };
}

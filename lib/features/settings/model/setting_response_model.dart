import 'dart:convert';

class LogoutResponseModel {
    bool? success;
    String? message;
    List<dynamic>? data;
    int? code;

    LogoutResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    LogoutResponseModel copyWith({
        bool? success,
        String? message,
        List<dynamic>? data,
        int? code,
    }) => 
        LogoutResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory LogoutResponseModel.fromRawJson(String str) => LogoutResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LogoutResponseModel.fromJson(Map<String, dynamic> json) => LogoutResponseModel(
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

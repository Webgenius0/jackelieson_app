import 'dart:convert';

class CreateAccountResponseModel {
    bool? success;
    String? message;
    Data? data;
    int? code;

    CreateAccountResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    CreateAccountResponseModel copyWith({
        bool? success,
        String? message,
        Data? data,
        int? code,
    }) => 
        CreateAccountResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory CreateAccountResponseModel.fromRawJson(String str) => CreateAccountResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateAccountResponseModel.fromJson(Map<String, dynamic> json) => CreateAccountResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "code": code,
    };
}

class Data {
    String? name;
    String? email;
    String? phone;
    int? id;

    Data({
        this.name,
        this.email,
        this.phone,
        this.id,
    });

    Data copyWith({
        String? name,
        String? email,
        String? phone,
        int? id,
    }) => 
        Data(
            name: name ?? this.name,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            id: id ?? this.id,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "id": id,
    };
}

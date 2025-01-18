import 'dart:convert';

class ForgotPassEmailResponseModel {
    bool? success;
    String? message;
    Data? data;
    int? code;

    ForgotPassEmailResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    ForgotPassEmailResponseModel copyWith({
        bool? success,
        String? message,
        Data? data,
        int? code,
    }) => 
        ForgotPassEmailResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory ForgotPassEmailResponseModel.fromRawJson(String str) => ForgotPassEmailResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ForgotPassEmailResponseModel.fromJson(Map<String, dynamic> json) => ForgotPassEmailResponseModel(
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
    int? id;
    bool? isPremium;
    String? name;
    String? email;
    String? phone;
    dynamic weekStartsOn;
    String? isNotification;
    dynamic avatar;
    int? code;

    Data({
        this.id,
        this.isPremium,
        this.name,
        this.email,
        this.phone,
        this.weekStartsOn,
        this.isNotification,
        this.avatar,
        this.code,
    });

    Data copyWith({
        int? id,
        bool? isPremium,
        String? name,
        String? email,
        String? phone,
        dynamic weekStartsOn,
        String? isNotification,
        dynamic avatar,
        int? code,
    }) => 
        Data(
            id: id ?? this.id,
            isPremium: isPremium ?? this.isPremium,
            name: name ?? this.name,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            weekStartsOn: weekStartsOn ?? this.weekStartsOn,
            isNotification: isNotification ?? this.isNotification,
            avatar: avatar ?? this.avatar,
            code: code ?? this.code,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        isPremium: json["is_premium"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        weekStartsOn: json["week_starts_on"],
        isNotification: json["is_notification"],
        avatar: json["avatar"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_premium": isPremium,
        "name": name,
        "email": email,
        "phone": phone,
        "week_starts_on": weekStartsOn,
        "is_notification": isNotification,
        "avatar": avatar,
        "code": code,
    };
}

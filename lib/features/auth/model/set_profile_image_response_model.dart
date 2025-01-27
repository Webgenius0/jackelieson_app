import 'dart:convert';

class SetProfileImageResponseModel {
    bool? success;
    String? message;
    Data? data;
    int? code;

    SetProfileImageResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    SetProfileImageResponseModel copyWith({
        bool? success,
        String? message,
        Data? data,
        int? code,
    }) => 
        SetProfileImageResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory SetProfileImageResponseModel.fromRawJson(String str) => SetProfileImageResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SetProfileImageResponseModel.fromJson(Map<String, dynamic> json) => SetProfileImageResponseModel(
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
    String? weekStartsOn;
    String? isNotification;
    dynamic avatar;

    Data({
        this.id,
        this.isPremium,
        this.name,
        this.email,
        this.phone,
        this.weekStartsOn,
        this.isNotification,
        this.avatar,
    });

    Data copyWith({
        int? id,
        bool? isPremium,
        String? name,
        String? email,
        String? phone,
        String? weekStartsOn,
        String? isNotification,
        dynamic avatar,
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
    };
}

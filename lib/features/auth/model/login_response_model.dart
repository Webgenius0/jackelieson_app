import 'dart:convert';

class LoginResponseModel {
    bool? success;
    String? message;
    Data? data;
    int? code;

    LoginResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    LoginResponseModel copyWith({
        bool? success,
        String? message,
        Data? data,
        int? code,
    }) => 
        LoginResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory LoginResponseModel.fromRawJson(String str) => LoginResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
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
    dynamic token;

    Data({
        this.id,
        this.isPremium,
        this.name,
        this.email,
        this.phone,
        this.weekStartsOn,
        this.isNotification,
        this.avatar,
        this.token,
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
        dynamic token,
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
            token: token ?? this.token,
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
        token: json["token"],
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
        "token": token,
    };
}

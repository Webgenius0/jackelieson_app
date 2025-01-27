import 'dart:convert';

class HabbitStatusResponseModel {
    bool? success;
    String? message;
    Data? data;
    int? code;

    HabbitStatusResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    HabbitStatusResponseModel copyWith({
        bool? success,
        String? message,
        Data? data,
        int? code,
    }) => 
        HabbitStatusResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory HabbitStatusResponseModel.fromRawJson(String str) => HabbitStatusResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HabbitStatusResponseModel.fromJson(Map<String, dynamic> json) => HabbitStatusResponseModel(
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
    int? userId;
    int? userHabitId;
    DateTime? date;
    String? status;
    int? id;

    Data({
        this.userId,
        this.userHabitId,
        this.date,
        this.status,
        this.id,
    });

    Data copyWith({
        int? userId,
        int? userHabitId,
        DateTime? date,
        String? status,
        int? id,
    }) => 
        Data(
            userId: userId ?? this.userId,
            userHabitId: userHabitId ?? this.userHabitId,
            date: date ?? this.date,
            status: status ?? this.status,
            id: id ?? this.id,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        userHabitId: json["user_habit_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_habit_id": userHabitId,
        "date": date?.toIso8601String(),
        "status": status,
        "id": id,
    };
}

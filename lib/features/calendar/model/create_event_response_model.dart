import 'dart:convert';

class CreateEventResponseModel {
    bool? success;
    String? message;
    Data? data;
    int? code;

    CreateEventResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    CreateEventResponseModel copyWith({
        bool? success,
        String? message,
        Data? data,
        int? code,
    }) => 
        CreateEventResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory CreateEventResponseModel.fromRawJson(String str) => CreateEventResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateEventResponseModel.fromJson(Map<String, dynamic> json) => CreateEventResponseModel(
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
    String? title;
    DateTime? date;
    String? startTime;
    String? endTime;
    String? color;
    int? id;

    Data({
        this.userId,
        this.title,
        this.date,
        this.startTime,
        this.endTime,
        this.color,
        this.id,
    });

    Data copyWith({
        int? userId,
        String? title,
        DateTime? date,
        String? startTime,
        String? endTime,
        String? color,
        int? id,
    }) => 
        Data(
            userId: userId ?? this.userId,
            title: title ?? this.title,
            date: date ?? this.date,
            startTime: startTime ?? this.startTime,
            endTime: endTime ?? this.endTime,
            color: color ?? this.color,
            id: id ?? this.id,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        title: json["title"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        color: json["color"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "title": title,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "color": color,
        "id": id,
    };
}

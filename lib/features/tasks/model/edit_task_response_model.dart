import 'dart:convert';

class EditTaskResponseModel {
    bool? success;
    String? message;
    Data? data;
    int? code;

    EditTaskResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    EditTaskResponseModel copyWith({
        bool? success,
        String? message,
        Data? data,
        int? code,
    }) => 
        EditTaskResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory EditTaskResponseModel.fromRawJson(String str) => EditTaskResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EditTaskResponseModel.fromJson(Map<String, dynamic> json) => EditTaskResponseModel(
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
    int? userId;
    String? title;
    DateTime? date;
    String? startTime;
    String? color;

    Data({
        this.id,
        this.userId,
        this.title,
        this.date,
        this.startTime,
        this.color,
    });

    Data copyWith({
        int? id,
        int? userId,
        String? title,
        DateTime? date,
        String? startTime,
        String? color,
    }) => 
        Data(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            title: title ?? this.title,
            date: date ?? this.date,
            startTime: startTime ?? this.startTime,
            color: color ?? this.color,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startTime: json["start_time"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "color": color,
    };
}

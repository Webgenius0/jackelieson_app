import 'dart:convert';

class GetEventResponseModel {
    bool? success;
    String? message;
    List<Datum>? data;
    int? code;

    GetEventResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    GetEventResponseModel copyWith({
        bool? success,
        String? message,
        List<Datum>? data,
        int? code,
    }) => 
        GetEventResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory GetEventResponseModel.fromRawJson(String str) => GetEventResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetEventResponseModel.fromJson(Map<String, dynamic> json) => GetEventResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "code": code,
    };
}

class Datum {
    int? id;
    int? userId;
    String? title;
    DateTime? date;
    String? startTime;
    String? endTime;
    String? color;

    Datum({
        this.id,
        this.userId,
        this.title,
        this.date,
        this.startTime,
        this.endTime,
        this.color,
    });

    Datum copyWith({
        int? id,
        int? userId,
        String? title,
        DateTime? date,
        String? startTime,
        String? endTime,
        String? color,
    }) => 
        Datum(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            title: title ?? this.title,
            date: date ?? this.date,
            startTime: startTime ?? this.startTime,
            endTime: endTime ?? this.endTime,
            color: color ?? this.color,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "color": color,
    };
}

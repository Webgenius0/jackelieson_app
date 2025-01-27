import 'dart:convert';

class AllTaskResponseModel {
  bool? success;
  String? message;
  Map<String, List<Datum>>? data;
  int? code;

  AllTaskResponseModel({
    this.success,
    this.message,
    this.data,
    this.code,
  });

  AllTaskResponseModel copyWith({
    bool? success,
    String? message,
    Map<String, List<Datum>>? data,
    int? code,
  }) =>
      AllTaskResponseModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
        code: code ?? this.code,
      );

  factory AllTaskResponseModel.fromRawJson(String str) =>
      AllTaskResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllTaskResponseModel.fromJson(Map<String, dynamic> json) =>
      AllTaskResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? {} // Initialize with an empty map if data is null
            : Map.from(json["data"]).map((k, v) =>
                MapEntry<String, List<Datum>>(
                    k, List<Datum>.from(v.map((x) => Datum.fromJson(x))))),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? null
            : Map.from(data!).map((k, v) => MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "code": code,
      };
}

class Datum {
  int? id;
  int? userId;
  String? title;
  DateTime? date;
  String? startTime;
  String? color;

  Datum({
    this.id,
    this.userId,
    this.title,
    this.date,
    this.startTime,
    this.color,
  });

  Datum copyWith({
    int? id,
    int? userId,
    String? title,
    DateTime? date,
    String? startTime,
    String? color,
  }) =>
      Datum(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
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
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "color": color,
      };
}

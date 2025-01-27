import 'dart:convert';

class AllHabbitResponseModel {
    bool? success;
    String? message;
    List<Datum>? data;
    int? code;

    AllHabbitResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    AllHabbitResponseModel copyWith({
        bool? success,
        String? message,
        List<Datum>? data,
        int? code,
    }) => 
        AllHabbitResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory AllHabbitResponseModel.fromRawJson(String str) => AllHabbitResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AllHabbitResponseModel.fromJson(Map<String, dynamic> json) => AllHabbitResponseModel(
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
    String? name;
    String? imageUrl;

    Datum({
        this.id,
        this.name,
        this.imageUrl,
    });

    Datum copyWith({
        int? id,
        String? name,
        String? imageUrl,
    }) => 
        Datum(
            id: id ?? this.id,
            name: name ?? this.name,
            imageUrl: imageUrl ?? this.imageUrl,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
    };
}

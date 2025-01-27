import 'dart:convert';

class HabbitHistoryResponseModel {
    bool? success;
    String? message;
    Data? data;
    int? code;

    HabbitHistoryResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    HabbitHistoryResponseModel copyWith({
        bool? success,
        String? message,
        Data? data,
        int? code,
    }) => 
        HabbitHistoryResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory HabbitHistoryResponseModel.fromRawJson(String str) => HabbitHistoryResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HabbitHistoryResponseModel.fromJson(Map<String, dynamic> json) => HabbitHistoryResponseModel(
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
    Map<String, MonthlyStreak>? monthlyStreaks;
    BestStreak? bestStreak;

    Data({
        this.monthlyStreaks,
        this.bestStreak,
    });

    Data copyWith({
        Map<String, MonthlyStreak>? monthlyStreaks,
        BestStreak? bestStreak,
    }) => 
        Data(
            monthlyStreaks: monthlyStreaks ?? this.monthlyStreaks,
            bestStreak: bestStreak ?? this.bestStreak,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        monthlyStreaks: Map.from(json["monthly_streaks"]!).map((k, v) => MapEntry<String, MonthlyStreak>(k, MonthlyStreak.fromJson(v))),
        bestStreak: json["best_streak"] == null ? null : BestStreak.fromJson(json["best_streak"]),
    );

    Map<String, dynamic> toJson() => {
        "monthly_streaks": Map.from(monthlyStreaks!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "best_streak": bestStreak?.toJson(),
    };
}

class BestStreak {
    dynamic streak;
    dynamic month;

    BestStreak({
        this.streak,
        this.month,
    });

    BestStreak copyWith({
        dynamic streak,
        dynamic month,
    }) => 
        BestStreak(
            streak: streak ?? this.streak,
            month: month ?? this.month,
        );

    factory BestStreak.fromRawJson(String str) => BestStreak.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BestStreak.fromJson(Map<String, dynamic> json) => BestStreak(
        streak: json["streak"],
        month: json["month"],
    );

    Map<String, dynamic> toJson() => {
        "streak": streak,
        "month": month,
    };
}

class MonthlyStreak {
    int? x;
    dynamic y;

    MonthlyStreak({
        this.x,
        this.y,
    });

    MonthlyStreak copyWith({
        int? x,
        dynamic y,
    }) => 
        MonthlyStreak(
            x: x ?? this.x,
            y: y ?? this.y,
        );

    factory MonthlyStreak.fromRawJson(String str) => MonthlyStreak.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MonthlyStreak.fromJson(Map<String, dynamic> json) => MonthlyStreak(
        x: json["x"],
        y: json["y"],
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
    };
}

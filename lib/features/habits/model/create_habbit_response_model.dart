import 'dart:convert';

class CreateHabbitResponseModel {
    bool? success;
    String? message;
    List<Datum>? data;
    int? code;

    CreateHabbitResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    CreateHabbitResponseModel copyWith({
        bool? success,
        String? message,
        List<Datum>? data,
        int? code,
    }) => 
        CreateHabbitResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory CreateHabbitResponseModel.fromRawJson(String str) => CreateHabbitResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateHabbitResponseModel.fromJson(Map<String, dynamic> json) => CreateHabbitResponseModel(
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
    UserHabit? userHabit;
    List<Day>? days;

    Datum({
        this.userHabit,
        this.days,
    });

    Datum copyWith({
        UserHabit? userHabit,
        List<Day>? days,
    }) => 
        Datum(
            userHabit: userHabit ?? this.userHabit,
            days: days ?? this.days,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userHabit: json["user_habit"] == null ? null : UserHabit.fromJson(json["user_habit"]),
        days: json["days"] == null ? [] : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user_habit": userHabit?.toJson(),
        "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x.toJson())),
    };
}

class Day {
    int? userId;
    int? userHabitId;
    String? day;
    int? id;

    Day({
        this.userId,
        this.userHabitId,
        this.day,
        this.id,
    });

    Day copyWith({
        int? userId,
        int? userHabitId,
        String? day,
        int? id,
    }) => 
        Day(
            userId: userId ?? this.userId,
            userHabitId: userHabitId ?? this.userHabitId,
            day: day ?? this.day,
            id: id ?? this.id,
        );

    factory Day.fromRawJson(String str) => Day.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        userId: json["user_id"],
        userHabitId: json["user_habit_id"],
        day: json["day"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_habit_id": userHabitId,
        "day": day,
        "id": id,
    };
}

class UserHabit {
    int? userId;
    int? habitId;
    String? name;
    bool? isReminder;
    int? id;

    UserHabit({
        this.userId,
        this.habitId,
        this.name,
        this.isReminder,
        this.id,
    });

    UserHabit copyWith({
        int? userId,
        int? habitId,
        String? name,
        bool? isReminder,
        int? id,
    }) => 
        UserHabit(
            userId: userId ?? this.userId,
            habitId: habitId ?? this.habitId,
            name: name ?? this.name,
            isReminder: isReminder ?? this.isReminder,
            id: id ?? this.id,
        );

    factory UserHabit.fromRawJson(String str) => UserHabit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserHabit.fromJson(Map<String, dynamic> json) => UserHabit(
        userId: json["user_id"],
        habitId: json["habit_id"],
        name: json["name"],
        isReminder: json["is_reminder"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "habit_id": habitId,
        "name": name,
        "is_reminder": isReminder,
        "id": id,
    };
}

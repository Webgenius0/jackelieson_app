import 'dart:convert';

class HabbitDetailsResponseModel {
    bool? success;
    String? message;
    Data? data;
    int? code;

    HabbitDetailsResponseModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    HabbitDetailsResponseModel copyWith({
        bool? success,
        String? message,
        Data? data,
        int? code,
    }) => 
        HabbitDetailsResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
            code: code ?? this.code,
        );

    factory HabbitDetailsResponseModel.fromRawJson(String str) => HabbitDetailsResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HabbitDetailsResponseModel.fromJson(Map<String, dynamic> json) => HabbitDetailsResponseModel(
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
    Habit? habit;
    List<dynamic>? habitCompleted;

    Data({
        this.habit,
        this.habitCompleted,
    });

    Data copyWith({
        Habit? habit,
        List<dynamic>? habitCompleted,
    }) => 
        Data(
            habit: habit ?? this.habit,
            habitCompleted: habitCompleted ?? this.habitCompleted,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        habit: json["habit"] == null ? null : Habit.fromJson(json["habit"]),
        habitCompleted: json["habit_completed"] == null ? [] : List<dynamic>.from(json["habit_completed"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "habit": habit?.toJson(),
        "habit_completed": habitCompleted == null ? [] : List<dynamic>.from(habitCompleted!.map((x) => x)),
    };
}

class Habit {
    int? id;
    String? name;
    String? image;
    List<String>? days;
    int? streak;
    int? daysInCurrentMonth;
    int? completedDaysInCurrentMonth;
    int? aheadOfPeople;

    Habit({
        this.id,
        this.name,
        this.image,
        this.days,
        this.streak,
        this.daysInCurrentMonth,
        this.completedDaysInCurrentMonth,
        this.aheadOfPeople,
    });

    Habit copyWith({
        int? id,
        String? name,
        String? image,
        List<String>? days,
        int? streak,
        int? daysInCurrentMonth,
        int? completedDaysInCurrentMonth,
        int? aheadOfPeople,
    }) => 
        Habit(
            id: id ?? this.id,
            name: name ?? this.name,
            image: image ?? this.image,
            days: days ?? this.days,
            streak: streak ?? this.streak,
            daysInCurrentMonth: daysInCurrentMonth ?? this.daysInCurrentMonth,
            completedDaysInCurrentMonth: completedDaysInCurrentMonth ?? this.completedDaysInCurrentMonth,
            aheadOfPeople: aheadOfPeople ?? this.aheadOfPeople,
        );

    factory Habit.fromRawJson(String str) => Habit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Habit.fromJson(Map<String, dynamic> json) => Habit(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        days: json["days"] == null ? [] : List<String>.from(json["days"]!.map((x) => x)),
        streak: json["streak"],
        daysInCurrentMonth: json["days_in_current_month"],
        completedDaysInCurrentMonth: json["completed_days_in_current_month"],
        aheadOfPeople: json["ahead_of_people"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x)),
        "streak": streak,
        "days_in_current_month": daysInCurrentMonth,
        "completed_days_in_current_month": completedDaysInCurrentMonth,
        "ahead_of_people": aheadOfPeople,
    };
}

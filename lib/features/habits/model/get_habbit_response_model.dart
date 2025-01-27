class GetHabbitResponseModel {
  bool? success;
  String? message;
  List<Data>? data;
  int? code;

  GetHabbitResponseModel({this.success, this.message, this.data, this.code});

  GetHabbitResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? imageUrl;
  int? streak;
  List<String>? days;
  String? taskStatus;

  Data(
      {this.id,
      this.name,
      this.imageUrl,
      this.streak,
      this.days,
      this.taskStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    streak = json['streak'];
    days = json['days'].cast<String>();
    taskStatus = json['task_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['streak'] = streak;
    data['days'] = days;
    data['task_status'] = taskStatus;
    return data;
  }
}

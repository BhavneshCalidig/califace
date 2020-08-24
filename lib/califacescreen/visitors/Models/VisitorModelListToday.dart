import 'dart:convert';

VisitorListModelToday visitorListModelTodayFromJson(String str) => VisitorListModelToday.fromJson(json.decode(str));

String visitorListModelTodayToJson(VisitorListModelToday data) => json.encode(data.toJson());

class VisitorListModelToday {
  VisitorListModelToday({
    this.success,
    this.title,
    this.message,
    this.data,
    this.again,
  });

  bool success;
  String title;
  String message;
  List<dynamic> data;
  dynamic again;

  factory VisitorListModelToday.fromJson(Map<String, dynamic> json) => VisitorListModelToday(
    success: json["success"],
    title: json["title"],
    message: json["message"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
    again: json["again"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "title": title,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
    "again": again,
  };
}

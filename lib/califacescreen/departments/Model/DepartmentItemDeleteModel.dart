import 'dart:convert';

DepartmentItemDeleteModel departmentItemDeleteModelFromJson(String str) => DepartmentItemDeleteModel.fromJson(json.decode(str));

String departmentItemDeleteModelToJson(DepartmentItemDeleteModel data) => json.encode(data.toJson());

class DepartmentItemDeleteModel {
  DepartmentItemDeleteModel({
    this.success,
    this.title,
    this.message,
    this.data,
    this.again,
  });

  bool success;
  String title;
  String message;
  bool data;
  dynamic again;

  factory DepartmentItemDeleteModel.fromJson(Map<String, dynamic> json) => DepartmentItemDeleteModel(
    success: json["success"],
    title: json["title"],
    message: json["message"],
    data: json["data"],
    again: json["again"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "title": title,
    "message": message,
    "data": data,
    "again": again,
  };
}
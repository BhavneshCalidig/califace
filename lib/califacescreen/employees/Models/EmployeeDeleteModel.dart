
import 'dart:convert';

EmployeeDeleteModel employeeDeleteModelFromJson(String str) => EmployeeDeleteModel.fromJson(json.decode(str));

String employeeDeleteModelToJson(EmployeeDeleteModel data) => json.encode(data.toJson());

class EmployeeDeleteModel {
  EmployeeDeleteModel({
    this.success,
    this.title,
    this.message,
    this.data,
    this.again,
  });

  bool success;
  String title;
  String message;
  int data;
  dynamic again;

  factory EmployeeDeleteModel.fromJson(Map<String, dynamic> json) => EmployeeDeleteModel(
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

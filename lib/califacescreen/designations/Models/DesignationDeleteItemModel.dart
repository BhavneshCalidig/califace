import 'dart:convert';

DesignationItemDeleteModel designationItemDeleteModelFromJson(String str) => DesignationItemDeleteModel.fromJson(json.decode(str));

String designationItemDeleteModelToJson(DesignationItemDeleteModel data) => json.encode(data.toJson());

class DesignationItemDeleteModel {
  DesignationItemDeleteModel({
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

  factory DesignationItemDeleteModel.fromJson(Map<String, dynamic> json) => DesignationItemDeleteModel(
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

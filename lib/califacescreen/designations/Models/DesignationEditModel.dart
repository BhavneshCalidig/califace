
import 'dart:convert';

DesignationUpdateModel designationUpdateModelFromJson(String str) => DesignationUpdateModel.fromJson(json.decode(str));

String designationUpdateModelToJson(DesignationUpdateModel data) => json.encode(data.toJson());

class DesignationUpdateModel {
  DesignationUpdateModel({
    this.success,
    this.title,
    this.message,
    this.data,
    this.again,
  });

  bool success;
  String title;
  String message;
  Data data;
  dynamic again;

  factory DesignationUpdateModel.fromJson(Map<String, dynamic> json) => DesignationUpdateModel(
    success: json["success"],
    title: json["title"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    again: json["again"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "title": title,
    "message": message,
    "data": data.toJson(),
    "again": again,
  };
}

class Data {
  Data({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

import 'dart:convert';

DesignationStoretModel designationStoretModelFromJson(String str) => DesignationStoretModel.fromJson(json.decode(str));

String designationStoretModelToJson(DesignationStoretModel data) => json.encode(data.toJson());

class DesignationStoretModel {
  DesignationStoretModel({
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

  factory DesignationStoretModel.fromJson(Map<String, dynamic> json) => DesignationStoretModel(
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
    this.title,
    this.description,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String title;
  String description;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    description: json["description"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
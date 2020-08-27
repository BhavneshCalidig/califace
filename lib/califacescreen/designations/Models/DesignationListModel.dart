

import 'dart:convert';

DesignationlistModel designationlistModelFromJson(String str) => DesignationlistModel.fromJson(json.decode(str));

String designationlistModelToJson(DesignationlistModel data) => json.encode(data.toJson());

class DesignationlistModel {
  DesignationlistModel({
    this.success,
    this.title,
    this.message,
    this.data,
    this.again,
  });

  bool success;
  String title;
  String message;
  List<DesignationListModel> data;
  dynamic again;

  factory DesignationlistModel.fromJson(Map<String, dynamic> json) => DesignationlistModel(
    success: json["success"],
    title: json["title"],
    message: json["message"],
    data: List<DesignationListModel>.from(json["data"].map((x) => DesignationListModel.fromJson(x))),
    again: json["again"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "title": title,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "again": again,
  };
}

class DesignationListModel {
  DesignationListModel({
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

  factory DesignationListModel.fromJson(Map<String, dynamic> json) => DesignationListModel(
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

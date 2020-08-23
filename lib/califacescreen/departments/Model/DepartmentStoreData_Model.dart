import 'dart:convert';

DepartmentStoreDataModel departmentStoreDataModelFromJson(String str) => DepartmentStoreDataModel.fromJson(json.decode(str));

String departmentStoreDataModelToJson(DepartmentStoreDataModel data) => json.encode(data.toJson());

class DepartmentStoreDataModel {
  DepartmentStoreDataModel({
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

  factory DepartmentStoreDataModel.fromJson(Map<String, dynamic> json) => DepartmentStoreDataModel(
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
    this.description,
    this.email,
    this.hod,
    this.phone,
    this.startingDate,
    this.title,
    this.totalEmployee,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String description;
  String email;
  String hod;
  String phone;
  String startingDate;
  String title;
  String totalEmployee;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    description: json["description"],
    email: json["email"],
    hod: json["hod"],
    phone: json["phone"],
    startingDate: json["starting_date"],
    title: json["title"],
    totalEmployee: json["total_employee"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "email": email,
    "hod": hod,
    "phone": phone,
    "starting_date": startingDate,
    "title": title,
    "total_employee": totalEmployee,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
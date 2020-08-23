import 'dart:convert';

DepartmentListDataModel departmentListDataModelFromJson(String str) => DepartmentListDataModel.fromJson(json.decode(str));

String departmentListDataModelToJson(DepartmentListDataModel data) => json.encode(data.toJson());

class DepartmentListDataModel {
  DepartmentListDataModel({
    this.success,
    this.title,
    this.message,
    this.data,
    this.again,
  });

  bool success;
  String title;
  String message;
  List<Datum> data;
  dynamic again;

  factory DepartmentListDataModel.fromJson(Map<String, dynamic> json) => DepartmentListDataModel(
    success: json["success"],
    title: json["title"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
    this.id,
    this.title,
    this.description,
    this.hod,
    this.phone,
    this.email,
    this.startingDate,
    this.totalEmployee,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String description;
  String hod;
  String phone;
  String email;
  String startingDate;
  String totalEmployee;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    hod: json["hod"],
    phone: json["phone"],
    email: json["email"],
    startingDate: json["starting_date"],
    totalEmployee: json["total_employee"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "hod": hod,
    "phone": phone,
    "email": email,
    "starting_date": startingDate,
    "total_employee": totalEmployee,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

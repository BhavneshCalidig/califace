import 'dart:convert';

EmployeeStoreDataModel employeeStoreDataModelFromJson(String str) => EmployeeStoreDataModel.fromJson(json.decode(str));

String employeeStoreDataModelToJson(EmployeeStoreDataModel data) => json.encode(data.toJson());

class EmployeeStoreDataModel {
  EmployeeStoreDataModel({
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

  factory EmployeeStoreDataModel.fromJson(Map<String, dynamic> json) => EmployeeStoreDataModel(
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
    this.department,
    this.designation,
  });

  List<Department> department;
  List<Designation> designation;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    department: List<Department>.from(json["department"].map((x) => Department.fromJson(x))),
    designation: List<Designation>.from(json["designation"].map((x) => Designation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "department": List<dynamic>.from(department.map((x) => x.toJson())),
    "designation": List<dynamic>.from(designation.map((x) => x.toJson())),
  };
}

class Department {
  Department({
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

  factory Department.fromJson(Map<String, dynamic> json) => Department(
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

class Designation {
  Designation({
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

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
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

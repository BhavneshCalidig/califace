import 'dart:convert';

EmployeeUpdateModel employeeUpdateModelFromJson(String str) => EmployeeUpdateModel.fromJson(json.decode(str));

String employeeUpdateModelToJson(EmployeeUpdateModel data) => json.encode(data.toJson());

class EmployeeUpdateModel {
  EmployeeUpdateModel({
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

  factory EmployeeUpdateModel.fromJson(Map<String, dynamic> json) => EmployeeUpdateModel(
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
    this.firstName,
    this.lastName,
    this.email,
    this.designationId,
    this.departmentId,
    this.gender,
    this.contactNo,
    this.employeeId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String designationId;
  String departmentId;
  String gender;
  String contactNo;
  String employeeId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    designationId: json["designation_id"],
    departmentId: json["department_id"],
    gender: json["gender"],
    contactNo: json["contact_no"],
    employeeId: json["employee_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "designation_id": designationId,
    "department_id": departmentId,
    "gender": gender,
    "contact_no": contactNo,
    "employee_id": employeeId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}


import 'dart:convert';

StoreEmployeData storeEmployeDataFromJson(String str) => StoreEmployeData.fromJson(json.decode(str));

String storeEmployeDataToJson(StoreEmployeData data) => json.encode(data.toJson());

class StoreEmployeData {
  StoreEmployeData({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.departmentId,
    this.designationId,
    this.contactNo,
    this.employeeId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String firstName;
  String lastName;
  String email;
  String gender;
  String departmentId;
  String designationId;
  String contactNo;
  String employeeId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory StoreEmployeData.fromJson(Map<String, dynamic> json) => StoreEmployeData(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    gender: json["gender"],
    departmentId: json["department_id"],
    designationId: json["designation_id"],
    contactNo: json["contact_no"],
    employeeId: json["employee_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "gender": gender,
    "department_id": departmentId,
    "designation_id": designationId,
    "contact_no": contactNo,
    "employee_id": employeeId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}

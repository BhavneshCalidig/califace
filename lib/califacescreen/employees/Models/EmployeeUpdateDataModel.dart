import 'dart:convert';

EmployeeUpdateDataModel employeeUpdateDataModelFromJson(String str) => EmployeeUpdateDataModel.fromJson(json.decode(str));

String employeeUpdateDataModelToJson(EmployeeUpdateDataModel data) => json.encode(data.toJson());

class EmployeeUpdateDataModel {
  EmployeeUpdateDataModel({
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

  factory EmployeeUpdateDataModel.fromJson(Map<String, dynamic> json) => EmployeeUpdateDataModel(
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
    this.designation,
    this.department,
    this.employeeMedia,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  int designationId;
  int departmentId;
  String gender;
  String contactNo;
  String employeeId;
  DateTime createdAt;
  DateTime updatedAt;
  Designation designation;
  Department department;
  List<EmployeeMedia> employeeMedia;

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
    designation: Designation.fromJson(json["designation"]),
    department: Department.fromJson(json["department"]),
    employeeMedia: List<EmployeeMedia>.from(json["employee_media"].map((x) => EmployeeMedia.fromJson(x))),
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
    "designation": designation.toJson(),
    "department": department.toJson(),
    "employee_media": List<dynamic>.from(employeeMedia.map((x) => x.toJson())),
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

class EmployeeMedia {
  EmployeeMedia({
    this.id,
    this.employeId,
    this.type,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int employeId;
  String type;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory EmployeeMedia.fromJson(Map<String, dynamic> json) => EmployeeMedia(
    id: json["id"],
    employeId: json["employe_id"],
    type: json["type"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employe_id": employeId,
    "type": type,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

// To parse this JSON data, do
//
//     final attandanceListModel = attandanceListModelFromJson(jsonString);

import 'dart:convert';

AttandanceListModel attandanceListModelFromJson(String str) => AttandanceListModel.fromJson(json.decode(str));

String attandanceListModelToJson(AttandanceListModel data) => json.encode(data.toJson());

class AttandanceListModel {
  AttandanceListModel({
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

  factory AttandanceListModel.fromJson(Map<String, dynamic> json) => AttandanceListModel(
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
    this.img,
    this.checkIn,
    this.checkOut,
    this.designation,
    this.department,
    this.employeeMedia,
    this.employeeAttendance,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  int designationId;
  int departmentId;
  Gender gender;
  String contactNo;
  String employeeId;
  DateTime createdAt;
  DateTime updatedAt;
  String img;
  dynamic checkIn;
  dynamic checkOut;
  Designation designation;
  Department department;
  List<EmployeeMedia> employeeMedia;
  List<dynamic> employeeAttendance;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    designationId: json["designation_id"],
    departmentId: json["department_id"],
    gender: genderValues.map[json["gender"]],
    contactNo: json["contact_no"],
    employeeId: json["employee_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    img: json["img"],
    checkIn: json["check_in"],
    checkOut: json["check_out"],
    designation: Designation.fromJson(json["designation"]),
    department: Department.fromJson(json["department"]),
    employeeMedia: List<EmployeeMedia>.from(json["employee_media"].map((x) => EmployeeMedia.fromJson(x))),
    employeeAttendance: List<dynamic>.from(json["employee_attendance"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "designation_id": designationId,
    "department_id": departmentId,
    "gender": genderValues.reverse[gender],
    "contact_no": contactNo,
    "employee_id": employeeId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "img": img,
    "check_in": checkIn,
    "check_out": checkOut,
    "designation": designation.toJson(),
    "department": department.toJson(),
    "employee_media": List<dynamic>.from(employeeMedia.map((x) => x.toJson())),
    "employee_attendance": List<dynamic>.from(employeeAttendance.map((x) => x)),
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
  StartingDate startingDate;
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
    startingDate: startingDateValues.map[json["starting_date"]],
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
    "starting_date": startingDateValues.reverse[startingDate],
    "total_employee": totalEmployee,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum StartingDate { THE_24072020, THE_22072020, THE_25072020, THE_08082020 }

final startingDateValues = EnumValues({
  "08-08-2020": StartingDate.THE_08082020,
  "22-07-2020": StartingDate.THE_22072020,
  "24-07-2020": StartingDate.THE_24072020,
  "25-07-2020": StartingDate.THE_25072020
});

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
  Type type;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory EmployeeMedia.fromJson(Map<String, dynamic> json) => EmployeeMedia(
    id: json["id"],
    employeId: json["employe_id"],
    type: typeValues.map[json["type"]],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employe_id": employeId,
    "type": typeValues.reverse[type],
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum Type { IMAGE }

final typeValues = EnumValues({
  "image": Type.IMAGE
});

enum Gender { M }

final genderValues = EnumValues({
  "m": Gender.M
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

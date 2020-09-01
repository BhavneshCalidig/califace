class EmployeeUpdateDataModel {
  bool success;
  String title;
  String message;
  EmployeupdateData employeupdateData;


  EmployeeUpdateDataModel(
      {this.success, this.title, this.message, this.employeupdateData, });

  EmployeeUpdateDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    title = json['title'];
    message = json['message'];
    employeupdateData = json['data'] != null ? new EmployeupdateData.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.employeupdateData != null) {
      data['data'] = this.employeupdateData.toJson();
    }

    return data;
  }
}

class EmployeupdateData {
  int id;
  String firstName;
  String lastName;
  String email;
  int designationId;
  int departmentId;
  String gender;
  String contactNo;
  String employeeId;
  String createdAt;
  String updatedAt;
  Designation designation;
  Department department;
  List<EmployeeMedia> employeeMedia;

  EmployeupdateData(
      {this.id,
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
        this.employeeMedia});

  EmployeupdateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    designationId = json['designation_id'];
    departmentId = json['department_id'];
    gender = json['gender'];
    contactNo = json['contact_no'];
    employeeId = json['employee_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    designation = json['designation'] != null
        ? new Designation.fromJson(json['designation'])
        : null;
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    if (json['employee_media'] != null) {
      employeeMedia = new List<EmployeeMedia>();
      json['employee_media'].forEach((v) {
        employeeMedia.add(new EmployeeMedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['designation_id'] = this.designationId;
    data['department_id'] = this.departmentId;
    data['gender'] = this.gender;
    data['contact_no'] = this.contactNo;
    data['employee_id'] = this.employeeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.designation != null) {
      data['designation'] = this.designation.toJson();
    }
    if (this.department != null) {
      data['department'] = this.department.toJson();
    }
    if (this.employeeMedia != null) {
      data['employee_media'] =
          this.employeeMedia.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Designation {
  int id;
  String title;
  String description;
  String createdAt;
  String updatedAt;

  Designation(
      {this.id, this.title, this.description, this.createdAt, this.updatedAt});

  Designation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Department {
  int id;
  String title;
  String description;
  String hod;
  String phone;
  String email;
  String startingDate;
  String totalEmployee;
  String createdAt;
  String updatedAt;

  Department(
      {this.id,
        this.title,
        this.description,
        this.hod,
        this.phone,
        this.email,
        this.startingDate,
        this.totalEmployee,
        this.createdAt,
        this.updatedAt});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    hod = json['hod'];
    phone = json['phone'];
    email = json['email'];
    startingDate = json['starting_date'];
    totalEmployee = json['total_employee'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['hod'] = this.hod;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['starting_date'] = this.startingDate;
    data['total_employee'] = this.totalEmployee;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class EmployeeMedia {
  int id;
  int employeId;
  String type;
  String name;
  String createdAt;
  String updatedAt;

  EmployeeMedia(
      {this.id,
        this.employeId,
        this.type,
        this.name,
        this.createdAt,
        this.updatedAt});

  EmployeeMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeId = json['employe_id'];
    type = json['type'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employe_id'] = this.employeId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

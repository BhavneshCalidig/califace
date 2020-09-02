class EmployeeUpdateModel {
  bool success;
  String title;
  String message;
  Data data;
  Null again;

  EmployeeUpdateModel(
      {this.success, this.title, this.message, this.data, this.again});

  EmployeeUpdateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    title = json['title'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    again = json['again'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['again'] = this.again;
    return data;
  }
}

class Data {
  int id;
  String firstName;
  String lastName;
  String email;
  String designationId;
  String departmentId;
  String gender;
  String contactNo;
  String employeeId;
  String createdAt;
  String updatedAt;

  Data(
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
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
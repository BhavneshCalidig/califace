class EmployeeStoreDataModel {
  bool success;
  String title;
  String message;
  EmployeeStoreList data;
  Null again;

  EmployeeStoreDataModel(
      {this.success, this.title, this.message, this.data, this.again});

  EmployeeStoreDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    title = json['title'];
    message = json['message'];
    data = json['data'] != null ? new EmployeeStoreList.fromJson(json['data']) : null;
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

class EmployeeStoreList {
  String firstName;
  String lastName;
  String email;
  String gender;
  String departmentId;
  String designationId;
  String contactNo;
  String employeeId;
  String updatedAt;
  String createdAt;
  int id;

  EmployeeStoreList(
      {this.firstName,
        this.lastName,
        this.email,
        this.gender,
        this.departmentId,
        this.designationId,
        this.contactNo,
        this.employeeId,
        this.updatedAt,
        this.createdAt,
        this.id});

  EmployeeStoreList.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    departmentId = json['department_id'];
    designationId = json['designation_id'];
    contactNo = json['contact_no'];
    employeeId = json['employee_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['department_id'] = this.departmentId;
    data['designation_id'] = this.designationId;
    data['contact_no'] = this.contactNo;
    data['employee_id'] = this.employeeId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

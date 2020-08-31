class DepartmentListDataModel {
  bool success;
  String title;
  String message;
  List<DepartmentListData> departmentListData;
  Null again;

  DepartmentListDataModel(
      {this.success, this.title, this.message, this.departmentListData, this.again});

  DepartmentListDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    title = json['title'];
    message = json['message'];
    if (json['data'] != null) {
      departmentListData = new List<DepartmentListData>();
      json['data'].forEach((v) {
        departmentListData.add(new DepartmentListData.fromJson(v));
      });
    }
    again = json['again'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.departmentListData != null) {
      data['data'] = this.departmentListData.map((v) => v.toJson()).toList();
    }
    data['again'] = this.again;
    return data;
  }
}

class DepartmentListData {
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

  DepartmentListData(
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

  DepartmentListData.fromJson(Map<String, dynamic> json) {
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

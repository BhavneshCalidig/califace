class DepartmentStoreDataModel {
  bool success;
  String title;
  String message;
  Data data;


  DepartmentStoreDataModel(
      {this.success, this.title, this.message, this.data, });

  DepartmentStoreDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    title = json['title'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }

    return data;
  }
}

class Data {
  String title;
  String description;
  String hod;
  String phone;
  String email;
  String startingDate;
  String totalEmployee;
  String updatedAt;
  String createdAt;
  int id;

  Data(
      {this.title,
        this.description,
        this.hod,
        this.phone,
        this.email,
        this.startingDate,
        this.totalEmployee,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    hod = json['hod'];
    phone = json['phone'];
    email = json['email'];
    startingDate = json['starting_date'];
    totalEmployee = json['total_employee'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['hod'] = this.hod;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['starting_date'] = this.startingDate;
    data['total_employee'] = this.totalEmployee;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
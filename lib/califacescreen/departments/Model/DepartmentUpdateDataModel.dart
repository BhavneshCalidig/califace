class DepartmentUpdateDataModel {
  bool success;
  String title;
  String message;
  Departmentupdatedata departmentupdatedata;


  DepartmentUpdateDataModel(
      {this.success, this.title, this.message, this.departmentupdatedata,});

  DepartmentUpdateDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    title = json['title'];
    message = json['message'];
    departmentupdatedata = json['data'] != null ? new Departmentupdatedata.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.departmentupdatedata != null) {
      data['data'] = this.departmentupdatedata.toJson();
    }

    return data;
  }
}

class Departmentupdatedata {
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

  Departmentupdatedata(
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

  Departmentupdatedata.fromJson(Map<String, dynamic> json) {
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
class DesignationUpdateModel {
  bool success;
  String title;
  String message;
  Data data;
  Null again;

  DesignationUpdateModel(
      {this.success, this.title, this.message, this.data, this.again});

  DesignationUpdateModel.fromJson(Map<String, dynamic> json) {
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
  String title;
  String description;
  String createdAt;
  String updatedAt;

  Data({this.id, this.title, this.description, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
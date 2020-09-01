class DesignationlistModel {
  bool success;
  String title;
  String message;
  List<DesignationList> designationList;


  DesignationlistModel(
      {this.success, this.title, this.message, this.designationList, });

  DesignationlistModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    title = json['title'];
    message = json['message'];
    if (json['data'] != null) {
      designationList = new List<DesignationList>();
      json['data'].forEach((v) {
        designationList.add(new DesignationList.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.designationList != null) {
      data['data'] = this.designationList.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class DesignationList {
  int id;
  String title;
  String description;
  String createdAt;
  String updatedAt;

  DesignationList({this.id, this.title, this.description, this.createdAt, this.updatedAt});

  DesignationList.fromJson(Map<String, dynamic> json) {
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
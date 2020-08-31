class CameraDeleteModel {
  bool success;
  String title;
  String message;
  bool data;
  Null again;

  CameraDeleteModel(
      {this.success, this.title, this.message, this.data, this.again});

  CameraDeleteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    title = json['title'];
    message = json['message'];
    data = json['data'];
    again = json['again'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['title'] = this.title;
    data['message'] = this.message;
    data['data'] = this.data;
    data['again'] = this.again;
    return data;
  }
}
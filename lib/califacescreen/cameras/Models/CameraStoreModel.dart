class CameraStoreModel {
  bool success;
  String title;
  String message;
  Data data;


  CameraStoreModel(
      {this.success, this.title, this.message, this.data, });

  CameraStoreModel.fromJson(Map<String, dynamic> json) {
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
  String cameraIp;
  String status;
  String protocol;
  String port;
  String updatedAt;
  String createdAt;
  int id;

  Data(
      {this.cameraIp,
        this.status,
        this.protocol,
        this.port,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    cameraIp = json['camera_ip'];
    status = json['status'];
    protocol = json['protocol'];
    port = json['port'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['camera_ip'] = this.cameraIp;
    data['status'] = this.status;
    data['protocol'] = this.protocol;
    data['port'] = this.port;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

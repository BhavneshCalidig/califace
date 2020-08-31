class CameraUpdateDataModel {
  bool success;
  String title;
  String message;
  CameraData cameraData;
  Null again;

  CameraUpdateDataModel(
      {this.success, this.title, this.message, this.cameraData, this.again});

  CameraUpdateDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    title = json['title'];
    message = json['message'];
    cameraData = json['data'] != null ? new CameraData.fromJson(json['data']) : null;
    again = json['again'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.cameraData != null) {
      data['data'] = this.cameraData.toJson();
    }
    data['again'] = this.again;
    return data;
  }
}

class  CameraData {
  int id;
  String cameraIp;
  String status;
  String createdAt;
  String updatedAt;
  String protocol;
  String port;

  CameraData(
      {this.id,
        this.cameraIp,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.protocol,
        this.port});

  CameraData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cameraIp = json['camera_ip'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    protocol = json['protocol'];
    port = json['port'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['camera_ip'] = this.cameraIp;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['protocol'] = this.protocol;
    data['port'] = this.port;
    return data;
  }
}
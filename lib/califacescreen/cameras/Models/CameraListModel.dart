class CameraListModel {
  bool success;
  String title;
  String message;
  List<CameraList> cameralist;


  CameraListModel(
      {this.success, this.title, this.message, this.cameralist, });

  CameraListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    title = json['title'];
    message = json['message'];
    if (json['data'] != null) {
      cameralist = new List<CameraList>();
      json['data'].forEach((v) {
        cameralist.add(new CameraList.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.cameralist != null) {
      data['data'] = this.cameralist.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class CameraList {
  int id;
  String cameraIp;
  String status;
  String createdAt;
  String updatedAt;
  String protocol;
  String port;

  CameraList(
      {this.id,
        this.cameraIp,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.protocol,
        this.port});

  CameraList.fromJson(Map<String, dynamic> json) {
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

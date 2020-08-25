import 'dart:convert';

CameraUpdateModel cameraUpdateModelFromJson(String str) => CameraUpdateModel.fromJson(json.decode(str));

String cameraUpdateModelToJson(CameraUpdateModel data) => json.encode(data.toJson());

class CameraUpdateModel {
  CameraUpdateModel({
    this.success,
    this.title,
    this.message,
    this.data,
    this.again,
  });

  bool success;
  String title;
  String message;
  Data data;
  dynamic again;

  factory CameraUpdateModel.fromJson(Map<String, dynamic> json) => CameraUpdateModel(
    success: json["success"],
    title: json["title"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    again: json["again"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "title": title,
    "message": message,
    "data": data.toJson(),
    "again": again,
  };
}

class Data {
  Data({
    this.id,
    this.cameraIp,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.protocol,
    this.port,
  });

  int id;
  String cameraIp;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String protocol;
  String port;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    cameraIp: json["camera_ip"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    protocol: json["protocol"],
    port: json["port"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "camera_ip": cameraIp,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "protocol": protocol,
    "port": port,
  };
}

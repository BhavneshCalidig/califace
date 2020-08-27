
import 'dart:convert';

CameraListModel cameraListModelFromJson(String str) => CameraListModel.fromJson(json.decode(str));

String cameraListModelToJson(CameraListModel data) => json.encode(data.toJson());

class CameraListModel {
  CameraListModel({
    this.success,
    this.title,
    this.message,
    this.data,
    this.again,
  });

  bool success;
  String title;
  String message;
  List<Datum> data;
  dynamic again;

  factory CameraListModel.fromJson(Map<String, dynamic> json) => CameraListModel(
    success: json["success"],
    title: json["title"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    again: json["again"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "title": title,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "again": again,
  };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    cameraIp: json["camera_ip"],
    status: json["status"] == null ? null : json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    protocol: json["protocol"] == null ? null : json["protocol"],
    port: json["port"] == null ? null : json["port"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "camera_ip": cameraIp,
    "status": status == null ? null : status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "protocol": protocol == null ? null : protocol,
    "port": port == null ? null : port,
  };
}

// To parse this JSON data, do
//
//     final cameraStoreModel = cameraStoreModelFromJson(jsonString);

import 'dart:convert';

CameraStoreModel cameraStoreModelFromJson(String str) => CameraStoreModel.fromJson(json.decode(str));

String cameraStoreModelToJson(CameraStoreModel data) => json.encode(data.toJson());

class CameraStoreModel {
  CameraStoreModel({
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

  factory CameraStoreModel.fromJson(Map<String, dynamic> json) => CameraStoreModel(
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
    this.cameraIp,
    this.status,
    this.protocol,
    this.port,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String cameraIp;
  String status;
  String protocol;
  String port;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cameraIp: json["camera_ip"],
    status: json["status"],
    protocol: json["protocol"],
    port: json["port"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "camera_ip": cameraIp,
    "status": status,
    "protocol": protocol,
    "port": port,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}

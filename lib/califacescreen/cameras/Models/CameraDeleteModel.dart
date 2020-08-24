
import 'dart:convert';

CameraDeleteModel cameraDeleteModelFromJson(String str) => CameraDeleteModel.fromJson(json.decode(str));

String cameraDeleteModelToJson(CameraDeleteModel data) => json.encode(data.toJson());

class CameraDeleteModel {
  CameraDeleteModel({
    this.success,
    this.title,
    this.message,
    this.data,
    this.again,
  });

  bool success;
  String title;
  String message;
  bool data;
  dynamic again;

  factory CameraDeleteModel.fromJson(Map<String, dynamic> json) => CameraDeleteModel(
    success: json["success"],
    title: json["title"],
    message: json["message"],
    data: json["data"],
    again: json["again"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "title": title,
    "message": message,
    "data": data,
    "again": again,
  };
}
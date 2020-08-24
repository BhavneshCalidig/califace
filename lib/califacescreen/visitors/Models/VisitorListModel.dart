import 'dart:convert';

VisitorListModel visitorListModelFromJson(String str) => VisitorListModel.fromJson(json.decode(str));

String visitorListModelToJson(VisitorListModel data) => json.encode(data.toJson());

class VisitorListModel {
  VisitorListModel({
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

  factory VisitorListModel.fromJson(Map<String, dynamic> json) => VisitorListModel(
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
    this.img,
    this.createdAt,
    this.updatedAt,
    this.checkIn,
    this.checkOut,
    this.lastVisitingDate,
    this.visitorLog,
  });

  int id;
  String img;
  DateTime createdAt;
  DateTime updatedAt;
  String checkIn;
  String checkOut;
  String lastVisitingDate;
  List<VisitorLog> visitorLog;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    img: json["img"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    checkIn: json["check_in"] == null ? null : json["check_in"],
    checkOut: json["check_out"] == null ? null : json["check_out"],
    lastVisitingDate: json["last_visiting_date"] == null ? null : json["last_visiting_date"],
    visitorLog: List<VisitorLog>.from(json["visitor_log"].map((x) => VisitorLog.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img": img,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "check_in": checkIn == null ? null : checkIn,
    "check_out": checkOut == null ? null : checkOut,
    "last_visiting_date": lastVisitingDate == null ? null : lastVisitingDate,
    "visitor_log": List<dynamic>.from(visitorLog.map((x) => x.toJson())),
  };
}

class VisitorLog {
  VisitorLog({
    this.id,
    this.visitorId,
    this.status,
    this.liveness,
    this.fever,
    this.cameraIp,
    this.frame,
    this.temperature,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int visitorId;
  int status;
  int liveness;
  int fever;
  String cameraIp;
  String frame;
  String temperature;
  DateTime createdAt;
  DateTime updatedAt;

  factory VisitorLog.fromJson(Map<String, dynamic> json) => VisitorLog(
    id: json["id"],
    visitorId: json["visitor_id"],
    status: json["status"] == null ? null : json["status"],
    liveness: json["liveness"],
    fever: json["fever"],
    cameraIp: json["camera_ip"],
    frame: json["frame"],
    temperature: json["temperature"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "visitor_id": visitorId,
    "status": status == null ? null : status,
    "liveness": liveness,
    "fever": fever,
    "camera_ip": cameraIp,
    "frame": frame,
    "temperature": temperature,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

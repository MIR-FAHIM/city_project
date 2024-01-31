// To parse this JSON data, do
//
//     final disableDateModel = disableDateModelFromJson(jsonString);

import 'dart:convert';

DisableDateModel disableDateModelFromJson(String str) => DisableDateModel.fromJson(json.decode(str));

String disableDateModelToJson(DisableDateModel data) => json.encode(data.toJson());

class DisableDateModel {
  int status;
  List<DisableDate> dates;

  DisableDateModel({
    required this.status,
    required this.dates,
  });

  factory DisableDateModel.fromJson(Map<String, dynamic> json) => DisableDateModel(
    status: json["status"],
    dates: List<DisableDate>.from(json["dates"].map((x) => DisableDate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
  };
}

class DisableDate {
  int id;
  String listerId;
  String listingId;
  String? dates;
  DateTime createdAt;
  DateTime updatedAt;

  DisableDate({
    required this.id,
    required this.listerId,
    required this.listingId,
     this.dates,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DisableDate.fromJson(Map<String, dynamic> json) => DisableDate(
    id: json["id"],
    listerId: json["lister_id"],
    listingId: json["listing_id"],
    dates: json["dates"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lister_id": listerId,
    "listing_id": listingId,
    "dates": dates,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

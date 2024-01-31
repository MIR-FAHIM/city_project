// To parse this JSON data, do
//
//     final getCoverImage = getCoverImageFromJson(jsonString);

import 'dart:convert';

GetCoverImage getCoverImageFromJson(String str) => GetCoverImage.fromJson(json.decode(str));

String getCoverImageToJson(GetCoverImage data) => json.encode(data.toJson());

class GetCoverImage {
  bool? status;
  List<Messege>? messege;

  GetCoverImage({
     this.status,
     this.messege,
  });

  factory GetCoverImage.fromJson(Map<String, dynamic> json) => GetCoverImage(
    status: json["status"],
    messege: List<Messege>.from(json["messege"].map((x) => Messege.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "messege": List<dynamic>.from(messege!.map((x) => x.toJson())),
  };
}

class Messege {
  int id;
  String userId;
  String userFilename;
  String userTargetlocation;
  DateTime createdAt;
  DateTime updatedAt;

  Messege({
    required this.id,
    required this.userId,
    required this.userFilename,
    required this.userTargetlocation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Messege.fromJson(Map<String, dynamic> json) => Messege(
    id: json["id"],
    userId: json["user_id"],
    userFilename: json["user_filename"],
    userTargetlocation: json["user_targetlocation"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "user_filename": userFilename,
    "user_targetlocation": userTargetlocation,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

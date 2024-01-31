// To parse this JSON data, do
//
//     final getUserImage = getUserImageFromJson(jsonString);

import 'dart:convert';

GetUserImage getUserImageFromJson(String str) => GetUserImage.fromJson(json.decode(str));

String getUserImageToJson(GetUserImage data) => json.encode(data.toJson());

class GetUserImage {
  bool? status;
  List<Messege>? messege;

  GetUserImage({
     this.status,
     this.messege,
  });

  factory GetUserImage.fromJson(Map<String, dynamic> json) => GetUserImage(
    status: json["status"],
    messege: List<Messege>.from(json["messege"].map((x) => Messege.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "messege": List<dynamic>.from(messege!.map((x) => x.toJson())),
  };
}

class Messege {
  String userPictureId;
  String userId;
  String userFilename;
  String userTargetlocation;
  DateTime createdAt;
  DateTime updatedAt;

  Messege({
    required this.userPictureId,
    required this.userId,
    required this.userFilename,
    required this.userTargetlocation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Messege.fromJson(Map<String, dynamic> json) => Messege(
    userPictureId: json["user_picture_id"],
    userId: json["user_id"],
    userFilename: json["user_filename"],
    userTargetlocation: json["user_targetlocation"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "user_picture_id": userPictureId,
    "user_id": userId,
    "user_filename": userFilename,
    "user_targetlocation": userTargetlocation,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

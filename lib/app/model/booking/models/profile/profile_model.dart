// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  List<UserDatum>? userData;
  List<dynamic>? userNid;
  List<UserPicture>? userPictures;

  ProfileModel({
     this.userData,
     this.userNid,
     this.userPictures,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    userData: List<UserDatum>.from(json["user_data"].map((x) => UserDatum.fromJson(x))),
    userNid: List<dynamic>.from(json["user_nid"].map((x) => x)),
    userPictures: List<UserPicture>.from(json["user_pictures"].map((x) => UserPicture.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user_data": List<dynamic>.from(userData!.map((x) => x.toJson())),
    "user_nid": List<dynamic>.from(userNid!.map((x) => x)),
    "user_pictures": List<dynamic>.from(userPictures!.map((x) => x.toJson())),
  };
}

class UserDatum {
  int id;
  String name;
  String about;
  String email;
  dynamic emailVerifiedAt;
  String phone;
  String userNid;
  DateTime userDob;
  String userAddress;
  String isLister;
  dynamic userLong;
  dynamic userLat;
  dynamic platformTag;
  dynamic fcmToken;
  dynamic accessToken;
  dynamic createdAt;
  DateTime updatedAt;

  UserDatum({
    required this.id,
    required this.name,
    required this.email,
    required this.about,
    required this.emailVerifiedAt,
    required this.phone,
    required this.userNid,
    required this.userDob,
    required this.userAddress,
    required this.isLister,
    required this.userLong,
    required this.userLat,
    required this.platformTag,
    required this.fcmToken,
    required this.accessToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
    id: json["id"],
    name: json["name"] ?? "No Data",
    email: json["email"] ?? "No Data",
    emailVerifiedAt: json["email_verified_at"],
    phone: json["phone"],
    about: json["about"] ?? "",
    userNid: json["user_nid"] ?? "No Data",
    userDob: DateTime.parse(json["user_dob"] ?? DateTime.now().toString() ),
    userAddress: json["user_address"]?? "No Data",
    isLister: json["is_lister"],
    userLong: json["user_long"],
    userLat: json["user_lat"],
    platformTag: json["platform_tag"],
    fcmToken: json["FCM_token"],
    accessToken: json["access_token"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "phone": phone,
    "about": about,
    "user_nid": userNid,
    "user_dob": "${userDob.year.toString().padLeft(4, '0')}-${userDob.month.toString().padLeft(2, '0')}-${userDob.day.toString().padLeft(2, '0')}",
    "user_address": userAddress,
    "is_lister": isLister,
    "user_long": userLong,
    "user_lat": userLat,
    "platform_tag": platformTag,
    "FCM_token": fcmToken,
    "access_token": accessToken,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
  };
}


class UserPicture {
  String userPictureId;
  String userId;
  String userFilename;
  String userTargetlocation;
  DateTime createdAt;
  DateTime updatedAt;

  UserPicture({
    required this.userPictureId,
    required this.userId,
    required this.userFilename,
    required this.userTargetlocation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserPicture.fromJson(Map<String, dynamic> json) => UserPicture(
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
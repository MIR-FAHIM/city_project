// To parse this JSON data, do
//
//     final getReviewModel = getReviewModelFromJson(jsonString);

import 'dart:convert';

GetReviewModel getReviewModelFromJson(String str) => GetReviewModel.fromJson(json.decode(str));

String getReviewModelToJson(GetReviewModel data) => json.encode(data.toJson());

class GetReviewModel {
  int? status;
  List<GetReview>? reviews;

  GetReviewModel({
     this.status,
     this.reviews,
  });

  factory GetReviewModel.fromJson(Map<String, dynamic> json) => GetReviewModel(
    status: json["status"],
    reviews: List<GetReview>.from(json["reviews"].map((x) => GetReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "reviews": List<dynamic>.from(reviews!.map((x) => x.toJson())),
  };
}

class GetReview {
  String reviewId;
  String userId;
  String userName;
  String listingId;
  dynamic listerName;
  String stars;
  String avgRating;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  GetReview({
    required this.reviewId,
    required this.userId,
    required this.userName,
    required this.listingId,
    required this.listerName,
    required this.stars,
    required this.avgRating,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory GetReview.fromJson(Map<String, dynamic> json) => GetReview(
    reviewId: json["review_id"],
    userId: json["user_id"],
    userName: json["user_name"],
    listingId: json["listing_id"],
    listerName: json["lister_name"],
    stars: json["stars"],
    avgRating: json["avg_rating"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "review_id": reviewId,
    "user_id": userId,
    "user_name": userName,
    "listing_id": listingId,
    "lister_name": listerName,
    "stars": stars,
    "avg_rating": avgRating,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toJson(),
  };
}

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String phone;
  String? userNid;
  DateTime? userDob;
  dynamic userAddress;
  String isLister;
  dynamic userLong;
  dynamic userLat;
  dynamic platformTag;
  String fcmToken;
  String accessToken;
  DateTime createdAt;
  DateTime updatedAt;
  Avatars? avatars;

  User({
    required this.id,
    required this.name,
    required this.email,
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
    required this.avatars,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    phone: json["phone"],
    userNid: json["user_nid"],
    userDob: json["user_dob"] == null ? null : DateTime.parse(json["user_dob"]),
    userAddress: json["user_address"],
    isLister: json["is_lister"],
    userLong: json["user_long"],
    userLat: json["user_lat"],
    platformTag: json["platform_tag"],
    fcmToken: json["FCM_token"] ?? "No Data",
    accessToken: json["access_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    avatars: json["avatars"] == null ? null : Avatars.fromJson(json["avatars"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "phone": phone,
    "user_nid": userNid,
    "user_dob": userDob?.toIso8601String(),
    "user_address": userAddress,
    "is_lister": isLister,
    "user_long": userLong,
    "user_lat": userLat,
    "platform_tag": platformTag,
    "FCM_token": fcmToken,
    "access_token": accessToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "avatars": avatars?.toJson(),
  };
}

class Avatars {
  String userPictureId;
  String userId;
  String userFilename;
  String userTargetlocation;
  DateTime createdAt;
  DateTime updatedAt;

  Avatars({
    required this.userPictureId,
    required this.userId,
    required this.userFilename,
    required this.userTargetlocation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Avatars.fromJson(Map<String, dynamic> json) => Avatars(
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

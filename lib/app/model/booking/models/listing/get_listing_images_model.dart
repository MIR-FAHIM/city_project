// To parse this JSON data, do
//
//     final getListingImagesModel = getListingImagesModelFromJson(jsonString);

import 'dart:convert';

GetListingImagesModel getListingImagesModelFromJson(String str) => GetListingImagesModel.fromJson(json.decode(str));

String getListingImagesModelToJson(GetListingImagesModel data) => json.encode(data.toJson());

class GetListingImagesModel {
  int status;
  List<ListingImage> listingImages;

  GetListingImagesModel({
    required this.status,
    required this.listingImages,
  });

  factory GetListingImagesModel.fromJson(Map<String, dynamic> json) => GetListingImagesModel(
    status: json["status"],
    listingImages: List<ListingImage>.from(json["listing_images"].map((x) => ListingImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "listing_images": List<dynamic>.from(listingImages.map((x) => x.toJson())),
  };
}

class ListingImage {
  String listingImgId;
  String listingId;
  String listerId;
  String listingFilename;
  String listingTargetlocation;
  DateTime createdAt;
  DateTime updatedAt;

  ListingImage({
    required this.listingImgId,
    required this.listingId,
    required this.listerId,
    required this.listingFilename,
    required this.listingTargetlocation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ListingImage.fromJson(Map<String, dynamic> json) => ListingImage(
    listingImgId: json["listing_img_id"],
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listingFilename: json["listing_filename"],
    listingTargetlocation: json["listing_targetlocation"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "listing_img_id": listingImgId,
    "listing_id": listingId,
    "lister_id": listerId,
    "listing_filename": listingFilename,
    "listing_targetlocation": listingTargetlocation,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

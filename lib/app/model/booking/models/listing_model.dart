// To parse this JSON data, do
//
//     final listingMOdel = listingMOdelFromJson(jsonString);

import 'dart:convert';

ListingMOdel listingMOdelFromJson(String str) => ListingMOdel.fromJson(json.decode(str));

String listingMOdelToJson(ListingMOdel data) => json.encode(data.toJson());

class ListingMOdel {
  List<Listing> listings;

  ListingMOdel({
    required this.listings,
  });

  factory ListingMOdel.fromJson(Map<String, dynamic> json) => ListingMOdel(
    listings: List<Listing>.from(json["listings"].map((x) => Listing.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listings": List<dynamic>.from(listings.map((x) => x.toJson())),
  };
}

class Listing {
  String listingId;
  String listerId;
  String listerName;
  String guestNum;
  String bedNum;
  String bathroomNum;
  String listingTitle;
  String listingDescription;
  String fullDayPriceSetByUser;
  String listingAddress;
  String zipCode;
  String district;
  String town;
  String allowShortStay;
  String describePeaceful;
  String describeUnique;
  String describeFamilyfriendly;
  String describeStylish;
  String describeCentral;
  String describeSpacious;
  String bathroomPrivate;
  String breakfastAvailability;
  String roomLock;
  String whoElseMightBeThere;
  String listingType;
  List<Image> images;

  Listing({
    required this.listingId,
    required this.listerId,
    required this.listerName,
    required this.guestNum,
    required this.bedNum,
    required this.bathroomNum,
    required this.listingTitle,
    required this.listingDescription,
    required this.fullDayPriceSetByUser,
    required this.listingAddress,
    required this.zipCode,
    required this.district,
    required this.town,
    required this.allowShortStay,
    required this.describePeaceful,
    required this.describeUnique,
    required this.describeFamilyfriendly,
    required this.describeStylish,
    required this.describeCentral,
    required this.describeSpacious,
    required this.bathroomPrivate,
    required this.breakfastAvailability,
    required this.roomLock,
    required this.whoElseMightBeThere,
    required this.listingType,
    required this.images,
  });

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listerName: json["lister_name"],
    guestNum: json["guest_num"],
    bedNum: json["bed_num"],
    bathroomNum: json["bathroom_num"],
    listingTitle: json["listing_title"],
    listingDescription: json["listing_description"],
    fullDayPriceSetByUser: json["full_day_price_set_by_user"],
    listingAddress: json["listing_address"],
    zipCode: json["zip_code"],
    district: json["district"],
    town: json["town"],
    allowShortStay: json["allow_short_stay"],
    describePeaceful: json["describe_peaceful"],
    describeUnique: json["describe_unique"],
    describeFamilyfriendly: json["describe_familyfriendly"],
    describeStylish: json["describe_stylish"],
    describeCentral: json["describe_central"],
    describeSpacious: json["describe_spacious"],
    bathroomPrivate: json["bathroom_private"] ?? "No Data" ,
    breakfastAvailability: json["breakfast_availability"] ?? "No Data",
    roomLock: json["room_lock"] ??"No Data",
    whoElseMightBeThere: json["who_else_might_be_there"] ?? "No Data",
    listingType: json["listing_type"] ?? "No Data",
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId,
    "lister_id": listerId,
    "lister_name": listerName,
    "guest_num": guestNum,
    "bed_num": bedNum,
    "bathroom_num": bathroomNum,
    "listing_title": listingTitle,
    "listing_description": listingDescription,
    "full_day_price_set_by_user": fullDayPriceSetByUser,
    "listing_address": listingAddress,
    "zip_code": zipCode,
    "district": district,
    "town": town,
    "allow_short_stay": allowShortStay,
    "describe_peaceful": describePeaceful,
    "describe_unique": describeUnique,
    "describe_familyfriendly": describeFamilyfriendly,
    "describe_stylish": describeStylish,
    "describe_central": describeCentral,
    "describe_spacious": describeSpacious,
    "bathroom_private": bathroomPrivate,
    "breakfast_availability": breakfastAvailability,
    "room_lock": roomLock,
    "who_else_might_be_there": whoElseMightBeThere,
    "listing_type": listingType,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  String listingImgId;
  String listingId;
  String listerId;
  String listingFilename;
  String listingTargetlocation;

  Image({
    required this.listingImgId,
    required this.listingId,
    required this.listerId,
    required this.listingFilename,
    required this.listingTargetlocation,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    listingImgId: json["listing_img_id"],
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listingFilename: json["listing_filename"],
    listingTargetlocation: json["listing_targetlocation"],
  );

  Map<String, dynamic> toJson() => {
    "listing_img_id": listingImgId,
    "listing_id": listingId,
    "lister_id": listerId,
    "listing_filename": listingFilename,
    "listing_targetlocation": listingTargetlocation,
  };
}

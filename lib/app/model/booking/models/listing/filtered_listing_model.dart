// To parse this JSON data, do
//
//     final getListingFilterModel = getListingFilterModelFromJson(jsonString);

import 'dart:convert';

GetListingFilterModel getListingFilterModelFromJson(String str) => GetListingFilterModel.fromJson(json.decode(str));

String getListingFilterModelToJson(GetListingFilterModel data) => json.encode(data.toJson());

class GetListingFilterModel {
  int? status;
  List<FilteredListing>? filteredListing;

  GetListingFilterModel({
     this.status,
     this.filteredListing,
  });

  factory GetListingFilterModel.fromJson(Map<String, dynamic> json) => GetListingFilterModel(
    status: json["status"],
    filteredListing: List<FilteredListing>.from(json["filtered_listing"].map((x) => FilteredListing.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "filtered_listing": List<dynamic>.from(filteredListing!.map((x) => x.toJson())),
  };
}

class FilteredListing {
  String listingId;
  String listerId;
  String listerName;
  dynamic nidNumber;
  String? guestNum;
  String? bedNum;
  String? bathroomNum;
  String listingTitle;
  String listingDescription;
  String fullDayPriceSetByUser;
  String discountPrice;
  String listingAddress;
  String? district;
  String? town;
  String? zipCode;
  String allowShortStay;
  String describePeaceful;
  String describeUnique;
  String describeFamilyfriendly;
  String describeStylish;
  String describeCentral;
  String describeSpacious;
  String privateBathroom;
  String doorLock;
  String breakfastIncluded;
  String unknownGuestEntry;
  String listingType;
  String videoLink;
  String? lat;
  String? long;
  String isApproved;
  String isActive;
  DateTime createdAt;
  DateTime updatedAt;
  List<Image> images;
  Amenities amenities;
  Restrictions restrictions;
  List<Review> reviews;

  FilteredListing({
    required this.listingId,
    required this.listerId,
    required this.listerName,
    required this.nidNumber,
    required this.guestNum,
    required this.bedNum,
    required this.bathroomNum,
    required this.listingTitle,
    required this.listingDescription,
    required this.fullDayPriceSetByUser,
    required this.discountPrice,
    required this.listingAddress,
    required this.district,
    required this.town,
    required this.zipCode,
    required this.allowShortStay,
    required this.describePeaceful,
    required this.describeUnique,
    required this.describeFamilyfriendly,
    required this.describeStylish,
    required this.describeCentral,
    required this.describeSpacious,
    required this.privateBathroom,
    required this.doorLock,
    required this.breakfastIncluded,
    required this.unknownGuestEntry,
    required this.listingType,
    required this.videoLink,
    required this.lat,
    required this.long,
    required this.isApproved,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
    required this.amenities,
    required this.restrictions,
    required this.reviews,
  });

  factory FilteredListing.fromJson(Map<String, dynamic> json) => FilteredListing(
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listerName: json["lister_name"],
    nidNumber: json["nid_number"],
    guestNum: json["guest_num"],
    bedNum: json["bed_num"],
    bathroomNum: json["bathroom_num"],
    listingTitle: json["listing_title"],
    listingDescription: json["listing_description"] ?? "No Data",
    fullDayPriceSetByUser: json["full_day_price_set_by_user"],
    discountPrice: json["discount_price"] ?? "0.0",
    listingAddress: json["listing_address"] ??"no",
    district: json["district"]?? "No Data",
    town: json["town"]?? "No Data",
    zipCode: json["zip_code"],
    allowShortStay: json["allow_short_stay"] ?? "0",
    describePeaceful: json["describe_peaceful"],
    describeUnique: json["describe_unique"],
    describeFamilyfriendly: json["describe_familyfriendly"],
    describeStylish: json["describe_stylish"],
    describeCentral: json["describe_central"],
    describeSpacious: json["describe_spacious"],
    privateBathroom: json["private_bathroom"],
    doorLock: json["door_lock"],
    breakfastIncluded: json["breakfast_included"],
    unknownGuestEntry: json["unknown_guest_entry"],
    listingType: json["listing_type"]!,
    videoLink: json["video_link"]??"no",
    lat: json["lat"] ?? "0.000000",
    long: json["long"] ?? "0.000000",
    isApproved: json["isApproved"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    amenities: Amenities.fromJson(json["amenities"]),
    restrictions: Restrictions.fromJson(json["restrictions"]),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId,
    "lister_id": listerId,
    "lister_name": listerName,
    "nid_number": nidNumber,
    "guest_num": guestNum,
    "bed_num": bedNum,
    "bathroom_num": bathroomNum,
    "listing_title": listingTitle,
    "listing_description": listingDescription,
    "full_day_price_set_by_user": fullDayPriceSetByUser,
    "discount_price": discountPrice,
    "listing_address": listingAddress,
    "district": district,
    "town": town,
    "zip_code": zipCode,
    "allow_short_stay": allowShortStay,
    "describe_peaceful": describePeaceful,
    "describe_unique": describeUnique,
    "describe_familyfriendly": describeFamilyfriendly,
    "describe_stylish": describeStylish,
    "describe_central": describeCentral,
    "describe_spacious": describeSpacious,
    "private_bathroom": privateBathroom,
    "door_lock": doorLock,
    "breakfast_included": breakfastIncluded,
    "unknown_guest_entry": unknownGuestEntry,
    "listing_type": listingType,
    "video_link": videoLink,
    "lat": lat,
    "long": long,
    "isApproved": isApproved,
    "isActive": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "amenities": amenities.toJson(),
    "restrictions": restrictions.toJson(),
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
  };
}

class Amenities {
  int id;
  String listingId;
  String wifi;
  String tv;
  String kitchen;
  String washingMachine;
  String freeParking;
  String dedicatedWorkspace;
  String pool;
  String hotTub;
  String patio;
  String bbqGrill;
  String outdooring;
  String firePit;
  String gym;
  String beachLakeAccess;
  String breakfastIncluded;
  String airCondition;
  String smokeAlarm;
  String firstAid;
  String fireExtinguish;
  String cctv;
  DateTime createdAt;
  DateTime updatedAt;

  Amenities({
    required this.id,
    required this.listingId,
    required this.wifi,
    required this.tv,
    required this.kitchen,
    required this.washingMachine,
    required this.freeParking,
    required this.dedicatedWorkspace,
    required this.pool,
    required this.hotTub,
    required this.patio,
    required this.bbqGrill,
    required this.outdooring,
    required this.firePit,
    required this.gym,
    required this.beachLakeAccess,
    required this.breakfastIncluded,
    required this.airCondition,
    required this.smokeAlarm,
    required this.firstAid,
    required this.fireExtinguish,
    required this.cctv,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Amenities.fromJson(Map<String, dynamic> json) => Amenities(
    id: json["id"],
    listingId: json["listing_id"],
    wifi: json["wifi"],
    tv: json["tv"],
    kitchen: json["kitchen"],
    washingMachine: json["washing_machine"],
    freeParking: json["free_parking"],
    dedicatedWorkspace: json["dedicated_workspace"],
    pool: json["pool"],
    hotTub: json["hot_tub"],
    patio: json["patio"],
    bbqGrill: json["bbq_grill"],
    outdooring: json["outdooring"],
    firePit: json["fire_pit"],
    gym: json["gym"],
    beachLakeAccess: json["beach_lake_access"],
    breakfastIncluded: json["breakfast_included"],
    airCondition: json["air_condition"],
    smokeAlarm: json["smoke_alarm"],
    firstAid: json["first_aid"],
    fireExtinguish: json["fire_extinguish"],
    cctv: json["cctv"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "listing_id": listingId,
    "wifi": wifi,
    "tv": tv,
    "kitchen": kitchen,
    "washing_machine": washingMachine,
    "free_parking": freeParking,
    "dedicated_workspace": dedicatedWorkspace,
    "pool": pool,
    "hot_tub": hotTub,
    "patio": patio,
    "bbq_grill": bbqGrill,
    "outdooring": outdooring,
    "fire_pit": firePit,
    "gym": gym,
    "beach_lake_access": beachLakeAccess,
    "breakfast_included": breakfastIncluded,
    "air_condition": airCondition,
    "smoke_alarm": smokeAlarm,
    "first_aid": firstAid,
    "fire_extinguish": fireExtinguish,
    "cctv": cctv,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum District {
  DHAKA
}

final districtValues = EnumValues({
  "Dhaka": District.DHAKA
});

class Image {
  String listingImgId;
  String listingId;
  String listerId;
  String listingFilename;
  String listingTargetlocation;
  DateTime createdAt;
  DateTime updatedAt;

  Image({
    required this.listingImgId,
    required this.listingId,
    required this.listerId,
    required this.listingFilename,
    required this.listingTargetlocation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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

enum ListingType {
  APARTMENT,
  FLAT,
  HOUSE,
  ROOM
}

final listingTypeValues = EnumValues({
  "apartment": ListingType.APARTMENT,
  "Flat": ListingType.FLAT,
  "House": ListingType.HOUSE,
  "room": ListingType.ROOM
});

class Restrictions {
  int id;
  String listingId;
  String indoorSmoking;
  String party;
  String pets;
  String lateNightEntry;
  String unknownGuestEntry;
  String specificRequirement;
  DateTime createdAt;
  DateTime updatedAt;

  Restrictions({
    required this.id,
    required this.listingId,
    required this.indoorSmoking,
    required this.party,
    required this.pets,
    required this.lateNightEntry,
    required this.unknownGuestEntry,
    required this.specificRequirement,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Restrictions.fromJson(Map<String, dynamic> json) => Restrictions(
    id: json["id"],
    listingId: json["listing_id"],
    indoorSmoking: json["indoor_smoking"],
    party: json["party"],
    pets: json["pets"],
    lateNightEntry: json["late_night_entry"],
    unknownGuestEntry: json["unknown_guest_entry"],
    specificRequirement: json["specific_requirement"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "listing_id": listingId,
    "indoor_smoking": indoorSmoking,
    "party": party,
    "pets": pets,
    "late_night_entry": lateNightEntry,
    "unknown_guest_entry": unknownGuestEntry,
    "specific_requirement": specificRequirement,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Review {
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

  Review({
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
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    reviewId: json["review_id"],
    userId: json["user_id"],
    userName: json["user_name"],
    listingId: json["listing_id"],
    listerName: json["lister_name"],
    stars: json["stars"],
    avgRating: json["avg_rating"] ?? "0.0",
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// To parse this JSON data, do
//
//     final bookingHistory = bookingHistoryFromJson(jsonString);

import 'dart:convert';

BookingHistory bookingHistoryFromJson(String str) => BookingHistory.fromJson(json.decode(str));

String bookingHistoryToJson(BookingHistory data) => json.encode(data.toJson());

class BookingHistory {
  bool? status;
  List<Booking>? bookings;

  BookingHistory({
     this.status,
     this.bookings,
  });

  factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
    status: json["status"],
    bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "bookings": List<dynamic>.from(bookings!.map((x) => x.toJson())),
  };
}

class Booking {
  String? bookingId;
  String? bookingOrderName;
  String? transactionId;
  String? userId;
  String? listingId;
  String? listerId;
  String? isApproved;
  String? isComplete;
  String? shortStayFlag;
  String? allDayFlag;
  String? daysStayed;
  String? dateEnter;
  String? dateExit;
  String? tier;
  String? bookingStatus;
  String? payAmount;
  String? paymentFlag;
  DateTime? createdAt;
  DateTime? updatedAt;
  Listings? listings;

  Booking({
     this.bookingId,
     this.bookingOrderName,
     this.transactionId,
     this.userId,
    this.isApproved,
    this.isComplete,
     this.listingId,
     this.listerId,
     this.shortStayFlag,
     this.allDayFlag,
     this.daysStayed,
     this.dateEnter,
     this.dateExit,
     this.tier,
     this.payAmount,
     this.paymentFlag,
     this.createdAt,
     this.updatedAt,
     this.listings,
    this.bookingStatus
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    bookingId: json["booking_id"],
    bookingOrderName: json["booking_order_name"],
    transactionId: json["transaction_id"],
    userId: json["user_id"],
    listingId: json["listing_id"],
    isApproved: json["isApproved"],
    isComplete: json["isComplete"],

    listerId: json["lister_id"],
    shortStayFlag: json["short_stay_flag"],
    allDayFlag: json["all_day_flag"],
    daysStayed: json["days_stayed"] ?? "No Data",
    dateEnter: json["date_enter"],
    dateExit: json["date_exit"],
    tier: json["tier"],
    bookingStatus: json["booking_status"],
    payAmount: json["pay_amount"],
    paymentFlag: json["payment_flag"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    listings: Listings.fromJson(json["listings"]),
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "booking_order_name": bookingOrderName,
    "transaction_id": transactionId,
    "user_id": userId,
    "isApproved": isApproved,
    "isComplete" : isComplete,
    "listing_id": listingId,
    "lister_id": listerId,
    "short_stay_flag": shortStayFlag,
    "all_day_flag": allDayFlag,
    "days_stayed": daysStayed,
    "date_enter": dateEnter,
    "date_exit": dateExit,
    "tier": tier,
    "booking_status" : bookingStatus,
    "pay_amount": payAmount,
    "payment_flag": paymentFlag,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "listings": listings!.toJson(),
  };
}

class Listings {
  String listingId;
  dynamic listerId;
  String listerName;
  dynamic nidNumber;
  String guestNum;
  String bedNum;
  String bathroomNum;
  String listingTitle;
  String listingDescription;
  String fullDayPriceSetByUser;
  String listingAddress;
  String district;
  String town;
  String zipCode;
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
  String lat;
  String long;
  String isApproved;
  DateTime createdAt;
  DateTime updatedAt;
  List<Image> images;

  Listings({
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
    required this.lat,
    required this.long,
    required this.isApproved,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory Listings.fromJson(Map<String, dynamic> json) => Listings(
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listerName: json["lister_name"],
    nidNumber: json["nid_number"] ,
    guestNum: json["guest_num"] ?? "0",
    bedNum: json["bed_num"] ?? "0",
    bathroomNum: json["bathroom_num"] ?? "0",
    listingTitle: json["listing_title"] ?? "0",
    listingDescription: json["listing_description"] ??"0",
    fullDayPriceSetByUser: json["full_day_price_set_by_user"] ?? "0.0",
    listingAddress: json["listing_address"]??"No Data",
    district: json["district"] ?? "No Data",
    town: json["town"]?? "No Data",
    zipCode: json["zip_code"]?? "00000",
    allowShortStay: json["allow_short_stay"],
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
    listingType: json["listing_type"],
    lat: json["lat"] ?? "0.0000",
    long: json["long"] ?? "0.0000",
    isApproved: json["isApproved"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
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
    "lat": lat,
    "long": long,
    "isApproved": isApproved,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

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
    listingFilename: json["listing_filename"]!,
    listingTargetlocation: json["listing_targetlocation"]!,
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

enum ListingFilename {
  H_VBE_RJF_UP_Y0_DM_LM6_ZY4_V_X_YL_HAR8_SJF4_ZB_PWUB_V_CC_PNG,
  KYO_GT80_JV_DA_CWPA_VD_IVLM_ZH_Y4_H_FH_V_YHQF1_FCTF5_P_PNG,
  Z7_BF5_FK1_S_HS_K_HB_P4_CNQJN_EEP_XAY_K9_UGU_JY8_XWI_OP_PNG
}

final listingFilenameValues = EnumValues({
  "hVbeRjfUpY0DmLM6ZY4vXYlHar8SJF4zbPwubVCc.png": ListingFilename.H_VBE_RJF_UP_Y0_DM_LM6_ZY4_V_X_YL_HAR8_SJF4_ZB_PWUB_V_CC_PNG,
  "KYOGt80JvDACwpaVdIvlmZhY4hFhVYhqf1fctf5p.png": ListingFilename.KYO_GT80_JV_DA_CWPA_VD_IVLM_ZH_Y4_H_FH_V_YHQF1_FCTF5_P_PNG,
  "z7Bf5FK1SHsKHbP4CnqjnEEPXayK9uguJY8xwiOP.png": ListingFilename.Z7_BF5_FK1_S_HS_K_HB_P4_CNQJN_EEP_XAY_K9_UGU_JY8_XWI_OP_PNG
});

enum ListingTargetlocation {
  LISTINGS_H_VBE_RJF_UP_Y0_DM_LM6_ZY4_V_X_YL_HAR8_SJF4_ZB_PWUB_V_CC_PNG,
  LISTINGS_KYO_GT80_JV_DA_CWPA_VD_IVLM_ZH_Y4_H_FH_V_YHQF1_FCTF5_P_PNG,
  LISTINGS_Z7_BF5_FK1_S_HS_K_HB_P4_CNQJN_EEP_XAY_K9_UGU_JY8_XWI_OP_PNG
}

final listingTargetlocationValues = EnumValues({
  "listings/hVbeRjfUpY0DmLM6ZY4vXYlHar8SJF4zbPwubVCc.png": ListingTargetlocation.LISTINGS_H_VBE_RJF_UP_Y0_DM_LM6_ZY4_V_X_YL_HAR8_SJF4_ZB_PWUB_V_CC_PNG,
  "listings/KYOGt80JvDACwpaVdIvlmZhY4hFhVYhqf1fctf5p.png": ListingTargetlocation.LISTINGS_KYO_GT80_JV_DA_CWPA_VD_IVLM_ZH_Y4_H_FH_V_YHQF1_FCTF5_P_PNG,
  "listings/z7Bf5FK1SHsKHbP4CnqjnEEPXayK9uguJY8xwiOP.png": ListingTargetlocation.LISTINGS_Z7_BF5_FK1_S_HS_K_HB_P4_CNQJN_EEP_XAY_K9_UGU_JY8_XWI_OP_PNG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

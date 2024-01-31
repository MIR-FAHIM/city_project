// To parse this JSON data, do
//
//     final makeBookingResponseModel = makeBookingResponseModelFromJson(jsonString);

import 'dart:convert';

MakeBookingResponseModel makeBookingResponseModelFromJson(String str) => MakeBookingResponseModel.fromJson(json.decode(str));

String makeBookingResponseModelToJson(MakeBookingResponseModel data) => json.encode(data.toJson());

class MakeBookingResponseModel {
  BookingInfo bookingInfo;
  ListingInfo listingInfo;
  List<ListingImage> listingImages;

  MakeBookingResponseModel({
    required this.bookingInfo,
    required this.listingInfo,
    required this.listingImages,
  });

  factory MakeBookingResponseModel.fromJson(Map<String, dynamic> json) => MakeBookingResponseModel(
    bookingInfo: BookingInfo.fromJson(json["booking_info"]),
    listingInfo: ListingInfo.fromJson(json["listing_info"]),
    listingImages: List<ListingImage>.from(json["listing_images"].map((x) => ListingImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "booking_info": bookingInfo.toJson(),
    "listing_info": listingInfo.toJson(),
    "listing_images": List<dynamic>.from(listingImages.map((x) => x.toJson())),
  };
}

class BookingInfo {
  String userId;
  String listerId;
  String listingId;
  int daysStayed;
  DateTime dateEnter;
  DateTime dateExit;
  String bookingOrderName;
  String shortStayFlag;
  String timeId;
  String allDayFlag;
  int payAmount;

  BookingInfo({
    required this.userId,
    required this.listerId,
    required this.listingId,
    required this.daysStayed,
    required this.dateEnter,
    required this.dateExit,
    required this.bookingOrderName,
    required this.shortStayFlag,
    required this.timeId,
    required this.allDayFlag,
    required this.payAmount,
  });

  factory BookingInfo.fromJson(Map<String, dynamic> json) => BookingInfo(
    userId: json["user_id"],
    listerId: json["lister_id"],
    listingId: json["listing_id"],
    daysStayed: json["days_stayed"],
    dateEnter: DateTime.parse(json["date_enter"]),
    dateExit: DateTime.parse(json["date_exit"]),
    bookingOrderName: json["booking_order_name"],
    shortStayFlag: json["short_stay_flag"],
    timeId: json["time_id"],
    allDayFlag: json["all_day_flag"],
    payAmount: json["pay_amount"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "lister_id": listerId,
    "listing_id": listingId,
    "days_stayed": daysStayed,
    "date_enter": "${dateEnter.year.toString().padLeft(4, '0')}-${dateEnter.month.toString().padLeft(2, '0')}-${dateEnter.day.toString().padLeft(2, '0')}",
    "date_exit": "${dateExit.year.toString().padLeft(4, '0')}-${dateExit.month.toString().padLeft(2, '0')}-${dateExit.day.toString().padLeft(2, '0')}",
    "booking_order_name": bookingOrderName,
    "short_stay_flag": shortStayFlag,
    "time_id": timeId,
    "all_day_flag": allDayFlag,
    "pay_amount": payAmount,
  };
}

class ListingImage {
  String listingImgId;
  String listingId;
  String listerId;
  String listingFilename;
  String listingTargetlocation;

  ListingImage({
    required this.listingImgId,
    required this.listingId,
    required this.listerId,
    required this.listingFilename,
    required this.listingTargetlocation,
  });

  factory ListingImage.fromJson(Map<String, dynamic> json) => ListingImage(
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

class ListingInfo {
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
  String town;
  String allowShortStay;
  String describePeaceful;
  String describeUnique;
  String describeFamilyfriendly;
  String describeStylish;
  String describeCentral;
  String describeSpacious;
  String listingType;
  dynamic lati;
  dynamic longi;

  ListingInfo({
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
    required this.town,
    required this.allowShortStay,
    required this.describePeaceful,
    required this.describeUnique,
    required this.describeFamilyfriendly,
    required this.describeStylish,
    required this.describeCentral,
    required this.describeSpacious,
    required this.listingType,
    required this.lati,
    required this.longi,
  });

  factory ListingInfo.fromJson(Map<String, dynamic> json) => ListingInfo(
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
    town: json["town"],
    allowShortStay: json["allow_short_stay"],
    describePeaceful: json["describe_peaceful"],
    describeUnique: json["describe_unique"],
    describeFamilyfriendly: json["describe_familyfriendly"],
    describeStylish: json["describe_stylish"],
    describeCentral: json["describe_central"],
    describeSpacious: json["describe_spacious"],
    listingType: json["listing_type"],
    lati: json["lati"],
    longi: json["longi"],
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
    "town": town,
    "allow_short_stay": allowShortStay,
    "describe_peaceful": describePeaceful,
    "describe_unique": describeUnique,
    "describe_familyfriendly": describeFamilyfriendly,
    "describe_stylish": describeStylish,
    "describe_central": describeCentral,
    "describe_spacious": describeSpacious,
    "listing_type": listingType,
    "lati": lati,
    "longi": longi,
  };
}

// To parse this JSON data, do
//
//     final getNotificationModel = getNotificationModelFromJson(jsonString);

import 'dart:convert';

GetNotificationModel getNotificationModelFromJson(String str) => GetNotificationModel.fromJson(json.decode(str));

String getNotificationModelToJson(GetNotificationModel data) => json.encode(data.toJson());

class GetNotificationModel {
  int status;
  List<NotificationList> notifications;

  GetNotificationModel({
    required this.status,
    required this.notifications,
  });

  factory GetNotificationModel.fromJson(Map<String, dynamic> json) => GetNotificationModel(
    status: json["status"],
    notifications: List<NotificationList>.from(json["Notifications"].map((x) => NotificationList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
  };
}

class NotificationList {
  int id;
  String userId;
  String listerId;
  String listingId;
  String bookingId;
  String type;
  String messege;
  DateTime createdAt;
  DateTime updatedAt;
  Listings listings;
  Bookings bookings;

  NotificationList({
    required this.id,
    required this.userId,
    required this.listerId,
    required this.listingId,
    required this.bookingId,
    required this.type,
    required this.messege,
    required this.createdAt,
    required this.updatedAt,
    required this.listings,
    required this.bookings,
  });

  factory NotificationList.fromJson(Map<String, dynamic> json) => NotificationList(
    id: json["id"],
    userId: json["user_id"],
    listerId: json["lister_id"],
    listingId: json["listing_id"],
    bookingId: json["booking_id"] ?? "No data",
    type: json["type"],
    messege: json["messege"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    listings: Listings.fromJson(json["listings"]),
    bookings: json["bookings"] == null ?
    Bookings(
        bookingId:"",
     bookingOrderName:"",
     userId:"",
     listingId:"",
         listerId:"",
         listingType:"",
         shortStayFlag:"",
         transactionId:"",
         allDayFlag:"",
         daysStayed:"",
         dateEnter:DateTime.now(),
         dateExit:DateTime.now(),
         tier:"",
         totalMembers:"",
         email:"",
         phone:"",
         payAmount:"",
         netPayable:"",
         paymentFlag:"",
         bookingStatus:"",
         isApproved:"",
         isComplete:"",
         messeges:"",
         createdAt:DateTime.now(),
         updatedAt:DateTime.now(),) : Bookings.fromJson(json["bookings"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "lister_id": listerId,
    "listing_id": listingId,
    "booking_id": bookingId,
    "type": type,
    "messege": messege,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "listings": listings.toJson(),
    "bookings": bookings.toJson(),
  };
}

class Bookings {
  String bookingId;
  String bookingOrderName;
  String userId;
  String listingId;
  String listerId;
  dynamic listingType;
  String shortStayFlag;
  String transactionId;
  String allDayFlag;
  String daysStayed;
  DateTime dateEnter;
  DateTime dateExit;
  String tier;
  dynamic totalMembers;
  dynamic email;
  String phone;
  String payAmount;
  dynamic netPayable;
  String paymentFlag;
  String bookingStatus;
  String isApproved;
  String isComplete;
  dynamic messeges;
  DateTime createdAt;
  DateTime updatedAt;

  Bookings({
    required this.bookingId,
    required this.bookingOrderName,
    required this.userId,
    required this.listingId,
    required this.listerId,
    required this.listingType,
    required this.shortStayFlag,
    required this.transactionId,
    required this.allDayFlag,
    required this.daysStayed,
    required this.dateEnter,
    required this.dateExit,
    required this.tier,
    required this.totalMembers,
    required this.email,
    required this.phone,
    required this.payAmount,
    required this.netPayable,
    required this.paymentFlag,
    required this.bookingStatus,
    required this.isApproved,
    required this.isComplete,
    required this.messeges,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
    bookingId: json["booking_id"],
    bookingOrderName: json["booking_order_name"],
    userId: json["user_id"],
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listingType: json["listing_type"],
    shortStayFlag: json["short_stay_flag"],
    transactionId: json["transaction_id"],
    allDayFlag: json["all_day_flag"] ?? "0",
    daysStayed: json["days_stayed"] ?? "0",
    dateEnter: DateTime.parse(json["date_enter"]),
    dateExit: DateTime.parse(json["date_exit"]),
    tier: json["tier"],
    totalMembers: json["total_members"],
    email: json["email"],
    phone: json["phone"],
    payAmount: json["pay_amount"],
    netPayable: json["net_payable"],
    paymentFlag: json["payment_flag"],
    bookingStatus: json["booking_status"],
    isApproved: json["isApproved"],
    isComplete: json["isComplete"],
    messeges: json["messeges"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "booking_order_name": bookingOrderName,
    "user_id": userId,
    "listing_id": listingId,
    "lister_id": listerId,
    "listing_type": listingType,
    "short_stay_flag": shortStayFlag,
    "transaction_id": transactionId,
    "all_day_flag": allDayFlag,
    "days_stayed": daysStayed,
    "date_enter": dateEnter.toIso8601String(),
    "date_exit": dateExit.toIso8601String(),
    "tier": tier,
    "total_members": totalMembers,
    "email": email,
    "phone": phone,
    "pay_amount": payAmount,
    "net_payable": netPayable,
    "payment_flag": paymentFlag,
    "booking_status": bookingStatus,
    "isApproved": isApproved,
    "isComplete": isComplete,
    "messeges": messeges,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Listings {
  String listingId;
  String listerId;
  String listerName;
  dynamic nidNumber;
  String guestNum;
  String bedNum;
  String bathroomNum;
  String listingTitle;
  String listingDescription;
  String fullDayPriceSetByUser;
  dynamic discountPrice;
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
  dynamic videoLink;
  String lat;
  String long;
  String isApproved;
  String isActive;
  DateTime createdAt;
  DateTime updatedAt;

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
  });

  factory Listings.fromJson(Map<String, dynamic> json) => Listings(
    listingId: json["listing_id"],
    listerId: json["lister_id"],
    listerName: json["lister_name"],
    nidNumber: json["nid_number"],
    guestNum: json["guest_num"],
    bedNum: json["bed_num"],
    bathroomNum: json["bathroom_num"],
    listingTitle: json["listing_title"],
    listingDescription: json["listing_description"] ??"No Data",
    fullDayPriceSetByUser: json["full_day_price_set_by_user"],
    discountPrice: json["discount_price"],
    listingAddress: json["listing_address"] ??"No Data",
    district: json["district"],
    town: json["town"],
    zipCode: json["zip_code"],
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
    videoLink: json["video_link"],
    lat: json["lat"],
    long: json["long"],
    isApproved: json["isApproved"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
  };
}

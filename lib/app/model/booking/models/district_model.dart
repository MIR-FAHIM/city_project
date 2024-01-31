// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

List<DistrictModel> districtModelFromJson(String str) => List<DistrictModel>.from(json.decode(str).map((x) => DistrictModel.fromJson(x)));

String districtModelToJson(List<DistrictModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DistrictModel {
  String id;
  String divisionId;
  String name;
  String bnName;
  String lat;
  String long;

  DistrictModel({
    required this.id,
    required this.divisionId,
    required this.name,
    required this.bnName,
    required this.lat,
    required this.long,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
    id: json["id"],
    divisionId: json["division_id"],
    name: json["name"],
    bnName: json["bn_name"],
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "division_id": divisionId,
    "name": name,
    "bn_name": bnName,
    "lat": lat,
    "long": long,
  };


}

// To parse this JSON data, do
//
//     final areaModel = areaModelFromJson(jsonString);

import 'dart:convert';

List<AreaModel> areaModelFromJson(String str) => List<AreaModel>.from(json.decode(str).map((x) => AreaModel.fromJson(x)));

String areaModelToJson(List<AreaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AreaModel {
  String id;
  String districtId;
  String name;
  String bnName;

  AreaModel({
    required this.id,
    required this.districtId,
    required this.name,
    required this.bnName,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
    id: json["id"],
    districtId: json["district_id"],
    name: json["name"],
    bnName: json["bn_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "district_id": districtId,
    "name": name,
    "bn_name": bnName,
  };
}

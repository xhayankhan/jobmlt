// To parse this JSON data, do
//
//     final itemTypeModel = itemTypeModelFromJson(jsonString);

import 'dart:convert';

List<ItemTypeModel> itemTypeModelFromJson(String str) => List<ItemTypeModel>.from(json.decode(str).map((x) => ItemTypeModel.fromJson(x)));

String itemTypeModelToJson(List<ItemTypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemTypeModel {
  ItemTypeModel({
    this.id,
    this.itemTypeName,
    this.companyLocationId,
    this.companyId,
    this.itemType,
    this.isActive=true,
  });

  dynamic id;
  dynamic itemTypeName;
  dynamic companyLocationId;
  dynamic companyId;
  dynamic itemType;
  bool isActive;

  factory ItemTypeModel.fromJson(Map<String, dynamic> json) => ItemTypeModel(
    id: json["ID"],
    itemTypeName: json["ItemTypeName"],
    companyLocationId: json["CompanyLocationID"],
    companyId: json["CompanyID"],
    itemType: json["ItemType"],
    isActive: json["IsActive"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ItemTypeName": itemTypeName,
    "CompanyLocationID": companyLocationId,
    "CompanyID": companyId,
    "ItemType": itemType,
    "IsActive": isActive,
  };
}

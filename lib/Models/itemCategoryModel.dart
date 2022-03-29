//
//     final itemCategoryModel = itemCategoryModelFromJson(jsonString);

import 'dart:convert';

List<ItemCategoryModel> itemCategoryModelFromJson(String str) => List<ItemCategoryModel>.from(json.decode(str).map((x) => ItemCategoryModel.fromJson(x)));

String itemCategoryModelToJson(List<ItemCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemCategoryModel {
  ItemCategoryModel({
    this.id,
    this.itemCategoryName,
    this.companyId,
    this.isActive=true,
    this.dateTimeCreated,
    this.dateTimeModified,
    this.companyLocationId,
    this.parentCategoryId,
    this.count,
    this.parentCategoryName,
    this.categoryFullName,
  });

  dynamic id;
  dynamic itemCategoryName;
  dynamic companyId;
  bool isActive;
  dynamic dateTimeCreated;
  dynamic dateTimeModified;
  dynamic companyLocationId;
  dynamic parentCategoryId;
  dynamic count;
  dynamic parentCategoryName;
  dynamic categoryFullName;

  factory ItemCategoryModel.fromJson(Map<String, dynamic> json) => ItemCategoryModel(
    id: json["ID"],
    itemCategoryName: json["ItemCategoryName"],
    companyId: json["CompanyID"],
    isActive: json["IsActive"],
    dateTimeCreated: json["DateTimeCreated"],
    dateTimeModified: json["DateTimeModified"],
    companyLocationId: json["CompanyLocationID"],
    parentCategoryId: json["ParentCategoryID"],
    count: json["Count"],
    parentCategoryName: json["ParentCategoryName"],
    categoryFullName: json["CategoryFullName"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ItemCategoryName": itemCategoryName,
    "CompanyID": companyId,
    "IsActive": isActive,
    "DateTimeCreated": dateTimeCreated.toIso8601String(),
    "DateTimeModified": dateTimeModified,
    "CompanyLocationID": companyLocationId,
    "ParentCategoryID": parentCategoryId,
    "Count": count,
    "ParentCategoryName": parentCategoryName,
    "CategoryFullName": categoryFullName,
  };
}

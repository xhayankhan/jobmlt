// To parse this JSON data, do
//
//     final warehouseModel = warehouseModelFromJson(jsonString);

import 'dart:convert';

List<WarehouseModel> warehouseModelFromJson(String str) => List<WarehouseModel>.from(json.decode(str).map((x) => WarehouseModel.fromJson(x)));

// String warehouseModelToJson(List<WarehouseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WarehouseModel {
  WarehouseModel({
    this.isWareHouseCategoryRequired,
    this.id,
    this.warehouseName,
    this.streetAddress,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.phone1,
    this.phone2,
    this.fax,
    this.contactPerson,
    this.contactEmail,
    this.isActive,
    this.companyId,
    this.dateTimeCreated,
    this.dateTimeModified,
    this.ipAddress,
    this.trxCreatedBy,
    this.trxModifiedBy,
    this.trxCreatedIpAddress,
    this.trxModifiedIpAddress,
    this.isDefault,
    this.isSellingAllowed,
    this.wareHouseType,
    this.wareHouseCategory,
    this.wareHouseParentId,
    this.isDeleted,
    this.warehouseDescription,

  });

  dynamic isWareHouseCategoryRequired;
  dynamic id;
  dynamic warehouseName;
  dynamic streetAddress;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  dynamic country;
  dynamic phone1;
  dynamic phone2;
  dynamic fax;
  dynamic contactPerson;
  dynamic contactEmail;
  dynamic isActive;
  dynamic companyId;
  dynamic dateTimeCreated;
  dynamic dateTimeModified;
  dynamic ipAddress;
  dynamic trxCreatedBy;
  dynamic trxModifiedBy;
  dynamic trxCreatedIpAddress;
  dynamic trxModifiedIpAddress;
  dynamic isDefault;
  dynamic isSellingAllowed;
  dynamic wareHouseType;
  dynamic wareHouseCategory;
  dynamic wareHouseParentId;
  dynamic isDeleted;
  dynamic warehouseDescription;


  factory WarehouseModel.fromJson(Map<String, dynamic> json) => WarehouseModel(
    isWareHouseCategoryRequired: json["IsWareHouseCategoryRequired"],
    id: json["ID"]==null ?'': json["ID"],
    warehouseName: json["WarehouseName"]==null ?'': json["WarehouseName"],
    streetAddress: json["StreetAddress"],
    city: json["City"],
    state: json["State"],
    zipCode: json["ZipCode"],
    country: json["Country"],
    phone1: json["Phone1"],
    phone2: json["Phone2"],
    fax: json["Fax"],
    contactPerson: json["ContactPerson"],
    contactEmail: json["ContactEmail"],
    isActive: json["IsActive"],
    companyId: json["CompanyID"],
    dateTimeCreated: json["DateTimeCreated"],
    dateTimeModified: json["DateTimeModified"],
    ipAddress: json["IPAddress"],
    trxCreatedBy: json["TrxCreatedBy"],
    trxModifiedBy: json["TrxModifiedBy"],
    trxCreatedIpAddress: json["TrxCreated_IPAddress"],
    trxModifiedIpAddress: json["TrxModified_IPAddress"],
    isDefault: json["IsDefault"],
    isSellingAllowed: json["IsSellingAllowed"],
    wareHouseType: json["WareHouseType"],
    wareHouseCategory: json["WareHouseCategory"],
    wareHouseParentId: json["WareHouseParentID"],
    isDeleted: json["IsDeleted"],
    warehouseDescription: json["WarehouseDescription"],

  );

  // Map<String, dynamic> toJson() => {
  //   "IsWareHouseCategoryRequired": isWareHouseCategoryRequired,
  //   "ID": id,
  //   "WarehouseName": warehouseName,
  //   "StreetAddress": streetAddress,
  //   "City": city,
  //   "State": state,
  //   "ZipCode": zipCode,
  //   "Country": country,
  //   "Phone1": phone1,
  //   "Phone2": phone2,
  //   "Fax": fax,
  //   "ContactPerson": contactPerson,
  //   "ContactEmail": contactEmail,
  //   "IsActive": isActive,
  //   "CompanyID": companyId,
  //   "DateTimeCreated": dateTimeCreated.toIso8601String(),
  //   "DateTimeModified": dateTimeModified,
  //   "IPAddress": ipAddress,
  //   "TrxCreatedBy": trxCreatedBy,
  //   "TrxModifiedBy": trxModifiedBy,
  //   "TrxCreated_IPAddress": trxCreatedIpAddress,
  //   "TrxModified_IPAddress": trxModifiedIpAddress,
  //   "IsDefault": isDefault,
  //   "IsSellingAllowed": isSellingAllowed,
  //   "WareHouseType": wareHouseType,
  //   "WareHouseCategory": wareHouseCategory,
  //   "WareHouseParentID": wareHouseParentId,
  //   "IsDeleted": isDeleted,
  //   "WarehouseDescription": warehouseDescription,

  // };
}

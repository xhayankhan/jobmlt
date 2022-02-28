// To parse this JSON data, do
//
//     final shippingMethodModel = shippingMethodModelFromJson(jsonString);

import 'dart:convert';

List<ShippingMethodModel> shippingMethodModelFromJson(String str) => List<ShippingMethodModel>.from(json.decode(str).map((x) => ShippingMethodModel.fromJson(x)));

String shippingMethodModelToJson(List<ShippingMethodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShippingMethodModel {
  ShippingMethodModel({
    this.id,
    this.name,
    this.description,
    //this.isActive,
    this.companyId,
    this.trxCreatedBy,
    this.trxModifiedBy,
    this.trxCreatedIpAddress,
    this.trxModifiedIpAddress,
    this.companyLocationId,
    // this.saSubscription,
    // this.saTransaction,
  });

  dynamic id;
  dynamic name;
  dynamic description;
  //bool isActive;
  dynamic companyId;
  dynamic trxCreatedBy;
  dynamic trxModifiedBy;
  dynamic trxCreatedIpAddress;
  dynamic trxModifiedIpAddress;
  dynamic companyLocationId;
  // List<dynamic> saSubscription;
  // List<dynamic> saTransaction;

  factory ShippingMethodModel.fromJson(Map<String, dynamic> json) => ShippingMethodModel(
    id: json["ID"]==null?'':json['ID'],
    name: json["Name"]==null?'':json['Name'],
    description: json["Description"],
   // isActive: json["IsActive"],
    companyId: json["CompanyID"],
    trxCreatedBy: json["TrxCreatedBy"],
    trxModifiedBy: json["TrxModifiedBy"],
    trxCreatedIpAddress: json["TrxCreated_IPAddress"],
    trxModifiedIpAddress: json["TrxModified_IPAddress"],
    companyLocationId: json["CompanyLocationID"],
    // saSubscription: List<dynamic>.from(json["SA_Subscription"].map((x) => x)),
    // saTransaction: List<dynamic>.from(json["SA_Transaction"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Name": name,
    "Description": description,
    //"IsActive": isActive,
    "CompanyID": companyId,
    "TrxCreatedBy": trxCreatedBy,
    "TrxModifiedBy": trxModifiedBy,
    "TrxCreated_IPAddress": trxCreatedIpAddress,
    "TrxModified_IPAddress": trxModifiedIpAddress,
    "CompanyLocationID": companyLocationId,
    // "SA_Subscription": List<dynamic>.from(saSubscription.map((x) => x)),
    // "SA_Transaction": List<dynamic>.from(saTransaction.map((x) => x)),
  };
}

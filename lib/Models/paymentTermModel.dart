// To parse this JSON data, do
//
//     final paymentTermModel = paymentTermModelFromJson(jsonString);

import 'dart:convert';

List<PaymentTermModel> paymentTermModelFromJson(String str) => List<PaymentTermModel>.from(json.decode(str).map((x) => PaymentTermModel.fromJson(x)));

String paymentTermModelToJson(List<PaymentTermModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentTermModel {
  PaymentTermModel({
    this.id,
    this.name,
    this.netDueIn,
    this.discountPercentage,
    this.discountifPaidWithin,
    this.isActive,
    this.companyId,
    this.dateTimeCreated,
    this.dateTimeModified,
    this.trxCreatedBy,
    this.trxModifiedBy,
    this.trxCreatedIpAddress,
    this.trxModifiedIpAddress,
    this.companyLocationId,

    this.showDiscountPercentageInPaymentTerm,
  });

  dynamic id;
  dynamic name;
  dynamic netDueIn;
  dynamic discountPercentage;
  dynamic discountifPaidWithin;
  dynamic isActive;
  dynamic companyId;
  dynamic dateTimeCreated;
  dynamic dateTimeModified;
  dynamic trxCreatedBy;
  dynamic trxModifiedBy;
  dynamic trxCreatedIpAddress;
  dynamic trxModifiedIpAddress;
  dynamic companyLocationId;
  dynamic showDiscountPercentageInPaymentTerm;

  factory PaymentTermModel.fromJson(Map<String, dynamic> json) => PaymentTermModel(
    id: json["ID"],
    name: json["Name"],
    netDueIn: json["NetDueIn"],
    discountPercentage: json["DiscountPercentage"],
    discountifPaidWithin: json["DiscountifPaidWithin"],
    isActive: json["IsActive"],
    companyId: json["CompanyID"],
    dateTimeCreated: json["DateTimeCreated"],
    dateTimeModified: json["DateTimeModified"],
    trxCreatedBy: json["TrxCreatedBy"],
    trxModifiedBy: json["TrxModifiedBy"],
    trxCreatedIpAddress: json["TrxCreated_IPAddress"],
    trxModifiedIpAddress: json["TrxModified_IPAddress"],
    companyLocationId: json["CompanyLocationID"],

    showDiscountPercentageInPaymentTerm: json["ShowDiscountPercentageInPaymentTerm"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Name": name,
    "NetDueIn": netDueIn,
    "DiscountPercentage": discountPercentage,
    "DiscountifPaidWithin": discountifPaidWithin,
    "IsActive": isActive,
    "CompanyID": companyId,
    "DateTimeCreated": dateTimeCreated,
    "DateTimeModified": dateTimeModified,
    "TrxCreatedBy": trxCreatedBy,
    "TrxModifiedBy": trxModifiedBy,
    "TrxCreated_IPAddress": trxCreatedIpAddress,
    "TrxModified_IPAddress": trxModifiedIpAddress,
    "CompanyLocationID": companyLocationId,
    "ShowDiscountPercentageInPaymentTerm": showDiscountPercentageInPaymentTerm,
  };
}

// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

//String itemModelToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
  ItemModel({
    this.id,
    this.itemCategoryId,
    this.itemCode,
    this.itemName,
    this.itemDescription,
    this.itemType,
    this.standardCost,
    this.unitCost,
    this.currentCost,
    this.unitPrice,
    this.itemUom,
    this.upcCode,
    this.reOrderPoint,
    this.qtyOnHand,
    this.qtyAllocated,
    this.qtyOnPurchaseOrder,
    this.qtyOnProduction,
    this.isActive,
    this.trxCreatedBy,
    this.trxModifiedBy,
    this.trxCreatedIpAddress,
    this.trxModifiedIpAddress,
    this.partNumber,
    this.sku,
    this.sMake,
    this.sBrand,
    this.sModel,
    this.sCapacity,
    this.sColor,
    this.sCarrier,
    this.sCondition,
    this.sLockedUnLocked,
    this.sBattery,
    this.sDisplayResolution,
    this.sDisplaySize,
    this.sPrimaryCamera,
    this.sProcessor,

    this.sRam,
    this.sSecondaryCamera,
    this.sSim,
    this.sOperatingSystem,
    this.discountedPrice,
    this.itemWeight,
    this.itemWeightLb,
    this.itemWeightOz,
    this.companyId,
  });

  dynamic id;
  dynamic itemCategoryId;
  dynamic itemCode;
  dynamic itemName;
  dynamic itemDescription;
  dynamic itemType;
  dynamic standardCost;
  dynamic unitCost;
  dynamic currentCost;
  dynamic unitPrice;
  dynamic itemUom;
  dynamic upcCode;
  dynamic reOrderPoint;
  dynamic qtyOnHand;
  dynamic qtyAllocated;
  dynamic qtyOnPurchaseOrder;
  dynamic qtyOnProduction;
  dynamic isActive;
  dynamic trxCreatedBy;
  dynamic trxModifiedBy;
  dynamic trxCreatedIpAddress;
  dynamic trxModifiedIpAddress;
  dynamic partNumber;
  dynamic sku;
  dynamic sMake;
  dynamic sBrand;
  dynamic sModel;
  dynamic sCapacity;
  dynamic sColor;
  dynamic sCarrier;
  dynamic sCondition;
  dynamic sLockedUnLocked;
  dynamic sBattery;
  dynamic sDisplayResolution;
  dynamic sDisplaySize;
  dynamic sPrimaryCamera;
  dynamic sProcessor;

  dynamic sRam;
  dynamic sSecondaryCamera;
  dynamic sSim;
  dynamic sOperatingSystem;
  dynamic discountedPrice;
  dynamic itemWeight;
  dynamic itemWeightLb;
  dynamic itemWeightOz;
  dynamic companyId;

  factory ItemModel.fromJson(Map<String, dynamic> json)=>ItemModel(
    id:json["ID"] == null ? '' : json["ID"],
     itemCategoryId: json["ItemCategoryID"]== null ? '':json["ItemCategoryID"],
     itemCode: json["ItemCode"]== null ? '':json["ItemCode"],
     itemName: json["ItemName"]== null ? '':json["ItemName"],
     itemDescription: json["ItemDescription"] == null ? '' : json["ItemDescription"],
      itemType: json["ItemType"]== null ? '':json["ItemType"] ,
     standardCost: json["StandardCost"]== null ? '':json["StandardCost"],
     unitCost: json["UnitCost"]== null ? 0.00:json["UnitCost"],
     currentCost: json["CurrentCost"] == null ? null : json["CurrentCost"],
     unitPrice: json["UnitPrice"]== null ? 0.00:json["UnitPrice"],
     itemUom: json["ItemUOM"]== null ? '' :json["ItemUOM"],
     upcCode: json["UPCCode"]== null ? '':json["UPCCode"],
     reOrderPoint: json["ReOrderPoint"]== null ? '':json["ReOrderPoint"],
     qtyOnHand: json["Qty_OnHand"]== null ? 0:json["Qty_OnHand"],
     qtyAllocated: json["Qty_Allocated"]== null ? '':json["Qty_Allocated"],
     qtyOnPurchaseOrder: json["Qty_OnPurchaseOrder"]== null ? '':json["Qty_OnPurchaseOrder"],
     qtyOnProduction: json["Qty_OnProduction"]== null ? '':json["Qty_OnProduction"],
     isActive: json["IsActive"]== null ? '':json["IsActive"],
     trxCreatedBy: json["TrxCreatedBy"]== null ? '':json["TrxCreatedBy"],
     trxModifiedBy: json["TrxModifiedBy"]== null ? '':json["TrxModifiedBy"],
     trxCreatedIpAddress: json["TrxCreated_IPAddress"]== null ? '':json["TrxCreated_IPAddress"],
     trxModifiedIpAddress: json["TrxModified_IPAddress"]== null ? '':json["TrxModified_IPAddress"],
     partNumber: json["PartNumber"]== null ? '':json["PartNumber"],
     sku: json["SKU"]== null ? '':json["SKU"],
     sMake: json["sMake"]== null ? '':json["sMake"],
     sBrand: json["sBrand"]== null ? '':json["sBrand"],
     sModel: json["sModel"]== null ? '':json["sModel"],
     sCapacity: json["sCapacity"]== null ? '':json["sCapacity"],
     sColor: json["sColor"]== null ? '':json["sColor"],
     sCarrier: json["sCarrier"]== null ? '':json["sCarrier"],
     sCondition: json["sCondition"]== null ? '':json["sCondition"],
     sLockedUnLocked: json["sLocked_UnLocked"]== null ? '':json["sLocked_UnLocked"],
     discountedPrice: json["DiscountedPrice"]== null ? '':json["DiscountedPrice"],
     itemWeight: json["Item_Weight"]== null ? '':json["Item_Weight"],
     itemWeightLb: json["Item_Weight_LB"]== null ? '':json["Item_Weight_LB"],
     itemWeightOz: json["Item_Weight_OZ"]== null ? '':json["Item_Weight_OZ"],
     companyId: json["CompanyID"]== null ? '':json["CompanyID"],

  );


  // Map<String, dynamic> toJson() => {
  //   "ID": id,
  //   "ItemCategoryID": itemCategoryId,
  //   "ItemCode": itemCode,
  //   "ItemName": itemName,
  //   "ItemDescription": itemDescription == null ? null : itemDescription,
  //   "ItemType": itemType,
  //   "StandardCost": standardCost,
  //   "UnitCost": unitCost,
  //   "CurrentCost": currentCost == null ? null : currentCost,
  //   "UnitPrice": unitPrice,
  //   "ItemUOM": itemUom,
  //   "UPCCode": upcCode,
  //   "ReOrderPoint": reOrderPoint,
  //   "Qty_OnHand": qtyOnHand,
  //   "Qty_Allocated": qtyAllocated,
  //   "Qty_OnPurchaseOrder": qtyOnPurchaseOrder,
  //   "Qty_OnProduction": qtyOnProduction,
  //   "IsActive": isActive,
  //   "TrxCreatedBy": trxCreatedBy,
  //   "TrxModifiedBy": trxModifiedBy,
  //   "TrxCreated_IPAddress": trxCreatedIpAddress,
  //   "TrxModified_IPAddress": trxModifiedIpAddress,
  //   "PartNumber": partNumber,
  //   "SKU": sku,
  //   "sMake": sMake,
  //   "sBrand": sBrand,
  //   "sModel": sModel,
  //   "sCapacity": sCapacity,
  //   "sColor": sColor,
  //   "sCarrier": sCarrier,
  //   "sCondition": sCondition,
  //   "sLocked_UnLocked": sLockedUnLocked,
  //   "sBattery": sBattery,
  //   "sDisplayResolution": sDisplayResolution,
  //   "sDisplaySize": sDisplaySize,
  //   "sPrimaryCamera": sPrimaryCamera,
  //   "sProcessor": sProcessor,
  //
  //   "sRam": sRam,
  //   "sSecondaryCamera": sSecondaryCamera,
  //   "sSIM": sSim,
  //   "sOperatingSystem": sOperatingSystem,
  //   "DiscountedPrice": discountedPrice,
  //   "Item_Weight": itemWeight,
  //   "Item_Weight_LB": itemWeightLb,
  //   "Item_Weight_OZ": itemWeightOz,
  //   "CompanyID": companyId,
  // };
}


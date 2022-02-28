// To parse this JSON data, do
//
//     final invoiceItemModel = invoiceItemModelFromJson(jsonString);

import 'dart:convert';

List<InvoiceItemModel> invoiceItemModelFromJson(String str) => List<InvoiceItemModel>.from(json.decode(str).map((x) => InvoiceItemModel.fromJson(x)));

String invoiceItemModelToJson(List<InvoiceItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoiceItemModel {
  InvoiceItemModel({
    this.sImei,
    this.singleImei,
    this.showFlatRateBoxline,
    this.lineOutId,
    this.smartUpcCode,
    this.smartIsjson,
    this.smartItemCodeId,
    this.smartItemCode,
    this.headerDoctype,
    this.smartIItemName,
    this.smartBinLocationName,
    this.smartBinLocationId,
    this.smartWareHouseId,
    this.smartWareHouseName,
    this.smartImeiList,
    this.smartsRecordStatus,
    this.smartDescription,
    this.binLocationName,
    this.isShowingItemsDetails,
    this.sRecordStatus,
    this.searchType,
    this.prevItemPrice,
    this.imei,
    this.firstName,
    this.lastName,
    this.delCheck,
    this.lineUpdCheck,
    this.itemBasicPrice,
    this.totalQuantity,
    this.isPo,
    this.itemType,
    this.isShowItemUomLine,

    this.showSalesTax,
    this.isAddButtonDisplay,
    this.isImeiRequiredForSerializedItems,
    this.toDisplay,
    this.isItemLinePriceTier,
    this.returnType,
    this.imeiList,
    this.isSerializedRestriction,
    this.imeiDepartmentStagesId,
    this.imeiDepartmentStagesName,
    this.id,
    this.saTransactionId,
    this.txnNumber,
    this.itemCodeId,
    this.itemCode,
    this.itemName,
    this.itemPrice,
    this.itemQuantity,
    this.lineTotal,
    this.balanceQty,
    this.description,
    this.itemUnitCost,
    this.companyId,
    this.trxCreatedBy,
    this.trxModifiedBy,
    this.trxCreatedIpAddress,
    this.trxModifiedIpAddress,
    this.companyLocationId,
    this.wareHouseId,
    this.wareHouseName,
    this.lineDiscountAmount,
    this.qtyBackOrder,
    this.itemQuantityShipped,
    this.cmpntseq,
    this.taxCodeName,
    this.taxCodeId,
    this.salesTaxAmount,
    this.itemCodeReference,
    this.qtyinsvc,
    this.qtyinuse,
    this.qtydmged,
    this.qtyrtrnd,
    this.qtycance,
    this.qtyorder,
    this.qtyrpair,
    this.transactionSourceId,
    this.taxCodeRate,
    this.lineDiscountType,
    this.fulfilmentBalanceQty,
    this.qtyfulfilled,
    this.itemCodeSourceId,
    this.lineStatus,
    this.fulfullmentItemId,
    this.fulfullmentItemCode,
    this.isAddedFromFulfilment,
    this.forexCurrencyId,
    this.forexCurrencyName,
    this.forexCurrencyRate,
    this.forexCurrencyItemPrice,
    this.orderLineId,
    this.displayOrder,
    this.binLocationId,
    this.originDocSource,
    this.originDocId,
    this.originDocStoreId,
    this.originDocSiteId,
    this.lineUomid,
    this.previousLineId,
    this.squareArea,
    this.beAttention,
    this.saTransaction,
  });

  dynamic sImei;
  dynamic singleImei;
  dynamic showFlatRateBoxline;
  dynamic lineOutId;
  dynamic smartUpcCode;
  dynamic smartIsjson;
  dynamic smartItemCodeId;
  dynamic smartItemCode;
  dynamic headerDoctype;
  dynamic smartIItemName;
  dynamic smartBinLocationName;
  dynamic smartBinLocationId;
  dynamic smartWareHouseId;
  dynamic smartWareHouseName;
  dynamic smartImeiList;
  dynamic smartsRecordStatus;
  dynamic smartDescription;
  dynamic binLocationName;
  dynamic isShowingItemsDetails;
  dynamic sRecordStatus;
  dynamic searchType;
  dynamic prevItemPrice;
  dynamic imei;
  dynamic firstName;
  dynamic lastName;
  dynamic delCheck;
  dynamic lineUpdCheck;
  dynamic itemBasicPrice;
  dynamic totalQuantity;
  dynamic isPo;
  dynamic itemType;
  dynamic isShowItemUomLine;

  dynamic showSalesTax;
  dynamic isAddButtonDisplay;
  dynamic isImeiRequiredForSerializedItems;
  dynamic toDisplay;
  dynamic isItemLinePriceTier;
  dynamic returnType;
  dynamic imeiList;
  dynamic isSerializedRestriction;
  dynamic imeiDepartmentStagesId;
  dynamic imeiDepartmentStagesName;
  dynamic id;
  dynamic saTransactionId;
  dynamic txnNumber;
  dynamic itemCodeId;
  dynamic itemCode;
  dynamic itemName;
  dynamic itemPrice;
  dynamic itemQuantity;
  dynamic lineTotal;
  dynamic balanceQty;
  dynamic description;
  dynamic itemUnitCost;
  dynamic companyId;
  dynamic trxCreatedBy;
  dynamic trxModifiedBy;
  dynamic trxCreatedIpAddress;
  dynamic trxModifiedIpAddress;
  dynamic companyLocationId;
  dynamic wareHouseId;
  dynamic wareHouseName;
  dynamic lineDiscountAmount;
  dynamic qtyBackOrder;
  dynamic itemQuantityShipped;
  dynamic cmpntseq;
  dynamic taxCodeName;
  dynamic taxCodeId;
  dynamic salesTaxAmount;
  dynamic itemCodeReference;
  dynamic qtyinsvc;
  dynamic qtyinuse;
  dynamic qtydmged;
  dynamic qtyrtrnd;
  dynamic qtycance;
  dynamic qtyorder;
  dynamic qtyrpair;
  dynamic transactionSourceId;
  dynamic taxCodeRate;
  dynamic lineDiscountType;
  dynamic fulfilmentBalanceQty;
  dynamic qtyfulfilled;
  dynamic itemCodeSourceId;
  dynamic lineStatus;
  dynamic fulfullmentItemId;
  dynamic fulfullmentItemCode;
  dynamic isAddedFromFulfilment;
  dynamic forexCurrencyId;
  dynamic forexCurrencyName;
  dynamic forexCurrencyRate;
  dynamic forexCurrencyItemPrice;
  dynamic orderLineId;
  dynamic displayOrder;
  dynamic binLocationId;
  dynamic originDocSource;
  dynamic originDocId;
  dynamic originDocStoreId;
  dynamic originDocSiteId;
  dynamic lineUomid;
  dynamic previousLineId;
  dynamic squareArea;
  dynamic beAttention;
  dynamic saTransaction;

  factory InvoiceItemModel.fromJson(Map<String, dynamic> json) => InvoiceItemModel(
    sImei: json["sIMEI"],
    singleImei: json["SingleIMEI"],
    showFlatRateBoxline: json["ShowFlatRateBoxline"],
    lineOutId: json["LineOutID"],
    smartUpcCode: json["SmartUPC_Code"],
    smartIsjson: json["SmartIsjson"],
    smartItemCodeId: json["SmartItemCodeID"],
    smartItemCode: json["SmartItemCode"],
    headerDoctype: json["Header_doctype"],
    smartIItemName: json["SmartIItemName"],
    smartBinLocationName: json["SmartBinLocationName"],
    smartBinLocationId: json["SmartBinLocationID"],
    smartWareHouseId: json["SmartWareHouseID"],
    smartWareHouseName: json["SmartWareHouseName"],
    smartImeiList: json["SmartIMEIList"],
    smartsRecordStatus: json["SmartsRecordStatus"],
    smartDescription: json["SmartDescription"],
    binLocationName: json["BinLocationName"],
    isShowingItemsDetails: json["IsShowingItemsDetails"],
    sRecordStatus: json["sRecordStatus"],
    searchType: json["SearchType"],
    prevItemPrice: json["PrevItemPrice"],
    imei: json["IMEI"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    delCheck: json["DelCheck"],
    lineUpdCheck: json["Line_UPD_Check"],
    itemBasicPrice: json["ItemBasicPrice"],
    totalQuantity: json["TotalQuantity"],
    isPo: json["IsPO"],
    itemType: json["ItemType"],
    isShowItemUomLine: json["IsShowItemUOMLine"],
    showSalesTax: json["ShowSalesTax"],
    isAddButtonDisplay: json["IsAddButtonDisplay"],
    isImeiRequiredForSerializedItems: json["IsIMEIRequiredForSerializedItems"],
    toDisplay: json["ToDisplay"],
    isItemLinePriceTier: json["IsItemLinePriceTier"],
    returnType: json["ReturnType"],
    imeiList: json["IMEIList"],
    isSerializedRestriction: json["isSerializedRestriction"],
    imeiDepartmentStagesId: json["IMEIDepartment_StagesID"],
    imeiDepartmentStagesName: json["IMEIDepartment_StagesName"],
    id: json["ID"],
    saTransactionId: json["SA_TransactionID"],
    txnNumber: json["TxnNumber"],
    itemCodeId: json["ItemCodeID"],
    itemCode: json["ItemCode"],
    itemName: json["ItemName"],
    itemPrice: json["ItemPrice"],
    itemQuantity: json["ItemQuantity"],
    lineTotal: json["LineTotal"],
    balanceQty: json["BalanceQty"],
    description: json["Description"],
    itemUnitCost: json["ItemUnitCost"],
    companyId: json["CompanyID"],
    trxCreatedBy: json["TrxCreatedBy"],
    trxModifiedBy: json["TrxModifiedBy"],
    trxCreatedIpAddress: json["TrxCreated_IPAddress"],
    trxModifiedIpAddress: json["TrxModified_IPAddress"],
    companyLocationId: json["CompanyLocationID"],
    wareHouseId: json["WareHouseID"],
    wareHouseName: json["WareHouseName"],
    lineDiscountAmount: json["LineDiscountAmount"],
    qtyBackOrder: json["Qty_BackOrder"],
    itemQuantityShipped: json["ItemQuantityShipped"],
    cmpntseq: json["CMPNTSEQ"],
    taxCodeName: json["TaxCodeName"],
    taxCodeId: json["TaxCodeID"],
    salesTaxAmount: json["SalesTaxAmount"],
    itemCodeReference: json["ItemCode_Reference"],
    qtyinsvc: json["QTYINSVC"],
    qtyinuse: json["QTYINUSE"],
    qtydmged: json["QTYDMGED"],
    qtyrtrnd: json["QTYRTRND"],
    qtycance: json["QTYCANCE"],
    qtyorder: json["QTYORDER"],
    qtyrpair: json["QTYRPAIR"],
    transactionSourceId: json["TransactionSourceID"],
    taxCodeRate: json["TaxCode_Rate"],
    lineDiscountType: json["LineDiscountType"],
    fulfilmentBalanceQty: json["FulfilmentBalanceQty"],
    qtyfulfilled: json["QTYFULFILLED"],
    itemCodeSourceId: json["ItemCode_SourceID"],
    lineStatus: json["LineStatus"],
    fulfullmentItemId: json["Fulfullment_ItemID"],
    fulfullmentItemCode: json["Fulfullment_ItemCode"],
    isAddedFromFulfilment: json["IsAddedFromFulfilment"],
    forexCurrencyId: json["ForexCurrencyID"],
    forexCurrencyName: json["ForexCurrencyName"],
    forexCurrencyRate: json["ForexCurrency_Rate"],
    forexCurrencyItemPrice: json["ForexCurrency_ItemPrice"],
    orderLineId: json["OrderLineID"],
    displayOrder: json["DisplayOrder"],
    binLocationId: json["BinLocationID"],
    originDocSource: json["OriginDocSource"],
    originDocId: json["OriginDocID"],
    originDocStoreId: json["OriginDoc_StoreID"],
    originDocSiteId: json["OriginDoc_SiteID"],
    lineUomid: json["LineUOMID"],
    previousLineId: json["PreviousLineID"],
    squareArea: json["SquareArea"],
    beAttention: json["BeAttention"],
    saTransaction: json["SA_Transaction"],
  );

  Map<String, dynamic> toJson() => {
    "sIMEI": sImei,
    "SingleIMEI": singleImei,
    "ShowFlatRateBoxline": showFlatRateBoxline,
    "LineOutID": lineOutId,
    "SmartUPC_Code": smartUpcCode,
    "SmartIsjson": smartIsjson,
    "SmartItemCodeID": smartItemCodeId,
    "SmartItemCode": smartItemCode,
    "Header_doctype": headerDoctype,
    "SmartIItemName": smartIItemName,
    "SmartBinLocationName": smartBinLocationName,
    "SmartBinLocationID": smartBinLocationId,
    "SmartWareHouseID": smartWareHouseId,
    "SmartWareHouseName": smartWareHouseName,
    "SmartIMEIList": smartImeiList,
    "SmartsRecordStatus": smartsRecordStatus,
    "SmartDescription": smartDescription,
    "BinLocationName": binLocationName,
    "IsShowingItemsDetails": isShowingItemsDetails,
    "sRecordStatus": sRecordStatus,
    "SearchType": searchType,
    "PrevItemPrice": prevItemPrice,
    "IMEI": imei,
    "FirstName": firstName,
    "LastName": lastName,
    "DelCheck": delCheck,
    "Line_UPD_Check": lineUpdCheck,
    "ItemBasicPrice": itemBasicPrice,
    "TotalQuantity": totalQuantity,
    "IsPO": isPo,
    "ItemType": itemType,
    "IsShowItemUOMLine": isShowItemUomLine,
    "ShowSalesTax": showSalesTax,
    "IsAddButtonDisplay": isAddButtonDisplay,
    "IsIMEIRequiredForSerializedItems": isImeiRequiredForSerializedItems,
    "ToDisplay": toDisplay,
    "IsItemLinePriceTier": isItemLinePriceTier,
    "ReturnType": returnType,
    "IMEIList": imeiList,
    "isSerializedRestriction": isSerializedRestriction,
    "IMEIDepartment_StagesID": imeiDepartmentStagesId,
    "IMEIDepartment_StagesName": imeiDepartmentStagesName,
    "ID": id,
    "SA_TransactionID": saTransactionId,
    "TxnNumber": txnNumber,
    "ItemCodeID": itemCodeId,
    "ItemCode": itemCode,
    "ItemName": itemName,
    "ItemPrice": itemPrice,
    "ItemQuantity": itemQuantity,
    "LineTotal": lineTotal,
    "BalanceQty": balanceQty,
    "Description": description,
    "ItemUnitCost": itemUnitCost,
    "CompanyID": companyId,
    "TrxCreatedBy": trxCreatedBy,
    "TrxModifiedBy": trxModifiedBy,
    "TrxCreated_IPAddress": trxCreatedIpAddress,
    "TrxModified_IPAddress": trxModifiedIpAddress,
    "CompanyLocationID": companyLocationId,
    "WareHouseID": wareHouseId,
    "WareHouseName": wareHouseName,
    "LineDiscountAmount": lineDiscountAmount,
    "Qty_BackOrder": qtyBackOrder,
    "ItemQuantityShipped": itemQuantityShipped,
    "CMPNTSEQ": cmpntseq,
    "TaxCodeName": taxCodeName,
    "TaxCodeID": taxCodeId,
    "SalesTaxAmount": salesTaxAmount,
    "ItemCode_Reference": itemCodeReference,
    "QTYINSVC": qtyinsvc,
    "QTYINUSE": qtyinuse,
    "QTYDMGED": qtydmged,
    "QTYRTRND": qtyrtrnd,
    "QTYCANCE": qtycance,
    "QTYORDER": qtyorder,
    "QTYRPAIR": qtyrpair,
    "TransactionSourceID": transactionSourceId,
    "TaxCode_Rate": taxCodeRate,
    "LineDiscountType": lineDiscountType,
    "FulfilmentBalanceQty": fulfilmentBalanceQty,
    "QTYFULFILLED": qtyfulfilled,
    "ItemCode_SourceID": itemCodeSourceId,
    "LineStatus": lineStatus,
    "Fulfullment_ItemID": fulfullmentItemId,
    "Fulfullment_ItemCode": fulfullmentItemCode,
    "IsAddedFromFulfilment": isAddedFromFulfilment,
    "ForexCurrencyID": forexCurrencyId,
    "ForexCurrencyName": forexCurrencyName,
    "ForexCurrency_Rate": forexCurrencyRate,
    "ForexCurrency_ItemPrice": forexCurrencyItemPrice,
    "OrderLineID": orderLineId,
    "DisplayOrder": displayOrder,
    "BinLocationID": binLocationId,
    "OriginDocSource": originDocSource,
    "OriginDocID": originDocId,
    "OriginDoc_StoreID": originDocStoreId,
    "OriginDoc_SiteID": originDocSiteId,
    "LineUOMID": lineUomid,
    "PreviousLineID": previousLineId,
    "SquareArea": squareArea,
    "BeAttention": beAttention,
    "SA_Transaction": saTransaction,
  };
}

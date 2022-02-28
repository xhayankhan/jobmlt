



class POItemModel {
   dynamic qtyonHand;
   dynamic stockLevel;
   dynamic reorderPoint;
   dynamic sCableType;
   dynamic sOriginalBox;
   dynamic sAccessories;
   dynamic sSaleTax;
   dynamic uPCCode;
   dynamic vCEP;
   dynamic itemTrackingType;
   dynamic itemType;
   dynamic batchNumber;
   dynamic iMEI;
   dynamic uOMName;
   dynamic uOMNameOriginalName;
   dynamic boxNumber;
   dynamic iMEIStatus;
   dynamic iD;
   dynamic purchaseOrderID;
   dynamic lineItemID;
   dynamic lineItemCode;
   dynamic lineItemName;
   dynamic lineItemDescription;
   dynamic lineUnitOfMeasure;
   dynamic lineQuantity;
   dynamic lineRate;
   dynamic lineTotal;
   dynamic balanceQuantity;
   dynamic lineStatus;
   dynamic lineItemDueDate;
   dynamic companyID;
   dynamic dateTimeCreated;
   dynamic dateTimeModified;
   dynamic trxCreatedBy;
   dynamic trxModifiedBy;
   dynamic trxCreatedIPAddress;
   dynamic trxModifiedIPAddress;
   dynamic jobID;
   dynamic companyLocationID;
   dynamic wareHouseID;
   dynamic wareHouseName;
   dynamic lotSerialNumber;
   dynamic customerID;
   dynamic itemUOMID;


  POItemModel({
    this.qtyonHand,
    this.stockLevel,
    this.reorderPoint,
    this.sCableType,
    this.sOriginalBox,
    this.sAccessories,
    this.sSaleTax,
    this.uPCCode,
    this.vCEP,
    this.itemTrackingType,
    this.itemType,
    this.batchNumber,
    this.iMEI,
    this.uOMName,
    this.uOMNameOriginalName,
    this.boxNumber,
    this.iMEIStatus,
    this.iD,
    this.purchaseOrderID,
    this.lineItemID,
    this.lineItemCode,
    this.lineItemName,
    this.lineItemDescription,
    this.lineUnitOfMeasure,
    this.lineQuantity,
    this.lineRate,
    this.lineTotal,
    this.balanceQuantity,
    this.lineStatus,
    this.lineItemDueDate,
    this.companyID,
    this.dateTimeCreated,
    this.dateTimeModified,
    this.trxCreatedBy,
    this.trxModifiedBy,
    this.trxCreatedIPAddress,
    this.trxModifiedIPAddress,
    this.jobID,
    this.companyLocationID,
    this.wareHouseID,
    this.wareHouseName,
    this.lotSerialNumber,
    this.customerID,
    this.itemUOMID,

  });

  POItemModel.fromJson(Map<String, dynamic> json){

    itemType = json['ItemType'];
    batchNumber = json['BatchNumber'];
    iD = json['ID'] ;
    purchaseOrderID = json['PurchaseOrderID'];
    lineItemID = json['LineItemID'];
    lineItemCode = json['LineItemCode'];
    lineItemName = json['LineItemName'];
    lineItemDescription = json['LineItemDescription'];
    lineUnitOfMeasure = json['LineUnitOfMeasure'];
    lineQuantity = json['LineQuantity'];
    lineRate = json['LineRate'];
    lineTotal = json['LineTotal'];
    balanceQuantity = json['BalanceQuantity'];
    lineStatus = json['LineStatus'];
    companyID = json['CompanyID'];
    dateTimeCreated = json['DateTimeCreated'];
    dateTimeModified = json['DateTimeModified'];
    trxCreatedBy = json['TrxCreatedBy'];
    trxModifiedBy = json['TrxModifiedBy'];
    jobID = json['JobID'];
    companyLocationID = json['CompanyLocationID'];
    wareHouseID = json['WareHouseID'];
    wareHouseName = json['WareHouseName'];
    customerID = json['CustomerID'];


  }
}
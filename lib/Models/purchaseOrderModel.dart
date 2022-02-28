// // To parse this JSON data, do
// //
// //     final purchaseOrderModel = purchaseOrderModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<PurchaseOrderModel> purchaseOrderModelFromJson(String str) => List<PurchaseOrderModel>.from(json.decode(str).map((x) => PurchaseOrderModel.fromJson(x)));
//
// //String purchaseOrderModelToJson(List<PurchaseOrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class PurchaseOrderModel {
//   PurchaseOrderModel({
//     this.viewName,
//     this.estimateId,
//     this.itemIDsArray,
//     this.getPoItemWithVendorInfoGrid = false,
//     this.isGetPoItemWithVendorInfo = false,
//     this.isAdvanceInventory = false,
//     this.showVendorContacts = false,
//     this.isChangeShpippingAddress = false,
//     this.mailingAddress,
//     this.shippingAddress,
//     this.said,
//     this.isShippingMethodRequired = false,
//     this.isDueDateRequired = false,
//     this.isImeiTracking = false,
//     this.vendorName,
//     this.vendorCode,
//     this.paymentTermName,
//     this.shipName,
//     this.shippingMethodName,
//     this.itemDetail,
//     this.iMeiReceivingResponses,
//     this.id,
//     this.vendorId,
//     this.transactionNumber,
//     this.transactionDate,
//     this.transactionReference,
//     this.streetAdrress,
//     this.city,
//     this.state,
//     this.zipCode,
//     this.country,
//     this.phone,
//     this.phone2,
//     this.fax,
//     this.email,
//     this.shipToStreetAdrress,
//     this.shipToCity,
//     this.shipToState,
//     this.shipToZipCode,
//     this.shipToCountry,
//     this.shipToPhone,
//     this.shipToPhone2,
//     this.shipToFax,
//     this.shipToEmail,
//     this.paymentTermId,
//     this.dueDate,
//     this.expectedDate,
//     this.companyId,
//     this.shippingMethod,
//     this.trackingNumber,
//     this.subTotal,
//     this.total,
//     this.memo,
//     this.poStatus,
//     this.dateTimeCreated,
//     this.dateTimeModified,
//     this.shipId,
//     this.message,
//     this.trxCreatedBy,
//     this.trxModifiedBy,
//     this.trxCreatedIpAddress,
//     this.trxModifiedIpAddress,
//     this.jobId,
//     this.companyLocationId,
//     this.wareHouseId,
//     this.wareHouseName,
//     this.shippingCharges,
//     this.workOrderNumber,
//     this.shipToVendorName,
//     this.etaDateTime,
//     this.vendorContactId,
//     this.apVendor,
//     // this.poPurchaseOrderLine,
//   });
//
//   dynamic viewName;
//   dynamic estimateId;
//   dynamic itemIDsArray;
//
//    bool getPoItemWithVendorInfoGrid;
//    bool isGetPoItemWithVendorInfo;
//   bool isAdvanceInventory;
//
//    bool showVendorContacts;
//   bool isChangeShpippingAddress;
//   dynamic mailingAddress;
//   dynamic shippingAddress;
//   dynamic said;
//   bool isShippingMethodRequired;
//   bool isDueDateRequired;
//   bool isImeiTracking;
//   dynamic vendorName;
//   dynamic vendorCode;
//   dynamic paymentTermName;
//   dynamic shipName;
//   dynamic shippingMethodName;
//   dynamic itemDetail;
//   dynamic iMeiReceivingResponses;
//   dynamic id;
//   dynamic vendorId;
//   dynamic transactionNumber;
//   dynamic transactionDate;
//   dynamic transactionReference;
//   dynamic streetAdrress;
//   dynamic city;
//   dynamic state;
//   dynamic zipCode;
//   dynamic country;
//   dynamic phone;
//   dynamic phone2;
//   dynamic fax;
//   dynamic email;
//   dynamic shipToStreetAdrress;
//   dynamic shipToCity;
//   dynamic shipToState;
//   dynamic shipToZipCode;
//   dynamic shipToCountry;
//   dynamic shipToPhone;
//   dynamic shipToPhone2;
//   dynamic shipToFax;
//   dynamic shipToEmail;
//   dynamic paymentTermId;
//   dynamic dueDate;
//   dynamic expectedDate;
//   dynamic companyId;
//   dynamic shippingMethod;
//   dynamic trackingNumber;
//   dynamic subTotal;
//   dynamic total;
//   dynamic memo;
//   dynamic poStatus;
//   dynamic dateTimeCreated;
//   dynamic dateTimeModified;
//   dynamic shipId;
//   dynamic message;
//   dynamic trxCreatedBy;
//   dynamic trxModifiedBy;
//   dynamic trxCreatedIpAddress;
//   dynamic trxModifiedIpAddress;
//   dynamic jobId;
//   dynamic companyLocationId;
//   dynamic wareHouseId;
//   dynamic wareHouseName;
//   dynamic shippingCharges;
//   dynamic workOrderNumber;
//   dynamic shipToVendorName;
//   dynamic etaDateTime;
//   dynamic vendorContactId;
//   dynamic apVendor;
//
//   //List<dynamic> poPurchaseOrderLine;
//
//   factory PurchaseOrderModel.fromJson(Map<String, dynamic> json) =>
//       PurchaseOrderModel(
//         viewName: json["ViewName"],
//         estimateId: json["EstimateID"],
//         itemIDsArray: json["ItemIDsArray"],
//         getPoItemWithVendorInfoGrid: json["GetPOItemWithVendorInfoGrid"],
//          isGetPoItemWithVendorInfo: json["isGetPOItemWithVendorInfo"],
//         isAdvanceInventory: json["isAdvanceInventory"] == null
//             ? false
//             : json["isAdvanceInventory"],
//          showVendorContacts: json["ShowVendorContacts"],
//         isChangeShpippingAddress: json["IsChangeShpippingAddress"] == null
//             ? false
//             : json["IsChangeShpippingAddress"],
//         mailingAddress: json["MailingAddress"],
//         shippingAddress: json["ShippingAddress"],
//         said: json["SAID"],
//         isShippingMethodRequired: json["IsShippingMethodRequired"] == null
//             ? false
//             : json["IsShippingMethodRequired"],
//         isDueDateRequired: json["IsDueDateRequired"] == null
//             ? false
//             : json["IsDueDateRequired"],
//         isImeiTracking: json["IsIMEITracking"] == null
//             ? false
//             : json["IsIMEITracking"],
//         vendorName: json["VendorName"],
//         vendorCode: json["VendorCode"],
//         paymentTermName: json["PaymentTermName"],
//         shipName: json["ShipName"],
//         shippingMethodName: json["ShippingMethodName"] == null
//             ? null
//             : json["ShippingMethodName"],
//         itemDetail: json["ItemDetail"],
//         iMeiReceivingResponses: json["iMEIReceivingResponses"],
//         id: json["ID"],
//         vendorId: json["VendorID"],
//         transactionNumber: json["TransactionNumber"],
//         transactionDate: json["TransactionDate"],
//         transactionReference: json["TransactionReference"],
//         streetAdrress: json["StreetAdrress"],
//         city: json["City"],
//         state: json["State"],
//         zipCode: json["ZipCode"],
//         country: json["Country"],
//         phone: json["Phone"],
//         phone2: json["Phone2"],
//         fax: json["Fax"],
//         email: json["Email"],
//         shipToStreetAdrress: json["ShipToStreetAdrress"],
//         shipToCity: json["ShipToCity"],
//         shipToState: json["ShipToState"],
//         shipToZipCode: json["ShipToZipCode"],
//         shipToCountry: json["ShipToCountry"] == null
//             ? null
//             : json["ShipToCountry"],
//         shipToPhone: json["ShipToPhone"] == null ? null : json["ShipToPhone"],
//         shipToPhone2: json["ShipToPhone2"],
//         shipToFax: json["ShipToFax"],
//         shipToEmail: json["ShipToEmail"] == null ? null : json["ShipToEmail"],
//         paymentTermId: json["PaymentTermID"],
//         dueDate: ["DueDate"],
//         expectedDate: json["ExpectedDate"],
//         companyId: json["CompanyID"],
//         shippingMethod: json["ShippingMethod"] == null
//             ? null
//             : json["ShippingMethod"],
//         trackingNumber: json["TrackingNumber"],
//         subTotal: json["SubTotal"],
//         total: json["Total"],
//         memo: json["Memo"],
//         poStatus: json["POStatus"],
//         dateTimeCreated: ["DateTimeCreated"],
//         dateTimeModified: json["DateTimeModified"] == null ? null : DateTime
//             .parse(json["DateTimeModified"]),
//         shipId: json["ShipID"],
//         message: json["Message"] == null ? null : json["Message"],
//         trxCreatedBy: json["TrxCreatedBy"],
//         trxModifiedBy: json["TrxModifiedBy"] == null
//             ? null
//             : json["TrxModifiedBy"],
//         trxCreatedIpAddress: json["TrxCreated_IPAddress"],
//         trxModifiedIpAddress: json["TrxModified_IPAddress"] == null
//             ? null
//             : json["TrxModified_IPAddress"],
//         jobId: json["JobID"],
//         companyLocationId: json["CompanyLocationID"],
//         wareHouseId: json["WareHouseID"],
//         wareHouseName: json["WareHouseName"],
//         shippingCharges: json["ShippingCharges"],
//         workOrderNumber: json["WorkOrderNumber"],
//         shipToVendorName: json["ShipToVendorName"],
//         etaDateTime: json["ETA_DateTime"],
//         vendorContactId: json["VendorContactID"],
//         apVendor: json["AP_Vendor"],
//         //poPurchaseOrderLine: List<dynamic>.from(json["PO_PurchaseOrderLine"].map((x) => x)),
//       );
//
//
// }
//
//
//




class PurchaseOrderModel {
  dynamic viewName;
  dynamic estimateID;
  dynamic itemIDsArray;
  bool? getPOItemWithVendorInfoGrid;
  bool? isGetPOItemWithVendorInfo;
  bool? isAdvanceInventory;
  bool? showVendorContacts;
  bool? isChangeShpippingAddress;
  dynamic mailingAddress;
  dynamic shippingAddress;
  dynamic sAID;
  bool? isShippingMethodRequired;
  bool? isDueDateRequired;
  bool? isIMEITracking;
  dynamic vendorName;
  dynamic vendorCode;
  dynamic paymentTermName;
  dynamic shipName;
  dynamic shippingMethodName;
  dynamic itemDetail;
  dynamic iMEIReceivingResponses;
  dynamic iD;
  dynamic vendorID;
  dynamic transactionNumber;
  dynamic transactionDate;
  dynamic transactionReference;
  dynamic streetAdrress;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  dynamic country;
  dynamic phone;
  dynamic phone2;
  dynamic fax;
  dynamic email;
  dynamic shipToStreetAdrress;
  dynamic shipToCity;
  dynamic shipToState;
  dynamic shipToZipCode;
  dynamic shipToCountry;
  String? shipToPhone;
  dynamic shipToPhone2;
  dynamic shipToFax;
  String? shipToEmail;
  dynamic paymentTermID;
  dynamic dueDate;
  dynamic expectedDate;
  dynamic companyID;
  dynamic shippingMethod;
  dynamic trackingNumber;
  dynamic subTotal;
  dynamic total;
  dynamic memo;
  dynamic pOStatus;
  dynamic dateTimeCreated;
  dynamic dateTimeModified;
  dynamic shipID;
  dynamic message;
  dynamic trxCreatedBy;
  dynamic trxModifiedBy;
  dynamic trxCreatedIPAddress;
  dynamic trxModifiedIPAddress;
  dynamic jobID;
  dynamic companyLocationID;
  dynamic wareHouseID;
  dynamic wareHouseName;
  dynamic shippingCharges;
  dynamic workOrderNumber;
  dynamic shipToVendorName;
  dynamic eTADateTime;
  dynamic vendorContactID;
  dynamic aPVendor;


  PurchaseOrderModel({this.viewName,
    this.estimateID,
    this.itemIDsArray,
    this.getPOItemWithVendorInfoGrid = false,
    this.isGetPOItemWithVendorInfo = false,
    this.isAdvanceInventory = false,
    this.showVendorContacts = false,
    this.isChangeShpippingAddress = false,
    this.mailingAddress,
    this.shippingAddress,
    this.sAID,
    this.isShippingMethodRequired = false,
    this.isDueDateRequired = false,
    this.isIMEITracking = false,
    this.vendorName,
    this.vendorCode,
    this.paymentTermName,
    this.shipName,
    this.shippingMethodName,
    this.itemDetail,
    this.iMEIReceivingResponses,
    this.iD,
    this.vendorID,
    this.transactionNumber,
    this.transactionDate,
    this.transactionReference,
    this.streetAdrress,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.phone,
    this.phone2,
    this.fax,
    this.email,
    this.shipToStreetAdrress,
    this.shipToCity,
    this.shipToState,
    this.shipToZipCode,
    this.shipToCountry,
    this.shipToPhone,
    this.shipToPhone2,
    this.shipToFax,
    this.shipToEmail,
    this.paymentTermID,
    this.dueDate,
    this.expectedDate,
    this.companyID,
    this.shippingMethod,
    this.trackingNumber,
    this.subTotal,
    this.total,
    this.memo,
    this.pOStatus,
    this.dateTimeCreated,
    this.dateTimeModified,
    this.shipID,
    this.message,
    this.trxCreatedBy,
    this.trxModifiedBy,
    this.trxCreatedIPAddress,
    this.trxModifiedIPAddress,
    this.jobID,
    this.companyLocationID,
    this.wareHouseID,
    this.wareHouseName,
    this.shippingCharges,
    this.workOrderNumber,
    this.shipToVendorName,
    this.eTADateTime,
    this.vendorContactID,
    this.aPVendor,
  });

  PurchaseOrderModel.fromJson(Map<String, dynamic> json) {
    viewName = json['ViewName'];
    estimateID = json['EstimateID'];
    itemIDsArray = json['ItemIDsArray'];
    getPOItemWithVendorInfoGrid = json['GetPOItemWithVendorInfoGrid'];
    isGetPOItemWithVendorInfo = json['isGetPOItemWithVendorInfo'];
    isAdvanceInventory = json['isAdvanceInventory'];
    showVendorContacts = json['ShowVendorContacts'];
    isChangeShpippingAddress = json['IsChangeShpippingAddress'];
    mailingAddress = json['MailingAddress'];
    shippingAddress = json['ShippingAddress'];
    sAID = json['SAID'];
    isShippingMethodRequired = json['IsShippingMethodRequired'];
    isDueDateRequired = json['IsDueDateRequired'];
    isIMEITracking = json['IsIMEITracking'];
    vendorName = json['VendorName']==null?'':json['VendorName'];
    vendorCode = json['VendorCode']==null?'':json['VendorCode'];
    paymentTermName = json['PaymentTermName'];
    shipName = json['ShipName'];
    shippingMethodName = json['ShippingMethodName'];
    itemDetail = json['ItemDetail'];
    iMEIReceivingResponses = json['iMEIReceivingResponses'];
    iD = json['ID']==null?'':json['ID'];
    vendorID = json['VendorID']==null?'':json['VendorID'];
    transactionNumber = json['TransactionNumber'];
    transactionDate = json['TransactionDate']==null?'':json['TransactionDate'];
    transactionReference = json['TransactionReference'];
    streetAdrress = json['StreetAdrress'];
    city = json['City'];
    state = json['State'];
    zipCode = json['ZipCode'];
    country = json['Country'];
    phone = json['Phone'];
    phone2 = json['Phone2'];
    fax = json['Fax'];
    email = json['Email'];
    shipToStreetAdrress = json['ShipToStreetAdrress'];
    shipToCity = json['ShipToCity'];
    shipToState = json['ShipToState'];
    shipToZipCode = json['ShipToZipCode'];
    shipToCountry = json['ShipToCountry'];
    shipToPhone = json['ShipToPhone'];
    shipToPhone2 = json['ShipToPhone2'];
    shipToFax = json['ShipToFax'];
    shipToEmail = json['ShipToEmail'];
    paymentTermID = json['PaymentTermID'];
    dueDate = json['DueDate']==null?'':json['DueDate'];
    expectedDate = json['ExpectedDate'];
    companyID = json['CompanyID']==null?'':json['CompanyID'];
    shippingMethod = json['ShippingMethod'];
    trackingNumber = json['TrackingNumber'];
    subTotal = json['SubTotal']==null?'':json['SubTotal'];
    total = json['Total']==null?'':json['Total'];
    memo = json['Memo']==null?'':json['Memo'];
    pOStatus = json['POStatus']==null?'':json['POStatus'];
    dateTimeCreated = json['DateTimeCreated'];
    dateTimeModified = json['DateTimeModified'];
    shipID = json['ShipID'];
    message = json['Message']==null?'':json['Message'];
    trxCreatedBy = json['TrxCreatedBy'];
    trxModifiedBy = json['TrxModifiedBy'];
    trxCreatedIPAddress = json['TrxCreated_IPAddress'];
    trxModifiedIPAddress = json['TrxModified_IPAddress'];
    jobID = json['JobID'];
    companyLocationID = json['CompanyLocationID'];
    wareHouseID = json['WareHouseID'];
    wareHouseName = json['WareHouseName'];
    shippingCharges = json['ShippingCharges'];
    workOrderNumber = json['WorkOrderNumber']==null?'':json['WorkOrderNumber'];
    shipToVendorName = json['ShipToVendorName'];
    eTADateTime = json['ETA_DateTime'];
    vendorContactID = json['VendorContactID'];
    aPVendor = json['AP_Vendor'];

  }


}
import 'dart:convert';

List<RiItemModel> riItemModelFromJson(String str) => List<RiItemModel>.from(json.decode(str).map((x) => RiItemModel.fromJson(x)));

String riItemModelToJson(List<RiItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RiItemModel {
  RiItemModel({
    this.viewName,
    this.estimateId,
    this.itemIDsArray,
    this.getPoItemWithVendorInfoGrid=false,
    this.isGetPoItemWithVendorInfo=false,
    this.isAdvanceInventory=false,
    this.showVendorContacts=false,
    this.isChangeShpippingAddress=false,
    this.mailingAddress,
    this.shippingAddress,
    this.said,
    this.isShippingMethodRequired=false,
    this.isDueDateRequired=false,
    this.isImeiTracking=false,
    this.vendorName,
    this.vendorCode,
    this.paymentTermName,
    this.shipName,
    this.shippingMethodName,
    this.itemDetail,
    this.iMeiReceivingResponses,
    this.id,
    this.vendorId,
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
    this.paymentTermId,
    this.dueDate,
    this.expectedDate,
    this.companyId,
    this.shippingMethod,
    this.trackingNumber,
    this.subTotal,
    this.total,
    this.memo,
    this.poStatus,
    this.dateTimeCreated,
    this.dateTimeModified,
    this.shipId,
    this.message,
    this.trxCreatedBy,
    this.trxModifiedBy,
    this.trxCreatedIpAddress,
    this.trxModifiedIpAddress,
    this.jobId,
    this.companyLocationId,
    this.wareHouseId,
    this.wareHouseName,
    this.shippingCharges,
    this.workOrderNumber,
    this.shipToVendorName,
    this.etaDateTime,
    this.vendorContactId,
    this.apVendor,

  });

  dynamic viewName;
  dynamic estimateId;
  dynamic itemIDsArray;
  bool getPoItemWithVendorInfoGrid;
  bool isGetPoItemWithVendorInfo;
  bool isAdvanceInventory;
  bool showVendorContacts;
  bool isChangeShpippingAddress;
  dynamic mailingAddress;
  dynamic shippingAddress;
  dynamic said;
  bool isShippingMethodRequired;
  bool isDueDateRequired;
  bool isImeiTracking;
  dynamic vendorName;
  dynamic vendorCode;
  dynamic paymentTermName;
  dynamic shipName;
  dynamic shippingMethodName;
  dynamic itemDetail;
  dynamic iMeiReceivingResponses;
  dynamic id;
  dynamic vendorId;
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
  dynamic shipToPhone;
  dynamic shipToPhone2;
  dynamic shipToFax;
  dynamic shipToEmail;
  dynamic paymentTermId;
  dynamic dueDate;
  dynamic expectedDate;
  dynamic companyId;
  dynamic shippingMethod;
  dynamic trackingNumber;
  dynamic subTotal;
  dynamic total;
  dynamic memo;
  dynamic poStatus;
  dynamic dateTimeCreated;
  dynamic dateTimeModified;
  dynamic shipId;
  dynamic message;
  dynamic trxCreatedBy;
  dynamic trxModifiedBy;
  dynamic trxCreatedIpAddress;
  dynamic trxModifiedIpAddress;
  dynamic jobId;
  dynamic companyLocationId;
  dynamic wareHouseId;
  dynamic wareHouseName;
  dynamic shippingCharges;
  dynamic workOrderNumber;
  dynamic shipToVendorName;
  dynamic etaDateTime;
  dynamic vendorContactId;
  dynamic apVendor;


  factory RiItemModel.fromJson(Map<String, dynamic> json) => RiItemModel(
    viewName: json["ViewName"],
    estimateId: json["EstimateID"],
    itemIDsArray: json["ItemIDsArray"],
    getPoItemWithVendorInfoGrid: json["GetPOItemWithVendorInfoGrid"]==null?false:json["GetPOItemWithVendorInfoGrid"],
    isGetPoItemWithVendorInfo: json["isGetPOItemWithVendorInfo"]==null?false:json["isGetPOItemWithVendorInfo"],
    isAdvanceInventory: json["isAdvanceInventory"]==null?false:json["isAdvanceInventory"],
    showVendorContacts: json["ShowVendorContacts"]==null?false:json["ShowVendorContacts"],
    isChangeShpippingAddress: json["IsChangeShpippingAddress"]==null?false:json["IsChangeShpippingAddress"],
    mailingAddress: json["MailingAddress"],
    shippingAddress: json["ShippingAddress"],
    said: json["SAID"],
    isShippingMethodRequired: json["IsShippingMethodRequired"]==null?false:json["IsShippingMethodRequired"],
    isDueDateRequired: json["IsDueDateRequired"]==null?false:json["IsDueDateRequired"],
    isImeiTracking: json["IsIMEITracking"]==null?false:json["IsIMEITracking"],
    vendorName: json["VendorName"],
    vendorCode: json["VendorCode"],
    paymentTermName: json["PaymentTermName"],
    shipName: json["ShipName"],
    shippingMethodName: json["ShippingMethodName"],
    itemDetail: json["ItemDetail"],
    iMeiReceivingResponses: json["iMEIReceivingResponses"],
    id: json["ID"],
    vendorId: json["VendorID"],
    transactionNumber: json["TransactionNumber"],
    transactionDate: json["TransactionDate"],
    transactionReference: json["TransactionReference"],
    streetAdrress: json["StreetAdrress"],
    city: json["City"],
    state: json["State"],
    zipCode: json["ZipCode"],
    country: json["Country"],
    phone: json["Phone"],
    phone2: json["Phone2"],
    fax: json["Fax"],
    email: json["Email"],
    shipToStreetAdrress: json["ShipToStreetAdrress"],
    shipToCity: json["ShipToCity"],
    shipToState: json["ShipToState"],
    shipToZipCode: json["ShipToZipCode"],
    shipToCountry: json["ShipToCountry"],
    shipToPhone: json["ShipToPhone"],
    shipToPhone2: json["ShipToPhone2"],
    shipToFax: json["ShipToFax"],
    shipToEmail: json["ShipToEmail"],
    paymentTermId: json["PaymentTermID"],
    dueDate: json["DueDate"],
    expectedDate: json["ExpectedDate"],
    companyId: json["CompanyID"],
    shippingMethod: json["ShippingMethod"],
    trackingNumber: json["TrackingNumber"],
    subTotal: json["SubTotal"],
    total: json["Total"],
    memo: json["Memo"],
    poStatus: json["POStatus"],
    dateTimeCreated: json["DateTimeCreated"],
    dateTimeModified: json["DateTimeModified"],
    shipId: json["ShipID"],
    message: json["Message"],
    trxCreatedBy: json["TrxCreatedBy"],
    trxModifiedBy: json["TrxModifiedBy"],
    trxCreatedIpAddress: json["TrxCreated_IPAddress"],
    trxModifiedIpAddress: json["TrxModified_IPAddress"],
    jobId: json["JobID"],
    companyLocationId: json["CompanyLocationID"],
    wareHouseId: json["WareHouseID"],
    wareHouseName: json["WareHouseName"],
    shippingCharges: json["ShippingCharges"],
    workOrderNumber: json["WorkOrderNumber"],
    shipToVendorName: json["ShipToVendorName"],
    etaDateTime: json["ETA_DateTime"],
    vendorContactId: json["VendorContactID"],
    apVendor: json["AP_Vendor"],

  );

  Map<String, dynamic> toJson() => {
    "ViewName": viewName,
    "EstimateID": estimateId,
    "ItemIDsArray": itemIDsArray,
    "GetPOItemWithVendorInfoGrid": getPoItemWithVendorInfoGrid,
    "isGetPOItemWithVendorInfo": isGetPoItemWithVendorInfo,
    "isAdvanceInventory": isAdvanceInventory,
    "ShowVendorContacts": showVendorContacts,
    "IsChangeShpippingAddress": isChangeShpippingAddress,
    "MailingAddress": mailingAddress,
    "ShippingAddress": shippingAddress,
    "SAID": said,
    "IsShippingMethodRequired": isShippingMethodRequired,
    "IsDueDateRequired": isDueDateRequired,
    "IsIMEITracking": isImeiTracking,
    "VendorName": vendorName,
    "VendorCode": vendorCode,
    "PaymentTermName": paymentTermName,
    "ShipName": shipName,
    "ShippingMethodName": shippingMethodName,
    "ItemDetail": itemDetail,
    "iMEIReceivingResponses": iMeiReceivingResponses,
    "ID": id,
    "VendorID": vendorId,
    "TransactionNumber": transactionNumber,
    "TransactionDate": transactionDate,
    "TransactionReference": transactionReference,
    "StreetAdrress": streetAdrress,
    "City": city,
    "State": state,
    "ZipCode": zipCode,
    "Country": country,
    "Phone": phone,
    "Phone2": phone2,
    "Fax": fax,
    "Email": email,
    "ShipToStreetAdrress": shipToStreetAdrress,
    "ShipToCity": shipToCity,
    "ShipToState": shipToState,
    "ShipToZipCode": shipToZipCode,
    "ShipToCountry": shipToCountry,
    "ShipToPhone": shipToPhone,
    "ShipToPhone2": shipToPhone2,
    "ShipToFax": shipToFax,
    "ShipToEmail": shipToEmail,
    "PaymentTermID": paymentTermId,
    "DueDate": dueDate.toIso8601String(),
    "ExpectedDate": expectedDate,
    "CompanyID": companyId,
    "ShippingMethod": shippingMethod,
    "TrackingNumber": trackingNumber,
    "SubTotal": subTotal,
    "Total": total,
    "Memo": memo,
    "POStatus": poStatus,
    "DateTimeCreated": dateTimeCreated,
    "DateTimeModified": dateTimeModified.toIso8601String(),
    "ShipID": shipId,
    "Message": message,
    "TrxCreatedBy": trxCreatedBy,
    "TrxModifiedBy": trxModifiedBy,
    "TrxCreated_IPAddress": trxCreatedIpAddress,
    "TrxModified_IPAddress": trxModifiedIpAddress,
    "JobID": jobId,
    "CompanyLocationID": companyLocationId,
    "WareHouseID": wareHouseId,
    "WareHouseName": wareHouseName,
    "ShippingCharges": shippingCharges,
    "WorkOrderNumber": workOrderNumber,
    "ShipToVendorName": shipToVendorName,
    "ETA_DateTime": etaDateTime,
    "VendorContactID": vendorContactId,
    "AP_Vendor": apVendor,

  };
}

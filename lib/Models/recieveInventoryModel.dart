// To parse this JSON data, do
//
//     final recieveInventoryModel = recieveInventoryModelFromJson(jsonString);

import 'dart:convert';

List<RecieveInventoryModel> recieveInventoryModelFromJson(String str) => List<RecieveInventoryModel>.from(json.decode(str).map((x) => RecieveInventoryModel.fromJson(x)));

String recieveInventoryModelToJson(List<RecieveInventoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecieveInventoryModel {
  RecieveInventoryModel({
    this.id,
    this.companyId,
    this.memo,
    this.poNumber,
    this.refNumber,
    this.workOrderNumber,
    this.total,
    this.billId,
    this.txnNumber,
    this.vendorId,
    this.txnDate,
    this.companyName,
    this.dueDate,
    this.amountDue,
    this.transactionType,
    this.vendorName,
    this.streetAdrress,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.phone,
    this.phone2,
    this.fax,
    this.email,
    this.totalAmount,
    this.poPurchaseOrderId,
    this.dateTimeCreated,
    this.dateTimeModified,
    this.billingStatus=false,
    this.trxCreatedBy,
    this.trxModifiedBy,
    this.trxCreatedIpAddress,
    this.trxModifiedIpAddress,
    this.jobId,
    this.companyLocationId,
    this.wareHouseId,
    this.wareHouseName,
    this.shippingCharges,
    this.docStatus,
    this.originalTxnNumber,
    this.paymentTermId,
    this.paymentTermName,
    this.amount,
    this.isPaid=false,
    this.isTaxIncluded,
    this.billReceived=false,
    this.transactionSource,
    this.glbsAccountId,
    this.openingBalanceAmount,
    this.transactionStatus,
    this.originDocId,
    this.originDocSource,
    this.vendorContactId,
    this.salesRepId,
  });

  dynamic id;
  dynamic companyId;
  dynamic memo;
  dynamic poNumber;
  dynamic refNumber;
  dynamic workOrderNumber;
  dynamic total;
  dynamic billId;
  dynamic txnNumber;
  dynamic vendorId;
  dynamic txnDate;
  dynamic companyName;
  dynamic dueDate;
  dynamic amountDue;
  dynamic transactionType;
  dynamic vendorName;
  dynamic streetAdrress;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  dynamic country;
  dynamic phone;
  dynamic phone2;
  dynamic fax;
  dynamic email;
  dynamic totalAmount;
  dynamic poPurchaseOrderId;
  dynamic dateTimeCreated;
  dynamic dateTimeModified;
  bool billingStatus;
  dynamic trxCreatedBy;
  dynamic trxModifiedBy;
  dynamic trxCreatedIpAddress;
  dynamic trxModifiedIpAddress;
  dynamic jobId;
  dynamic companyLocationId;
  dynamic wareHouseId;
  dynamic wareHouseName;
  dynamic shippingCharges;
  dynamic docStatus;
  dynamic originalTxnNumber;
  dynamic paymentTermId;
  dynamic paymentTermName;
  dynamic amount;
  bool isPaid;
  dynamic isTaxIncluded;
  bool billReceived;
  dynamic transactionSource;
  dynamic glbsAccountId;
  dynamic openingBalanceAmount;
  dynamic transactionStatus;
  dynamic originDocId;
  dynamic originDocSource;
  dynamic vendorContactId;
  dynamic salesRepId;

  factory RecieveInventoryModel.fromJson(Map<String, dynamic> json) => RecieveInventoryModel(
    id: json["ID"],
    companyId: json["CompanyID"],
    memo: json["Memo"],
    poNumber: json["PONumber"],
    refNumber: json["RefNumber"],
    workOrderNumber: json["WorkOrderNumber"],
    total: json["Total"],
    billId: json["BillID"],
    txnNumber: json["TxnNumber"],
    vendorId: json["VendorID"],
    txnDate: json["TxnDate"],
    companyName: json["CompanyName"],
    dueDate: json["DueDate"],
    amountDue: json["AmountDue"],
    transactionType: json["TransactionType"],
    vendorName: json["VendorName"],
    streetAdrress: json["StreetAdrress"],
    city: json["City"],
    state: json["State"],
    zipCode: json["ZipCode"],
    country: json["Country"],
    phone: json["Phone"],
    phone2: json["Phone2"],
    fax: json["Fax"],
    email: json["Email"],
    totalAmount: json["TotalAmount"],
    poPurchaseOrderId: json["PO_PurchaseOrderID"],
    dateTimeCreated: json["DateTimeCreated"],
    dateTimeModified: json["DateTimeModified"] == null ? null : json["DateTimeModified"],
    billingStatus: json["BillingStatus"],
    trxCreatedBy: json["TrxCreatedBy"],
    trxModifiedBy: json["TrxModifiedBy"] == null ? null : json["TrxModifiedBy"],
    trxCreatedIpAddress: json["TrxCreated_IPAddress"],
    trxModifiedIpAddress: json["TrxModified_IPAddress"] == null ? null : json["TrxModified_IPAddress"],
    jobId: json["JobID"],
    companyLocationId: json["CompanyLocationID"],
    wareHouseId: json["WareHouseID"],
    wareHouseName: json["WareHouseName"],
    shippingCharges: json["ShippingCharges"],
    docStatus: json["Doc_Status"],
    originalTxnNumber: json["OriginalTxnNumber"],
    paymentTermId: json["PaymentTermID"],
    paymentTermName: json["PaymentTermName"],
    amount: json["Amount"],
    isPaid: json["IsPaid"],
    isTaxIncluded: json["IsTaxIncluded"],
    billReceived: json["BillReceived"],
    transactionSource: json["TransactionSource"],
    glbsAccountId: json["GLBSAccountID"],
    openingBalanceAmount: json["OpeningBalanceAmount"],
    transactionStatus: json["TransactionStatus"],
    originDocId: json["OriginDocID"],
    originDocSource: json["OriginDocSource"],
    vendorContactId: json["VendorContactID"] == null ? null : json["VendorContactID"],
    salesRepId: json["SalesRepID"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CompanyID": companyId,
    "Memo": memo,
    "PONumber": poNumber,
    "RefNumber": refNumber,
    "WorkOrderNumber": workOrderNumber,
    "Total": total,
    "BillID": billId,
    "TxnNumber": txnNumber,
    "VendorID": vendorId,
    "TxnDate": txnDate.toIso8601String(),
    "CompanyName": companyName,
    "DueDate": dueDate.toIso8601String(),
    "AmountDue": amountDue,
    "TransactionType": transactionType,
    "VendorName": vendorName,
    "StreetAdrress": streetAdrress,
    "City": city,
    "State": state,
    "ZipCode": zipCode,
    "Country": country,
    "Phone": phone,
    "Phone2": phone2,
    "Fax": fax,
    "Email": email,
    "TotalAmount": totalAmount,
    "PO_PurchaseOrderID": poPurchaseOrderId,
    "DateTimeCreated": dateTimeCreated.toIso8601String(),
    "DateTimeModified": dateTimeModified == null ? null : dateTimeModified.toIso8601String(),
    "BillingStatus": billingStatus,
    "TrxCreatedBy": trxCreatedBy,
    "TrxModifiedBy": trxModifiedBy == null ? null : trxModifiedBy,
    "TrxCreated_IPAddress": trxCreatedIpAddress,
    "TrxModified_IPAddress": trxModifiedIpAddress == null ? null : trxModifiedIpAddress,
    "JobID": jobId,
    "CompanyLocationID": companyLocationId,
    "WareHouseID": wareHouseId,
    "WareHouseName": wareHouseName,
    "ShippingCharges": shippingCharges,
    "Doc_Status": docStatus,
    "OriginalTxnNumber": originalTxnNumber,
    "PaymentTermID": paymentTermId,
    "PaymentTermName": paymentTermName,
    "Amount": amount,
    "IsPaid": isPaid,
    "IsTaxIncluded": isTaxIncluded,
    "BillReceived": billReceived,
    "TransactionSource": transactionSource,
    "GLBSAccountID": glbsAccountId,
    "OpeningBalanceAmount": openingBalanceAmount,
    "TransactionStatus": transactionStatus,
    "OriginDocID": originDocId,
    "OriginDocSource": originDocSource,
    "VendorContactID": vendorContactId == null ? null : vendorContactId,
    "SalesRepID": salesRepId,
  };
}

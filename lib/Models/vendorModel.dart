// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<vendorModel> welcomeFromJson(String str) => List<vendorModel>.from(json.decode(str).map((x) => vendorModel.fromJson(x)));

String welcomeToJson(List<vendorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class vendorModel {
  vendorModel({
    this.showVendorCode,
    //this.canChangeVendorCode,
    this.paymentMethodName,
    this.paymentTermName,
    //this.showVendorContacts,
    this.id,
    this.vendorCode,
    this.vendorName,
    this.firstName,
    this.lastName,
    this.streetAdrress,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.phone,
    this.phone2,
    this.fax,
    this.contactPerson,
    this.contactNumber,
    this.email,
    this.openBalance,
    this.openingBalance,
    //this.openingBalanceDate,
    this.balance,
    this.paymentMethodId,
    this.termId,
    this.taxId,
    this.nameOnCheck,
    //this.isActive,
    this.companyId,
    this.trxCreatedBy,
 //   this.dateTimeCreated,
    this.dateTimeModified,
    this.trxModifiedBy,
    this.trxCreatedIpAddress,
    this.trxModifiedIpAddress,
    this.companyLocationId,
    this.isDeleted,
    this.vendorCompanyName,
    this.accountNo,
    this.shipFrom,
    this.creditLimit,
    this.assignedToUserId,
    this.assignedToUserName,
    this.forexCurrencyId,
    this.forexCurrencyName,
    this.welcomeForexCurrencyId,
    this.welcomeForexCurrencyName,
    this.syPaymentTerm,
    // this.apVendorPaymentItemLine,
    // this.apVendorPayment,
    // this.poPurchaseOrder,
    // this.poEstimate,
  });

  dynamic showVendorCode;
  //bool canChangeVendorCode;
  dynamic paymentMethodName;
  dynamic paymentTermName;
 // bool showVendorContacts;
  dynamic id;
  dynamic vendorCode;
  dynamic vendorName;
  dynamic firstName;
  dynamic lastName;
  dynamic streetAdrress;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  dynamic country;
  dynamic phone;
  dynamic phone2;
  dynamic fax;
  dynamic contactPerson;
  dynamic contactNumber;
  dynamic email;
  dynamic openBalance;
  dynamic openingBalance;
  //DateTime openingBalanceDate;
  dynamic balance;
  dynamic paymentMethodId;
  dynamic termId;
  dynamic taxId;
  dynamic nameOnCheck;
  //bool isActive;
  dynamic companyId;
  dynamic trxCreatedBy;
  //DateTime dateTimeCreated;
  dynamic dateTimeModified;
  dynamic trxModifiedBy;
  dynamic trxCreatedIpAddress;
  dynamic trxModifiedIpAddress;
  dynamic companyLocationId;
  dynamic isDeleted;
  dynamic vendorCompanyName;
  dynamic accountNo;
  dynamic shipFrom;
  dynamic creditLimit;
  dynamic assignedToUserId;
  dynamic assignedToUserName;
  dynamic forexCurrencyId;
  dynamic forexCurrencyName;
  dynamic welcomeForexCurrencyId;
  dynamic welcomeForexCurrencyName;
  dynamic syPaymentTerm;
  // List<dynamic> apVendorPaymentItemLine;
  // List<dynamic> apVendorPayment;
  // List<dynamic> poPurchaseOrder;
  // List<dynamic> poEstimate;

  factory vendorModel.fromJson(Map<String, dynamic> json) => vendorModel(
    showVendorCode: json["ShowVendorCode"],
    //canChangeVendorCode: json["CanChangeVendorCode"],
    paymentMethodName: json["PaymentMethodName"],
    paymentTermName: json["PaymentTermName"],
   // showVendorContacts: json["ShowVendorContacts"],
    id: json["ID"],
    vendorCode: json["VendorCode"],
    vendorName: json["VendorName"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    streetAdrress: json["StreetAdrress"],
    city: json["City"],
    state: json["State"],
    zipCode: json["ZipCode"],
    country: json["Country"],
    phone: json["Phone"],
    phone2: json["Phone2"],
    fax: json["Fax"],
    contactPerson: json["ContactPerson"],
    contactNumber: json["ContactNumber"],
    email: json["Email"],
    openBalance: json["OpenBalance"],
    openingBalance: json["OpeningBalance"],
    //openingBalanceDate: DateTime.parse(json["OpeningBalanceDate"]),
    balance: json["Balance"],
    paymentMethodId: json["PaymentMethodID"],
    termId: json["TermID"],
    taxId: json["TaxID"],
    nameOnCheck: json["NameOnCheck"],
   // isActive: json["IsActive"],
    companyId: json["CompanyID"],
    trxCreatedBy: json["TrxCreatedBy"],
    //dateTimeCreated: DateTime.parse(json["DateTimeCreated"]),
    dateTimeModified: json["DateTimeModified"],
    trxModifiedBy: json["TrxModifiedBy"],
    trxCreatedIpAddress: json["TrxCreated_IPAddress"],
    trxModifiedIpAddress: json["TrxModified_IPAddress"],
    companyLocationId: json["CompanyLocationID"],
    isDeleted: json["IsDeleted"],
    vendorCompanyName: json["VendorCompanyName"],
    accountNo: json["AccountNo"],
    shipFrom: json["ShipFrom"],
    creditLimit: json["CreditLimit"],
    assignedToUserId: json["AssignedTo_UserID"],
    assignedToUserName: json["AssignedTo_UserName"],
    forexCurrencyId: json["ForexCurrencyID"],
    forexCurrencyName: json["ForexCurrencyName"],
    welcomeForexCurrencyId: json["Forex_Currency_ID"],
    welcomeForexCurrencyName: json["Forex_Currency_Name"],
    syPaymentTerm: json["SY_PaymentTerm"],
    // apVendorPaymentItemLine: List<dynamic>.from(json["AP_VendorPaymentItemLine"].map((x) => x)),
    // apVendorPayment: List<dynamic>.from(json["AP_VendorPayment"].map((x) => x)),
    // poPurchaseOrder: List<dynamic>.from(json["PO_PurchaseOrder"].map((x) => x)),
    // poEstimate: List<dynamic>.from(json["PO_Estimate"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ShowVendorCode": showVendorCode,
   // "CanChangeVendorCode": canChangeVendorCode,
    "PaymentMethodName": paymentMethodName,
    "PaymentTermName": paymentTermName,
   // "ShowVendorContacts": showVendorContacts,
    "ID": id,
    "VendorCode": vendorCode,
    "VendorName": vendorName,
    "FirstName": firstName,
    "LastName": lastName,
    "StreetAdrress": streetAdrress,
    "City": city,
    "State": state,
    "ZipCode": zipCode,
    "Country": country,
    "Phone": phone,
    "Phone2": phone2,
    "Fax": fax,
    "ContactPerson": contactPerson,
    "ContactNumber": contactNumber,
    "Email": email,
    "OpenBalance": openBalance,
    "OpeningBalance": openingBalance,
   // "OpeningBalanceDate": openingBalanceDate.toIso8601String(),
    "Balance": balance,
    "PaymentMethodID": paymentMethodId,
    "TermID": termId,
    "TaxID": taxId,
    "NameOnCheck": nameOnCheck,
    //"IsActive": isActive,
    "CompanyID": companyId,
    "TrxCreatedBy": trxCreatedBy,
   // "DateTimeCreated": dateTimeCreated.toIso8601String(),
    "DateTimeModified": dateTimeModified,
    "TrxModifiedBy": trxModifiedBy,
    "TrxCreated_IPAddress": trxCreatedIpAddress,
    "TrxModified_IPAddress": trxModifiedIpAddress,
    "CompanyLocationID": companyLocationId,
    "IsDeleted": isDeleted,
    "VendorCompanyName": vendorCompanyName,
    "AccountNo": accountNo,
    "ShipFrom": shipFrom,
    "CreditLimit": creditLimit,
    "AssignedTo_UserID": assignedToUserId,
    "AssignedTo_UserName": assignedToUserName,
    "ForexCurrencyID": forexCurrencyId,
    "ForexCurrencyName": forexCurrencyName,
    "Forex_Currency_ID": welcomeForexCurrencyId,
    "Forex_Currency_Name": welcomeForexCurrencyName,
    "SY_PaymentTerm": syPaymentTerm,
    // "AP_VendorPaymentItemLine": List<dynamic>.from(apVendorPaymentItemLine.map((x) => x)),
    // "AP_VendorPayment": List<dynamic>.from(apVendorPayment.map((x) => x)),
    // "PO_PurchaseOrder": List<dynamic>.from(poPurchaseOrder.map((x) => x)),
    // "PO_Estimate": List<dynamic>.from(poEstimate.map((x) => x)),
  };
}

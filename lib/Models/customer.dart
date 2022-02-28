// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';
import '../Views/customerDetail.dart';
import 'package:jobmlt/Views/customerDetail.dart';

List<CustomerModel> customerFromJson(String str) => List<CustomerModel>.from(json.decode(str).map((x) => CustomerModel.fromJson(x)));

 String customerToJson(List<CustomerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerModel {
  CustomerModel({
    this.id,
    this.customerCode,
    this.customerName,
    this.openingBalance,
    this.openBalance,
    this.companyName,
    this.firstName,
    this.lastName,
    this.streetAddress,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.phone,
    this.phone2,
    this.fax,
    this.email,
  });

  dynamic id;
  dynamic customerCode;
  dynamic customerName;
  dynamic openingBalance;
  dynamic companyName;
  dynamic firstName;
  dynamic lastName;
  dynamic streetAddress;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  dynamic country;
  dynamic phone;
  dynamic phone2;
  dynamic fax;
  dynamic email;
  dynamic openBalance;


  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    final id = json["ID"]== null ? '' : json["ID"];
    final customerCode = json["CustomerCode"] == null ? '': json["CustomerCode"] ;
    final customerName = json["CustomerName"] == null ? '' : json["CustomerName"];
    final openingBalance = json["OpeningBalance"] == null ? '' : json["OpeningBalance"]  ;
    final companyName =  json["CompanyName"]== null ? '' :json["CompanyName"];
    final firstName= json["FirstName"]== null ? '' :json["FirstName"];
    final lastName= json["LastName"]== null ? '' :json["LastName"];
    final streetAddress= json["StreetAddress"]== null ? '' :json["StreetAddress"];
    final city= json["City"]== null ? '' :json["City"];
    final state= json["State"]== null ? '' :json["State"];
    final zipCode= json["ZipCode"]== null ? '' :json["ZipCode"];
    final country= json["Country"]== null ? '' :json["Country"];
    final phone= json["Phone"]== null ? '' :json["Phone"];
    final phone2 =  json["Phone2"]== null ? '' :json["Phone2"] ;
    final fax =  json["Fax"]== null ? '' :json["Fax"] ;
    final email =  json["Email"]== null ? '' :json["Email"] ;
    final openBalance = json["OpenBalance"] == null ? 0.0 : json["OpenBalance"] ;
    return CustomerModel(
        id: id,
        customerCode: customerCode,
        customerName: customerName,
        openingBalance: openingBalance,
        openBalance: openBalance,
      companyName: companyName,
      firstName: firstName,
      lastName: lastName,
      streetAddress: streetAddress,
      city: city,
      state: state,
      zipCode: zipCode,
      country: country,
      phone: phone,
      phone2: phone2,
      fax: fax,
      email: email,
        );
  }

  Map<String, dynamic> toJson() {
    return
      {
        "ID": id,
        "CustomerCode": customerCode,
        "CustomerName": customerName,
        "OpeningBalance": openingBalance,
        "OpenBalance": openBalance,
        "CompanyName": companyName,
        "FirstName": firstName,
        "LastName": lastName,
        "StreetAddress": streetAddress,
        "City": city,
        "State": state,
        "ZipCode": zipCode,
        "Country": country,
        "Phone": phone,
        "Phone2": phone2,
        "Fax": fax,
        "Email": email,
      };
  }
}
// To parse this JSON data, do
//
//     final customerUpdate = customerUpdateFromJson(jsonString);



List<CustomerUpdate> customerUpdateFromJson(String str) => List<CustomerUpdate>.from(json.decode(str).map((x) => CustomerUpdate.fromJson(x)));

String customerUpdateToJson(List<CustomerUpdate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerUpdate {
  CustomerUpdate({
    this.id,
    this.customerCode,
    this.customerName,
    this.companyName,
    this.firstName,
    this.lastName,
    this.streetAddress,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.phone,
    this.phone2,
    this.fax,
    this.email,
    this.balance,
    this.openingBalance,
    this.openingBalanceDate,
    this.openBalance,

  });

  int? id;
  dynamic customerCode;
  dynamic customerName;
  dynamic companyName;
  dynamic firstName;
  dynamic lastName;
  dynamic streetAddress;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  dynamic country;
  dynamic phone;
  dynamic phone2;
  dynamic fax;
  dynamic email;
  dynamic balance;
  dynamic openingBalance;
  dynamic openingBalanceDate;
  dynamic openBalance;


  factory CustomerUpdate.fromJson(Map<String, dynamic> json) => CustomerUpdate(
    id: json["ID"],
    customerCode: json["CustomerCode"],
    customerName: json["CustomerName"],
    companyName: json["CompanyName"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    streetAddress: json["StreetAddress"],
    city: json["City"],
    state: json["State"],
    zipCode: json["ZipCode"],
    country: json["Country"],
    phone: json["Phone"],
    phone2: json["Phone2"],
    fax: json["Fax"],
    email: json["Email"],
    balance: json["Balance"],
    openingBalance: json["OpeningBalance"],
    openBalance: json["OpenBalance"],

  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CustomerCode": customerCode,
    "CustomerName": customerName,
    "CompanyName": companyName,
    "FirstName": firstName,
    "LastName": lastName,
    "StreetAddress": streetAddress,
    "City": city,
    "State": state,
    "ZipCode": zipCode,
    "Country": country,
    "Phone": phone,
    "Phone2": phone2,
    "Fax": fax,
    "Email": email,
    "Balance": balance,
    "OpeningBalance": openingBalance,
    "OpenBalance": openBalance,

  };
}

// class customerUpdate{
//
//   customerUpdate({
//     this.id,
//     this.customerCode,
//     this.customerName,
//     this.openingBalance,
//     this.openBalance,
//     this.companyName,
//     this.firstName,
//     this.lastName,
//     this.streetAddress,
//     this.city,
//     this.state,
//     this.zipCode,
//     this.country,
//     this.phone,
//     this.phone2,
//     this.fax,
//     this.email,
//   });
//
//   dynamic id;
//   dynamic customerCode;
//   dynamic customerName;
//   dynamic openingBalance;
//   dynamic companyName;
//   dynamic firstName;
//   dynamic lastName;
//   dynamic streetAddress;
//   dynamic city;
//   dynamic state;
//   dynamic zipCode;
//   dynamic country;
//   dynamic phone;
//   dynamic phone2;
//   dynamic fax;
//   dynamic email;
//   dynamic openBalance;
//
//
//   factory customerUpdate.fromJson(Map<String, dynamic> json) {
//     final id = json["ID"]== null ? '' : json["ID"];
//     final customerCode = json["CustomerCode"] == null ? '' : json["CustomerCode"] ;
//     final customerName = json["CustomerName"] == null ? '' : json["CustomerName"];
//     final openingBalance = json["OpeningBalance"] == null ? '' : json["OpeningBalance"]  ;
//     final companyName =  json["CompanyName"]== null ? '' :json["CompanyName"];
//     final firstName= json["FirstName"]== null ? '' :json["FirstName"];
//     final lastName= json["LastName"]== null ? '' :json["LastName"];
//     final streetAddress= json["StreetAddress"]== null ? '' :json["StreetAddress"];
//     final city= json["City"]== null ? '' :json["City"];
//     final state= json["State"]== null ? '' :json["State"];
//     final zipCode= json["ZipCode"]== null ? '' :json["ZipCode"];
//     final country= json["Country"]== null ? '' :json["Country"];
//     final phone= json["Phone"]== null ? '' :json["Phone"];
//     final phone2 =  json["Phone2"]== null ? '' :json["Phone2"] ;
//     final fax =  json["Fax"]== null ? '' :json["Fax"] ;
//     final email =  json["Email"]== null ? '' :json["Email"] ;
//     final openBalance = json["OpenBalance"] == null ? '' : json["OpenBalance"] ;
//     return customerUpdate(
//       id:id,
//       customerCode: customerCode,
//       customerName: customerName,
//       openingBalance: openingBalance,
//       openBalance: openBalance,
//       companyName: companyName,
//       firstName: firstName,
//       lastName: lastName,
//       streetAddress: streetAddress,
//       city: city,
//       state: state,
//       zipCode: zipCode,
//       country: country,
//       phone: phone,
//       phone2: phone2,
//       fax: fax,
//       email: email,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return
//       {
//         "ID": id,
//         "CustomerCode": customerCode,
//         "CustomerName": customerName,
//         "OpeningBalance": openingBalance,
//         "OpenBalance": openBalance,
//         "CompanyName": companyName,
//         "FirstName": firstName,
//         "LastName": lastName,
//         "StreetAddress": streetAddress,
//         "City": city,
//         "State": state,
//         "ZipCode": zipCode,
//         "Country": country,
//         "Phone": phone,
//         "Phone2": phone2,
//         "Fax": fax,
//         "Email": email,
//       };
//   }

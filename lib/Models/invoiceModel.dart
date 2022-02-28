import 'dart:convert';

List<InvoiceModel> invoiceModelFromJson(String str) => List<InvoiceModel>.from(json.decode(str).map((x) => InvoiceModel.fromJson(x)));

String invoiceModelToJson(List<InvoiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoiceModel {
  InvoiceModel({
    this.other,
    this.wareHouseId,
    this.paymentTermId,
    this.paymentTermName,
    this.wareHouseName,
    this.shippingRate,
    this.discountPercentage,
    this.customerMessage,
    this.memo,
  this.id,
  this.customerId,
  this.customerName,
  this.docDate,
  this.docType,
  this.docStatus,
  this.invoiceModelDocSource,
  this.txnNumber,
  this.refNumber,
  this.originalDocNumber,
  this.totalAmount,
  this.advanceAmount,
  this.balanceAmount,
    this.dueDate,
    this.companyID,
    this.subTotal,
    this.discount,
  });
  dynamic other;
  dynamic companyID;
  dynamic id;
  dynamic customerId;
  dynamic customerMessage;
  dynamic memo;
  dynamic discountPercentage;
  dynamic paymentTermName;
  dynamic paymentTermId;
  dynamic wareHouseId;
  dynamic wareHouseName;
  dynamic shippingRate;
  dynamic customerName;
  dynamic docDate;
  dynamic dueDate;
  dynamic docType;
  dynamic docStatus;
  dynamic invoiceModelDocSource;
  dynamic txnNumber;
  dynamic refNumber;
  dynamic originalDocNumber;
  dynamic totalAmount;
  dynamic advanceAmount;
  dynamic balanceAmount;
  dynamic subTotal;
  dynamic discount;
  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
  id: json["ID"]== null ? '' : json["ID"],
    other: json["Other"]==null?0.0:json["Other"],
    companyID: json["CompanyID"]== null ? '' : json["CompanyID"],
  customerId: json["CustomerID"],
    customerMessage: json["CustomerMessage"]== null ? '' : json["CustomerMessage"],
    discountPercentage: json["Discount_Percentage"]== null ? 0.00 : json["Discount_Percentage"],
    paymentTermId: json["PaymentTermID"],
    wareHouseId: json["WareHouseID"],
    memo: json["Memo"]== null ? '' : json["Memo"],
    paymentTermName: json["PaymentTermName"],
    shippingRate: json["Freight"]== null ? 0.00 : json["Freight"],
    wareHouseName: json["WareHouseName"],
  customerName: json["CustomerName"],
  docDate: json["DocDate"]== null ? '' : json["DocDate"],
  dueDate: json["DueDate"]==null?'':json["DueDate"],
  docType: json["Doc_Type"]== null ? '' : json["Doc_Type"],
  docStatus: json["Doc_Status"]== null ? '' : json["v"],
  invoiceModelDocSource: json["Doc_Source"]== null ? '' : json["Doc_Source"],
  txnNumber: json["TxnNumber"]== null ? '' : json["TxnNumber"],
  refNumber: json["RefNumber"]== null ? '' : json["RefNumber"],
  originalDocNumber: json["OriginalDocNumber"]== null ? '' : json["OriginalDocNumber"],
  totalAmount: json["TotalAmount"] == null ? '0.00' : json["TotalAmount"],
    subTotal: json["SubTotal"] == null ? '0.00' : json["SubTotal"],
  advanceAmount: json["AdvanceAmount"]== null ? '0.00' : json["AdvanceAmount"],
    discount: json["DiscountAmount"]== null ? '0.00' : json["DiscountAmount"],
  balanceAmount: json["BalanceAmount"] == null ? '0.00' : json["BalanceAmount"],
  );

      Map<String, dynamic> toJson() => {
  "ID": id,
  "CustomerID": customerId,
  "CustomerName": customerName,
  "DocDate": docDate.toIso8601String(),
        "DueDate":dueDate.toIso8601String(),
  "Doc_Type": docType,
  "Doc_Status": docStatus,
  "Doc_Source": invoiceModelDocSource,
  "TxnNumber": txnNumber,
  "RefNumber": refNumber,
  "OriginalDocNumber": originalDocNumber,
  "TotalAmount": totalAmount == null ? null : totalAmount,
  "AdvanceAmount": advanceAmount,
  "BalanceAmount": balanceAmount == null ? null : balanceAmount,

  };
}

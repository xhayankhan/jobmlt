
import 'dart:convert';

ReceiveInventorypdateItemModel2 receiveInventorypdateItemModelFromJson(String str) => ReceiveInventorypdateItemModel2.fromJson(json.decode(str));



class ReceiveInventorypdateItemModel2 {
  ReceiveInventorypdateItemModel2({
    this.previousWareHouseId,
    this.currentWareHouseId,
    this.salesRepId,
    this.previousUrl,
    this.printJson,
    this.itemName,
    this.originDocId,
    this.originDocSource,
    this.isJson,
    this.lineId,
    this.imei,
    this.itemImeiTrackingId,
    this.showVendorContacts=false,
    this.isWorkOrderNumberRequired=false,
    this.cveNameList,
    this.returnSourceValue,
    this.returnTypeValue,
    this.imeiReceivingResponse,
    this.preTxnNumber,
    this.preTxnType,
    this.vce,
    this.vceName,
    this.transactionSourceId,
    this.transactionStatus,
    this.showLotAndSerial=false,
    this.journalLineAccountId,
    this.wareHouseId,
    this.wareHouseName,
    this.binLocationId,
    this.binLocationName,
    this.type,
    this.txnDate,
    this.amounts,
    this.amount,
    this.totalLandedAmount,
    this.openingBalanceAmount,
    this.eBill=false,
    this.vendorId,
    this.vendorContactId,
    this.workOrderNumber,
    this.billId,
    this.transactionId,
    this.creditId,
    this.itemReceiptId,
    this.id,
    this.vendor,
    this.maiilingAddress,
    this.email,
    this.depositDate,
    this.mailing,
    this.checkno,
    this.glAccountCategory,
    this.streetAdrress,
    this.docStatus,
    this.city,
    this.state,
    this.zipCode,
    this.documentDate,
    this.discountDate,
    this.companyId,
    this.memo,
    this.toPrint=false,
    this.refNo,
    this.txnNumber,
    this.transactionType,
    this.isBillable=false,
    this.dueDate,
    this.receivedBill,
    this.termId,
    this.subTotal,
    this.total,
    this.toEmail=false,
    this.billReceived=false,
    this.expenseAmount,
    this.itemAmount,
    this.billTotal,
    this.creditAmount,
    this.billCredit,
    this.poid,
    this.preQty,
    this.preVendorBalance,
    this.country,
    this.preTotal,
    this.prePoNumber,
    this.poStatus,
    this.totalPo,
    this.originalTxnNumber,
    this.amountDue,


    this.isAdvanceInventory=false,
    this.isLandedCostofItems=false,
    this.glJournalEntryId,
    this.glJournalEntryLineId,
    this.poNumber,

    this.isImeiTracking=false,
    this.isImeiReceving=false,
    this.imeiDepartmentStagesId,
    this.imeiDepartmentStagesName,
    this.isShowImeiDepartment=false,
    this.isImeiLengthRestrictioninSerializedItem=false,
    this.imeiRestrictionLength,
  });

  dynamic previousWareHouseId;
  dynamic currentWareHouseId;
  dynamic salesRepId;
  dynamic previousUrl;
  dynamic printJson;
  dynamic itemName;
  dynamic originDocId;
  dynamic originDocSource;
  dynamic isJson;
  dynamic lineId;
  dynamic imei;
  dynamic itemImeiTrackingId;
  bool showVendorContacts;
  bool isWorkOrderNumberRequired;
  dynamic cveNameList;
  dynamic returnSourceValue;
  dynamic returnTypeValue;
  dynamic imeiReceivingResponse;
  dynamic preTxnNumber;
  dynamic preTxnType;
  dynamic vce;
  dynamic vceName;
  dynamic transactionSourceId;
  dynamic transactionStatus;
  bool showLotAndSerial;
  dynamic journalLineAccountId;
  dynamic wareHouseId;
  dynamic wareHouseName;
  dynamic binLocationId;
  dynamic binLocationName;
  dynamic type;
  dynamic txnDate;
  dynamic amounts;
  dynamic amount;
  dynamic totalLandedAmount;
  dynamic openingBalanceAmount;
  bool eBill;
  dynamic vendorId;
  dynamic vendorContactId;
  dynamic workOrderNumber;
  dynamic billId;
  dynamic transactionId;
  dynamic creditId;
  dynamic itemReceiptId;
  dynamic id;
  dynamic vendor;
  dynamic maiilingAddress;
  dynamic email;
  dynamic depositDate;
  dynamic mailing;
  dynamic checkno;
  dynamic glAccountCategory;
  dynamic streetAdrress;
  dynamic docStatus;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  dynamic documentDate;
  dynamic discountDate;
  dynamic companyId;
  dynamic memo;
  bool toPrint;
  dynamic refNo;
  dynamic txnNumber;
  dynamic transactionType;
  bool isBillable;
  dynamic dueDate;
  dynamic receivedBill;
  dynamic termId;
  dynamic subTotal;
  dynamic total;
  bool toEmail;
  bool billReceived;
  dynamic expenseAmount;
  dynamic itemAmount;
  dynamic billTotal;
  dynamic creditAmount;
  dynamic billCredit;
  dynamic poid;
  dynamic preQty;
  dynamic preVendorBalance;
  dynamic country;
  dynamic preTotal;
  dynamic prePoNumber;
  dynamic poStatus;
  dynamic totalPo;
  dynamic originalTxnNumber;
  dynamic amountDue;

  bool isAdvanceInventory;
  bool isLandedCostofItems;
  dynamic glJournalEntryId;
  dynamic glJournalEntryLineId;
  dynamic poNumber;

  bool isImeiTracking;
  bool isImeiReceving;
  dynamic imeiDepartmentStagesId;
  dynamic imeiDepartmentStagesName;
  bool isShowImeiDepartment;
  bool isImeiLengthRestrictioninSerializedItem;
  dynamic imeiRestrictionLength;


  factory ReceiveInventorypdateItemModel2.fromJson(Map<String, dynamic> json) => ReceiveInventorypdateItemModel2(
    previousWareHouseId: json["PreviousWareHouseID"],
    currentWareHouseId: json["CurrentWareHouseID"],
    salesRepId: json["SalesRepID"],
    previousUrl: json["PreviousUrl"],
    printJson: json["PrintJson"],
    itemName: json["Item_Name"],
    originDocId: json["OriginDocID"],
    originDocSource: json["OriginDocSource"],
    isJson: json["IsJson"],
    lineId: json["lineId"],
    imei: json["IMEI"],
    itemImeiTrackingId: json["ItemIMEITrackingID"],
    showVendorContacts: json["ShowVendorContacts"],
    isWorkOrderNumberRequired: json["IsWorkOrderNumberRequired"],
    cveNameList: json["CVENameList"],
    returnSourceValue: json["ReturnSourceValue"],
    returnTypeValue: json["ReturnTypeValue"],
    imeiReceivingResponse: json["IMEIReceivingResponse"],
    preTxnNumber: json["PreTxnNumber"],
    preTxnType: json["PreTxnType"],
    vce: json["VCE"],
    vceName: json["VCEName"],
    transactionSourceId: json["TransactionSourceID"],
    transactionStatus: json["TransactionStatus"],
    showLotAndSerial: json["ShowLotAndSerial"],
    journalLineAccountId: json["JournalLineAccountID"],
    wareHouseId: json["WareHouseID"],
    wareHouseName: json["WareHouseName"],
    binLocationId: json["BinLocationID"],
    binLocationName: json["BinLocationName"],
    type: json["Type"],
    txnDate: json["TxnDate"],
    amounts: json["Amounts"],
    amount: json["Amount"],
    totalLandedAmount: json["TotalLandedAmount"],
    openingBalanceAmount: json["OpeningBalanceAmount"],
    eBill: json["EBill"],
    vendorId: json["VendorID"],
    vendorContactId: json["VendorContactID"],
    workOrderNumber: json["WorkOrderNumber"],
    billId: json["BillID"],
    transactionId: json["TransactionID"],
    creditId: json["CreditID"],
    itemReceiptId: json["ItemReceiptID"],
    id: json["ID"],
    vendor: json["Vendor"],
    maiilingAddress: json["MaiilingAddress"],
    email: json["Email"],
    depositDate: DateTime.parse(json["DepositDate"]),
    mailing: json["Mailing"],
    checkno: json["Checkno"],
    glAccountCategory: json["GL_AccountCategory"],
    streetAdrress: json["StreetAdrress"],
    docStatus: json["Doc_Status"],
    city: json["City"],
    state: json["State"],
    zipCode: json["ZipCode"],
    documentDate: DateTime.parse(json["DocumentDate"]),
    discountDate: json["DiscountDate"],
    companyId: json["CompanyID"],
    memo: json["Memo"],
    toPrint: json["ToPrint"],
    refNo: json["RefNo"],
    txnNumber: json["TxnNumber"],
    transactionType: json["TransactionType"],
    isBillable: json["isBillable"],
    dueDate: DateTime.parse(json["DueDate"]),
    receivedBill: json["ReceivedBill"],
    termId: json["TermID"],
    subTotal: json["SubTotal"],
    total: json["Total"],
    toEmail: json["ToEmail"],
    billReceived: json["BillReceived"],
    expenseAmount: json["ExpenseAmount"],
    itemAmount: json["ItemAmount"],
    billTotal: json["BillTotal"],
    creditAmount: json["CreditAmount"],
    billCredit: json["BillCredit"],
    poid: json["POID"],
    preQty: json["PreQty"],
    preVendorBalance: json["PreVendorBalance"],
    country: json["Country"],
    preTotal: json["PreTotal"],
    prePoNumber: json["PrePONumber"],
    poStatus: json["POStatus"],
    totalPo: json["TotalPO"],
    originalTxnNumber: json["OriginalTxnNumber"],
    amountDue: json["AmountDue"],

    isAdvanceInventory: json["isAdvanceInventory"],
    isLandedCostofItems: json["IsLandedCostofItems"],
    glJournalEntryId: json["GL_JournalEntryID"],
    glJournalEntryLineId: json["GL_JournalEntryLineID"],
    poNumber: json["PONumber"],
    isImeiTracking: json["IsIMEITracking"],
    isImeiReceving: json["IsIMEIReceving"],
    imeiDepartmentStagesId: json["IMEIDepartment_StagesID"],
    imeiDepartmentStagesName: json["IMEIDepartment_StagesName"],
    isShowImeiDepartment: json["IsShowIMEIDepartment"],
    isImeiLengthRestrictioninSerializedItem: json["IsIMEILengthRestrictioninSerializedItem"],
    imeiRestrictionLength: json["IMEIRestrictionLength"],
  );


}
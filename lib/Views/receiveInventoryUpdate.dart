import 'dart:collection';
import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:jobmlt/Models/paymentTermModel.dart';
import 'package:http/http.dart' as http;
import 'package:jobmlt/Models/purchaseOrderModel.dart';
import 'package:jobmlt/Models/receiveInventorypdateItemModel.dart';
import 'package:jobmlt/Models/recieveInventoryModel.dart';
import 'package:jobmlt/Models/riItemModel.dart';
import 'package:jobmlt/Models/vendorModel.dart';
import 'package:jobmlt/Models/warehouseModel.dart';
import 'package:jobmlt/Views/addImei.dart';
import 'package:jobmlt/Views/recieveInventory.dart';
import 'package:table_calendar/table_calendar.dart';

class receiveInventoryUpdate extends StatefulWidget {
  String email, CompanyAuthToken;
  var idx;

  receiveInventoryUpdate(
      {Key? key, this.idx, required this.email, required this.CompanyAuthToken})
      : super(key: key);
  @override
  _receiveInventoryUpdateState createState() =>
      _receiveInventoryUpdateState(idx, email, CompanyAuthToken);
}

class _receiveInventoryUpdateState extends State<receiveInventoryUpdate> {
  var idx;
  String email, CompanyAuthToken;
  bool get isEditing => idx != null;
  _receiveInventoryUpdateState(this.idx, this.email, this.CompanyAuthToken);

  TextEditingController PONumber = new TextEditingController();
  TextEditingController paymentterm = new TextEditingController();
  TextEditingController wareHouse = new TextEditingController();
  TextEditingController items = new TextEditingController();
  TextEditingController vendorName = new TextEditingController();
  TextEditingController bill = new TextEditingController();
  TextEditingController rate = new TextEditingController();
  TextEditingController subTotal = new TextEditingController();
  TextEditingController billDue = new TextEditingController();
  TextEditingController itemTotal = new TextEditingController();
  TextEditingController customerMsg = new TextEditingController();
  TextEditingController memo = new TextEditingController();
  TextEditingController total = new TextEditingController();
  TextEditingController duedatee = new TextEditingController();
  TextEditingController docdatee = new TextEditingController();
  TextEditingController shippingMethod = new TextEditingController();
  TextEditingController docDate = new TextEditingController();
  TextEditingController refNumber = new TextEditingController();
  TextEditingController workOrderNumber = new TextEditingController();

  String? Itemz, newItm;
  List<dynamic> itemssData = [];
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime docdate = DateTime.now();
  DateTime duedate = DateTime.now();
  var datee = new DateTime.now();
  DateTime Net15 = DateTime.now().add(new Duration(days: 15));
  DateTime Net30 = DateTime.now().add(new Duration(days: 30));

  DateTime? _selectedDay;

  List Cdata = [];

  List vendorData = [];
  List shippingData = [];
  List PTdata = [];
  List wareHdata = [];
  List POFet = [];
  List itemData = [];
  List itemLineData = [];
  List itemUpdateLineData = [];
  Map<String, dynamic> itemUpdateLineData2 = {};
  List<WarehouseModel> warehouseResponse = [];
  List<PaymentTermModel> responsePayment = [];
  Future? poResponse ;
  List<RiItemModel> itemLineJson=[];
  List<Map<String, dynamic>> itemUpdateLineJson=[];
  Map<String, dynamic> itemUpdateLineJson2={};
  List<vendorModel> vendorJson = [];

  var ItemName = '',
      amount = '',
      billID,
      qtynd,
      customerID,
      itemCode,
      itemCodeID,
      description,
      itemprice,
      itemtype,
      itemunitcost,
      linetotal,
      cstmrz,
      paymentTermID,
      shippingmethodID,
      warehouseID,
      poNumber,
      companyID,
      txnNum,
      vendor,
      billchck,
      VendorContactID,
      transTyp,
      Po;
  double qty = 0.0;
  List<TextEditingController> qtyNeed = [];
  List<TextEditingController> ID = [];
  List<TextEditingController> IMEI = [];
  List<TextEditingController> ReceiptLineID = [];
  List<TextEditingController> VendorBillLineID = [];
  List<TextEditingController> IV_TrasactionLineID = [];
  List<TextEditingController> ItemUOMID = [];
  List<TextEditingController> BoxNumber = [];
  List<TextEditingController> blncQty = [];
  List<TextEditingController> Rate = [];
  List<TextEditingController> amountTotal = [];
  List<Map<dynamic, dynamic>> orderList = [];
  List<TextEditingController> ic = [];
  List<TextEditingController> POLineId = [];
  List<TextEditingController> icid = [];
  List<TextEditingController> iN = [];
  List<TextEditingController> des = [];
  List<TextEditingController> rt = [];
  List<TextEditingController> ityp = [];
  List<TextEditingController> iuc = [];
  List<TextEditingController> serialNumber=[];
  List<TextEditingController> imeis=[];
  List<String> listofserialNums=[];
  var billcheck=[ "Receive Item",
    "Receive Item and Enter Bill",];
  var enterBill=false;
  List amt = [];
  var sum;
  bool isOldItem = false;
  var idItem='';
  var idItemUpd='';
  var toknow = 0;
  var doing = false;
  var pofetch = false;
  bool _checkbox = false;
  bool _checkboxListTile = false;
  bool sameImei=false;
  List<List<String>> dataList = [];

  final AsyncMemoizer _memoizer = AsyncMemoizer();
  @override
  String getText() {
    if (duedate == null) {
      return 'Select Due Date';
    } else if (docdate == null) {
      return 'Select Doc Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(duedate);

      // return '${date.month}/${date.day}/${date.year}';
    }
  }
  void initState() {

    if (mounted) {
      log(CompanyAuthToken);
      log(email);

      _fetchCustomerName();


      if (isEditing) {
        log('this is the id ${idx.id.toString()}');
        txnNum=idx.txnNumber.toString();
        billID=idx.billId.toString();
        refNumber.text=idx.refNumber.toString();
        vendorName.text = idx.vendorName.toString();
        vendor = idx.vendorId.toString();
        sum = idx.total;
        VendorContactID=idx.vendorContactId.toString();
        transTyp=idx.transactionType.toString();
        //others.text = idx.other.toString();
         PONumber.text = idx.poNumber.toString();
        print(PONumber.text);
        companyID = idx.companyId.toString();
        docdatee.text = idx.txnDate.toString();
        duedatee.text = idx.dueDate.toString();
        if (idx.wareHouseName != null) {
          wareHouse.text = idx.wareHouseName.toString();
        }
        if (idx.paymentTermName != null) {
          paymentterm.text = idx.paymentTermName.toString();
        }
        if (idx.poPurchaseOrderId != null) {
          Po = idx.poPurchaseOrderId.toString();
        }

        memo.text = idx.memo.toString();
        workOrderNumber.text = idx.workOrderNumber.toString();
        subTotal.text = idx.total.toString();
        subTotal.text = idx.total.toString();
        if (idx.paymentTermId != null) {
          paymentTermID = idx.paymentTermId.toString();
        }
        if (idx.wareHouseId != null) {
          warehouseID = idx.wareHouseId.toString();
        }

      }
      if (isEditing == false) {

        docdatee.text = docdate.toString();
        duedatee.text = duedate.toString();


      }
    }
  }
  _fetchCustomerName() async {
    return this._memoizer.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));

      vendorJson = await vendorList();

      responsePayment = await paymentTerm();
      warehouseResponse = await warehouse();
      print('done');

      doing=true;


      if(isEditing==true) {
        pofetch=true;
        //poResponse =  POFetch();
        itemUpdateLineJson = await getItemLineforUpdate();
        itemUpdateLineJson2 = await getItemLineforUpdate2();
        log(itemUpdateLineData2.toString());
        log(itemUpdateLineJson.toString());
        for (int i = 0; i < itemUpdateLineData.length; i++) {
          isOldItem = true;
          Map mapItem = {
            'ItemCode': itemUpdateLineData[i]['ItemCode'],
            'ItemCodeID': itemUpdateLineData[i]['ItemID'],
            'ItemName': itemUpdateLineData[i]['ItemCode'],
            'LineQuantity': itemUpdateLineData[i]['Qty'],
            'BalanceQuantity': itemUpdateLineData[i]['BalanceQty'],
            'Description': itemUpdateLineData[i]['Description'],
            'ItemPrice': itemUpdateLineData[i]['Rate'],
            'ItemQuantity': itemUpdateLineData[i]['LineQuantity'],
            'ItemType': itemUpdateLineData[i]['ItemType'],
            'ItemUnitCost': itemUpdateLineData[i]['Rate'],
            'LineTotal': itemUpdateLineData[i]['Amount'],
            'POLineID': itemUpdateLineData[i]['POLineID'],
            'ID':itemUpdateLineData[i]['ID'],
            'IMEI': itemUpdateLineData[i]['IMEI'],
            'ReceiptLineID': itemUpdateLineData[i]['ReceiptLineID'],
            'VendorBillLineID': itemUpdateLineData[i]['VendorBillLineID'],
            "IV_TrasactionLineID": itemUpdateLineData[i]['IV_TrasactionLineID'],
            "ItemUOMID":itemUpdateLineData[i]['ItemUOMID'],
            'BoxNumber':itemUpdateLineData[i]['BoxNumber'],

          };
          itemssData.add(mapItem);

          log(itemssData.toString());

          ID.add(new TextEditingController());
          qtyNeed.add(new TextEditingController());
          amountTotal.add(new TextEditingController());
          ic.add(new TextEditingController());
          icid.add(new TextEditingController());
          iN.add(new TextEditingController());
          des.add(new TextEditingController());
          rt.add(new TextEditingController());
          ityp.add(new TextEditingController());
          iuc.add(new TextEditingController());
          POLineId.add(new TextEditingController());
          blncQty.add(new TextEditingController());
          BoxNumber.add(new TextEditingController());
          IMEI.add(new TextEditingController());
          IV_TrasactionLineID.add(new TextEditingController());
          ItemUOMID.add(new TextEditingController());
          VendorBillLineID.add(new TextEditingController());
          ReceiptLineID.add(new TextEditingController());

          ID[i].text=itemssData[i]['ID'].toString();
          ReceiptLineID[i].text=itemssData[i]['ReceiptLineID'].toString();
          VendorBillLineID[i].text=itemssData[i]['VendorBillLineID'].toString();
          ItemUOMID[i].text=itemssData[i]['ItemUOMID'].toString();
          IV_TrasactionLineID[i].text=itemssData[i]['IV_TrasactionLineID'].toString();
          IMEI[i].text=itemssData[i]['IMEI'].toString();
          BoxNumber[i].text=itemssData[i]['BoxNumber'].toString();
          POLineId[i].text=itemssData[i]['POLineID'].toString();
          ic[i].text=itemssData[i]['ItemCode'].toString();
          icid[i].text= itemssData[i]['ItemCodeID'].toString();
          iN[i].text= itemssData[i]['ItemName'].toString();
          des[i].text=itemssData[i]['Description'].toString();
          rt[i].text= itemssData[i]['ItemPrice'].toString();
          ityp[i].text= itemssData[i]['ItemType'].toString();
          iuc[i].text= itemssData[i]['ItemUnitCost'].toString();
          blncQty[i].text= itemssData[i]['BalanceQuantity'].toString();
          qtyNeed[i].text=itemssData[i]['LineQuantity'].toString();
          qtyNeed[i].text = itemssData[i]['LineQuantity'] == null ? '0' : qtyNeed[i].text;
          amountTotal[i].text=itemssData[i]['LineTotal'].toString();
          amountTotal[i].text=itemssData[i]['LineTotal']==null?'0': amountTotal[i].text;
          if(ityp[i].text=='20'){
            serialNumber.add(TextEditingController());
          }
        }



      }}); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEditing == true ? Text('Update Receive Inventory') : Text(
            'Create Receive Inventory'),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: FutureBuilder(
                future: _fetchCustomerName(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (doing == true) {
                    return ListView(children: <Widget>[
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Bill Received'),
                        value: _checkbox,
                        onChanged: (value) {
                          setState(() {
                            _checkbox = !_checkbox;
                            if(_checkbox==true){
                              billchck='Receive Item and Enter Bill';
                              bill.text=billchck;
                            }
                            else{
                              billchck='Receive Item';
                              bill.text=billchck;
                            }
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            errorText: billchck == null ? 'Field Required' : '',
                            errorStyle: TextStyle(
                                color:
                                billchck == null ? Colors.red : Colors.black),
                            //errorBorder:
                            errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                  color: billchck == null
                                      ? Colors.red
                                      : Colors.black),
                            ),

                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            labelText: "Receipt / Receipt & Bill",
                          ),
                          items: billcheck.map((itms) {
                            return new DropdownMenuItem(
                              onTap: () {
                                bill.text = itms;
                                if(billchck=='Receive Item and Enter Bill'){
                                  _checkbox=!_checkbox;
                                }else if(billchck=='Receive Item'){
                                  _checkbox=_checkbox;
                                }
                                print(bill);
                              },
                              child: new Text(
                                itms,
                              ),
                              value: itms.toString(),
                            );
                          }).toList(),
                          onChanged: (itm) {
                            setState(() {
                              billchck = itm as String?;
                              if(billchck=='Receive Item and Enter Bill'){
                                _checkbox=!_checkbox;
                              }else if(billchck=='Receive Item'){
                                _checkbox=_checkbox;
                              }
                              print(billchck);
                            });
                          },
                          value: billchck,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Builder(
                          builder: (context) {
                            if(isEditing==false) {
                              return DropdownButtonFormField(
                                decoration: InputDecoration(
                                  errorText: vendor == null
                                      ? 'Field Required'
                                      : '',
                                  errorStyle: TextStyle(
                                      color:
                                      vendor == null ? Colors.red : Colors
                                          .black),
                                  //errorBorder:
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: vendor == null
                                            ? Colors.red
                                            : Colors.black),
                                  ),

                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: "Vendor",
                                ),
                                items: vendorData.map((itms) {
                                  return new DropdownMenuItem(
                                    onTap: () async {
                                      vendorName.text = itms["VendorName"];

                                      print(vendorName);
                                    },
                                    child: new Text(
                                      itms["VendorName"],
                                    ),
                                    value: itms["ID"].toString(),
                                  );
                                }).toList(),
                                onChanged: (itm) async {
                                  setState(() {
                                    Po = null;
                                    vendor = itm as String?;
                                    if (itemssData.isNotEmpty) {
                                      for (int i = 0; i <
                                          itemssData.length; i++) {
                                        itemssData.removeAt(i);
                                      }
                                    }
                                    print(vendor);
                                  });

                                  poResponse = POFetch();
                                  pofetch = false;
                                },
                                value: vendor,
                              );
                            }
                            else{
                              return TextFormField(
                                readOnly: true,
                                  decoration: InputDecoration(labelText: 'Vendor',
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                  ),
                                controller: vendorName,
                              );
                            }
                          }
                        ),
                      ),
                      Builder(
                          builder: (context) {
                            if(vendor!=null&&isEditing==false){
                              return FutureBuilder(

                                //future: poResponse,
                                  builder: (builder,context) {
                                    if (pofetch==true) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            errorText: '',
                                            errorStyle: TextStyle(

                                                color: Colors.black
                                            ),
                                            //errorBorder:
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),

                                            filled: true,
                                            hintStyle: TextStyle(
                                                color: Colors.grey[800]),
                                            labelText: "Purchase Order",
                                          ),

                                          items: POFet.map((itms) {
                                            return new DropdownMenuItem(
                                              onTap: () {
                                                PONumber.text =
                                                itms["TransactionNumber"];
                                                print(PONumber.text);
                                              },
                                              child: new Text(
                                                '${itms["TransactionNumber"]} - ${itms["POStatus"]}',
                                              ),
                                              value: itms["ID"].toString(),
                                            );
                                          }).toList(),
                                          onChanged: (itm) async {
                                            Po = null;
                                            setState(() {
                                              Po = itm as String?;
                                              if (itemssData.isNotEmpty) {
                                                for (int i = 0; i < itemssData.length; i++)
                                                {
                                                  itemssData.removeAt(i);
                                                  log('items data removed by po changing');
                                                }
                                              }
                                              print(Po);
                                            });
                                            if(itemLineData.isNotEmpty||isEditing==false) {
                                              print("its running nowww");
                                              itemLineJson = await getItemLine();


                                              print(itemLineData.length);

                                              for (int i = 0; i <
                                                  itemLineData.length; i++) {
                                                ic.add(new TextEditingController());
                                                icid.add(new TextEditingController());
                                                iN.add(new TextEditingController());
                                                des.add(new TextEditingController());
                                                rt.add(new TextEditingController());
                                                ityp.add(new TextEditingController());
                                                iuc.add(new TextEditingController());
                                                qtyNeed.add(
                                                    new TextEditingController());
                                                amountTotal.add(
                                                    new TextEditingController());
                                                blncQty.add(TextEditingController());
                                                serialNumber.add(
                                                    TextEditingController());
                                                POLineId.add(
                                                    new TextEditingController());
                                                ID.add(new TextEditingController());
                                                Map mapItem = {
                                                  'ItemCode': itemLineData[i]['LineItemCode'],
                                                  'ItemCodeID': itemLineData[i]['LineItemID'],
                                                  'ItemName': itemLineData[i]['LineItemName'],
                                                  'BalanceQuantity': itemLineData[i]['BalanceQuantity'],
                                                  'Description': itemLineData[i]['LineItemDescription'],
                                                  'ItemPrice': itemLineData[i]['LineRate'],
                                                  'ItemQuantity': itemLineData[i]['LineQuantity'],
                                                  'ItemType': itemLineData[i]['ItemType'],
                                                  'ItemUnitCost': itemLineData[i]['LineRate'],
                                                  'LineTotal': itemLineData[i]['LineTotal'],
                                                  'POLineID': itemLineData[i]['ID'],
                                                  'ID':itemLineData[i]['ID'],

                                                };
                                                itemssData.add(mapItem);

                                                log(itemssData.toString());
                                                ID[i].text=itemssData[i]['ID'].toString();
                                                POLineId[i].text =
                                                    itemssData[i]['POLineID']
                                                        .toString();
                                                ic[i].text = itemssData[i]['ItemCode']
                                                    .toString();
                                                icid[i].text =
                                                    itemssData[i]['ItemCodeID']
                                                        .toString();
                                                iN[i].text = itemssData[i]['ItemName']
                                                    .toString();
                                                des[i].text =
                                                    itemssData[i]['Description']
                                                        .toString();
                                                rt[i].text =
                                                    itemssData[i]['ItemPrice']
                                                        .toString();
                                                ityp[i].text =
                                                    itemssData[i]['ItemType']
                                                        .toString();
                                                iuc[i].text =
                                                    itemssData[i]['ItemUnitCost']
                                                        .toString();
                                                qtyNeed[i].text =
                                                    itemssData[i]['ItemQuantity']
                                                        .toString();
                                                blncQty[i].text =
                                                    itemssData[i]['BalanceQuantity']
                                                        .toString();
                                                amountTotal[i].text =
                                                    itemssData[i]['LineTotal']
                                                        .toString();
                                                companyID =
                                                itemLineData[i]['CompanyID'];
                                                if (0 < i) {
                                                  sum = sum + double
                                                      .parse(
                                                      amountTotal[i]
                                                          .text);
                                                }
                                                else {
                                                  sum = double.parse(
                                                      amountTotal[i]
                                                          .text);
                                                }
                                                print('for loop rann');
                                              }

                                              subTotal.text =
                                                  sum.toString();

                                              total.text =
                                                  subTotal.text;
                                            } },
                                          value: Po,

                                        ),
                                      );
                                    }
                                    else {
                                      return Center(child: Container( height:50,
                                          width:50,
                                          child: CircularProgressIndicator()));
                                    }
                                  });
                            }
                            else if(isEditing){
                              return Padding(
                                padding: const EdgeInsets.only(top:12.0),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(labelText: 'Purchase Order',
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                  ),
                                  controller: PONumber,
                                ),
                              );
                            }
                            else {
                              return Text('');
                            }
                          }
                      ),
                      Builder(builder: (context) {
                        if (_checkbox == true) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                labelText: "Payment Term",
                              ),
                              items: PTdata.map((item) {
                                return new DropdownMenuItem(
                                  onTap: () {
                                    paymentterm.text = item['Name'];
                                    print(paymentterm.text);
                                  },
                                  child: new Text(
                                    item['Name'],
                                  ),
                                  value: item["ID"].toString(),
                                );
                              }).toList(),
                              onChanged: (itm) {
                                setState(() {
                                  paymentTermID = itm as String?;

                                  print(paymentTermID);

                                  //paymentterm.text = value;

                                  if (paymentterm.text == 'Net15') {
                                    duedatee.text = Net15.toString();
                                  } else if (paymentterm.text == 'Net30') {
                                    duedatee.text = Net30.toString();
                                  } else {
                                    duedatee.text = duedate.toString();
                                  }
                                });
                              },
                              value: paymentTermID,
                            ),
                          );
                        }
                        else{
                          return Text('');
                        }
                      }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Doc Date: ',
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width / 5.0,
                                  child: TextFormField(
                                      readOnly: true,
                                      onTap: () {
                                        pickDocDate(context);
                                      },
                                      controller: docdatee,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      )),
                                )
                              ],
                            ),
                            Builder(
                                builder: (context) {
                                  if(_checkbox==true){
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Due Date: ',
                                        ),
                                        SizedBox(
                                          width:
                                          MediaQuery.of(context).size.width / 5.0,
                                          child: TextFormField(
                                              readOnly: true,
                                              onTap: () {
                                                pickDueDate(context);
                                              },
                                              controller: duedatee,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              )),
                                        )
                                      ],
                                    );
                                  }
                                  else{
                                    return Text('');
                                  }
                                }
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Builder(
                          builder: (context) {
                            if(isEditing==false) {
                              return DropdownButtonFormField(
                                decoration: InputDecoration(
                                  errorText:
                                  warehouseID == null ? 'Field Required' : '',
                                  errorStyle: TextStyle(
                                      color: warehouseID == null
                                          ? Colors.red
                                          : Colors.black),
                                  //errorBorder:
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: warehouseID == null
                                            ? Colors.red
                                            : Colors.black),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: "WareHouse/Site Location",
                                ),
                                items: wareHdata.map((item) {
                                  return new DropdownMenuItem(
                                    onTap: () {
                                      wareHouse.text = item['WarehouseName'];
                                      print(wareHouse.text);
                                    },
                                    child: new Text(
                                      item['WarehouseName'],
                                    ),
                                    value: item["ID"].toString(),
                                  );
                                }).toList(),
                                onChanged: (itm) {
                                  setState(() {
                                    warehouseID = itm as String?;

                                    print(warehouseID);
                                  });
                                },
                                value: warehouseID,
                              );
                            }
                          else{
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(labelText: 'WareHouse/Site Location',
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                  ),
                                  controller: wareHouse,
                                ),
                              );
                            }
                  }
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: workOrderNumber,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Work Order Number',
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(5.0),
                                    ),
                                  ),
                                ),),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextFormField(

                                controller: refNumber,

                                decoration: InputDecoration(
                                  labelText: 'Reference Number',
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(5.0),
                                    ),
                                  ),
                                ),),),
                          ],
                        ),
                      ),
                      Builder(
                          builder: (context) {

                            if (Po==null || itemssData.isEmpty) {
                              return Text('');
                            } else {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: itemssData.length,
                                  itemBuilder: (context, index) {

                                    qtyNeed.add(new TextEditingController());
                                    amountTotal.add(new TextEditingController());


                                    // qtyNeed[index].text = qtyNeed[index].text.isEmpty ? '0' : qtyNeed[index].text;
                                    amountTotal[index].text=amountTotal[index].text.isEmpty?'0': amountTotal[index].text;


                                    return Dismissible(key: UniqueKey(),
                                      direction: DismissDirection.startToEnd,
                                      background: Container(
                                        color: Colors.red,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        alignment: Alignment.centerRight,
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),

                                      onDismissed: (_) {
                                        setState(() {
                                          var amtt= amountTotal[index].text.isEmpty?0:double.parse(amountTotal[index].text);
                                          sum = sum -amtt;

                                          subTotal.text = sum.toString();

                                          total.text =
                                              subTotal.text;

                                          print(sum);
                                          print(index);
                                          print(toknow);
                                          itemssData.removeAt(index);
                                          ic.remove(ic[index]);
                                          icid.remove(icid[index]);
                                          iN.remove(iN[index]);
                                          des.remove(des[index]);
                                          rt.remove(rt[index]);

                                          iuc.remove(iuc[index]);
                                          qtyNeed.remove(qtyNeed[index]);
                                          amountTotal.remove(amountTotal[index]);
                                          if(ityp[index].text=='20'){
                                            serialNumber.remove(serialNumber[index]);
                                          }
                                          blncQty.remove(blncQty[index]);
                                          ityp.remove(ityp[index]);
                                          POLineId.remove(POLineId[index]);
                                          //  if(orderList.isNotEmpty && index<=toknow)
                                          //  {
                                          //    //itemLineData.removeAt(index);
                                          //    orderList.removeAt(index);
                                          //    toknow=toknow-1;
                                          //    log('orderlist removed');
                                          // }
                                          print(itemssData);
                                          log(orderList.length.toString());
                                          log(itemssData.length.toString());
                                        });
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.grey, width: 0.7),
                                          borderRadius: BorderRadius.circular(10),),
                                        elevation: 5,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${iN[index].text}',
                                                    ),
                                                    Text(
                                                      'Balance Quantity: ${blncQty[index].text}',
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        readOnly: ityp[index].text=='20'?true:false,
                                                        controller: qtyNeed[index],
                                                        keyboardType: TextInputType
                                                            .number,
                                                        onChanged: (val) {
                                                          val= val.isEmpty?'0.0':val;
                                                          double a = double.parse(rt[index].text); // this is the value in my first text field (This is the percentage rate i intend to use)
                                                          double b = val.isEmpty?0:double.parse(val); // this is my second text field
                                                          double c = a * b; //do your calculation
                                                          amountTotal[index].text = c.toStringAsFixed(2);
                                                          total.text = c.toStringAsFixed(2);
                                                          amount = amountTotal[index].text;
                                                          qtynd = qtyNeed[index].text;
                                                          print(itemssData);
                                                          //if(isEditing){


                                                          //}

                                                          for(int i=0; i<itemssData.length; i++){
                                                            if (0 < i) {
                                                              sum = sum + double
                                                                  .parse(
                                                                  amountTotal[i]
                                                                      .text);
                                                            }
                                                            else {
                                                              sum = double.parse(
                                                                  amountTotal[i]
                                                                      .text);
                                                            }
                                                          }

                                                          print(amt);

                                                          subTotal.text =
                                                              sum.toString();

                                                          total.text =
                                                              subTotal.text;
                                                          // qtynd = qty - (qtyNeed[index].text.isEmpty?0:double.parse(qtyNeed[index].text));
                                                          // print(qtynd);
                                                          print(sum);



                                                        },
                                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                                        validator: (value){

                                                          if(value == null || value.isEmpty || value=='0')
                                                          { return "Cannot be empty";}
                                                          else if( double.parse(value)> double.parse(blncQty[index].text))
                                                          {
                                                            return 'Max Quantity';
                                                          }
                                                          else {
                                                            return null;
                                                          }
                                                        },
                                                        decoration: InputDecoration(
                                                          labelText: 'Quantity',

                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(

                                                      child: TextFormField(
                                                        //initialValue: itemssData[index]['ItemPrice'].toString(),
                                                          controller: rt[index],
                                                          keyboardType: TextInputType
                                                              .number,
                                                          decoration: InputDecoration(
                                                              labelText: 'Unit Price'

                                                          ),
                                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                                          validator: (value){

                                                            if(value == null || value.isEmpty || value=='0')
                                                            { return "Cannot be empty or )";}
                                                            else {
                                                              return null;
                                                            }
                                                          },
                                                          onChanged: (val) {
                                                            val= val.isEmpty?'0.0':val;
                                                            double a = double
                                                                .parse(
                                                                val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                                            double b = qtyNeed[index]
                                                                .text.isEmpty
                                                                ? 0
                                                                : double.parse(
                                                                qtyNeed[index]
                                                                    .text); // this is my second text field
                                                            double c = a *
                                                                b; //do your calculation
                                                            amountTotal[index]
                                                                .text =
                                                                c.toStringAsFixed(
                                                                    2);
                                                            total.text =
                                                                c.toStringAsFixed(
                                                                    2);
                                                            amount =
                                                                amountTotal[index]
                                                                    .text;
                                                            qtynd = qtyNeed[index]
                                                                .text;
                                                            print(itemssData);
                                                            //if(isEditing){


                                                            //}

                                                            for (int i = 0; i <
                                                                itemssData
                                                                    .length; i++) {
                                                              if (0 < i) {
                                                                sum = sum + double
                                                                    .parse(
                                                                    amountTotal[i]
                                                                        .text);
                                                              }
                                                              else {
                                                                sum =
                                                                    double.parse(
                                                                        amountTotal[i]
                                                                            .text);
                                                              }
                                                            }

                                                            print(amt);

                                                            subTotal.text =
                                                                sum.toString();

                                                            total.text =
                                                                subTotal.text;
                                                            // qtynd = qty - (qtyNeed[index].text.isEmpty?0:double.parse(qtyNeed[index].text));
                                                            // print(qtynd);
                                                            print(sum);
                                                          }

                                                      ),
                                                    ),
                                                    Expanded(

                                                      child: TextFormField(

                                                        controller: amountTotal[index],
                                                        readOnly: true,
                                                        keyboardType: TextInputType
                                                            .number,
                                                        decoration: InputDecoration(
                                                            labelText: 'Amount'
                                                        ),

                                                      ),

                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                    child: Builder(
                                                        builder: (context) {

                                                          if(ityp[index].text=='20'&&isEditing==false) {
                                                            imeis.add(new TextEditingController());
                                                            return InkWell(
                                                                onTap:(){
                                                                },
                                                                child: Container(
                                                                  height: 80,
                                                                  child: TextFormField(
                                                                    maxLines: 2,
                                                                    controller: serialNumber[index],
                                                                    decoration: InputDecoration(
                                                                      hintText: 'Add the Serial # Here (Separate with comma for multiple Serial #)',

                                                                    ),
                                                                    onChanged: (val){
                                                                      print(val);


                                                                      listofserialNums = val.split(',').map((e) => e).toList() ;
                                                                      // var ime=val.split(',');
                                                                      // print('this is ime $ime');
                                                                      // //var contain = imeis[index].text.contains;
                                                                      // var contain = listofserialNums.contains(ime);
                                                                      // if(contain==true){
                                                                      //
                                                                      //   sameImei =!sameImei;
                                                                      //
                                                                      // }
                                                                      // else{
                                                                      //
                                                                      //   sameImei =sameImei;
                                                                      //
                                                                      //
                                                                      // }

                                                                      imeis[index].text=listofserialNums.toString();
                                                                      print(imeis[index].text);
                                                                    },
                                                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                    validator: (value){
                                                                      if(value == null || value.isEmpty )
                                                                      { return  'Please Put Serial Numbers';}

                                                                      else if(listofserialNums.length>double.parse(qtyNeed[index].text)){
                                                                        return 'Serial numbers max reached';
                                                                      }
                                                                      else if(listofserialNums.length<double.parse(qtyNeed[index].text)){
                                                                        return 'Serial numbers min';
                                                                      }
                                                                      // else if(sameImei=!sameImei){
                                                                      //   return 'Serial Numbers can not be same';
                                                                      //
                                                                      // }



                                                                    },
                                                                  ),
                                                                ));
                                                          }
                                                          else {return Text('');}
                                                        })
                                                )
                                              ],

                                            ),
                                          ),

                                        ),
                                      ),
                                    );
                                  });
                            }
                          }
                      ),
                      TextFormField(
                        controller: subTotal,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Item Total',

                        ),

                      ),
                      TextFormField(
                        readOnly: true,
                        controller: subTotal,

                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Total Amount',

                        ),
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: subTotal,

                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Bill Due ',

                        ),
                      ),

                      TextFormField(
                        controller: memo,
                        maxLines: 3,
                        decoration: InputDecoration(
                            labelText: 'Memo',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(12.0)
                            )

                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Center(
                          child: InkWell(
                            onTap: () async {




                              if (billchck==null) {
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Error Occurred'),
                                          content: Text(
                                              "Please Select if this is Receipt or Receipt and Bill "),
                                          actions: <Widget>[

                                            ElevatedButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),

                                          ],
                                        )
                                );
                              }else if (vendor == null) {
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Error Occurred'),
                                          content: Text('Please Select a Vendor'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        )
                                );
                              }
                              else if (Po == null) {
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Error Occurred'),
                                          content: Text('Please Select a Purchase Order'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        )
                                );
                              }

                              else if (warehouseID == null) {
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Error Occurred'),
                                          content: Text(
                                              'Please Select a Ware House'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop();
                                              },
                                            )
                                          ],
                                        )
                                );
                              }


                              if (isEditing) {
                                for(int i =0;i<itemssData.length;i++){
                                  Map orderDetails = {
                                    'POLineID': POLineId[i].text,
                                    'ID': ID[i].text,
                                    'CompanyID':companyID.toString(),
                                    'ItemCode': ic[i].text,
                                    'ItemID': icid[i].text,
                                    'ItemName': iN[i].text,
                                    'Description': des[i].text,
                                    'Rate': rt[i].text,
                                    'Qty': qtyNeed[i].text,
                                    'Amount': amountTotal[i].text,
                                    'ReceiptLineID': ReceiptLineID[i].text,
                                    'VendorBillLineID': VendorBillLineID[i].text,
                                    "IV_TrasactionLineID": IV_TrasactionLineID[i].text,
                                    "ItemUOMID": ItemUOMID[i].text,
                                    'BoxNumber':BoxNumber[i].text,
                                    'ItemType': ityp[i].text,
                                    'IMEI':ityp[i].text=='20'?IMEI[i].text:null,
                                  };
                                  orderList.add(orderDetails);


                                  print(orderDetails
                                      .toString());
                                }
                                var poid=itemUpdateLineData2['POID'];
                                var id=itemUpdateLineData2['ID'];
                                var ItemReceiptID=itemUpdateLineData2['ItemReceiptID'];
                                var TransactionID=itemUpdateLineData2['TransactionID'];
                                var BillID=itemUpdateLineData2['BillID'];
                                var DepositDate=itemUpdateLineData2['DepositDate'];
                                var BillCredit=itemUpdateLineData2['BillCredit'];
                                var IsIMEITracking=itemUpdateLineData2['IsIMEITracking'];
                                var MaiilingAddress=itemUpdateLineData2['MaiilingAddress'];
                                var OriginalTxnNumber=itemUpdateLineData2['OriginalTxnNumber'];
                                var TermID=itemUpdateLineData2['TermID'];
                                var TransactionType=itemUpdateLineData2['TransactionType'];
                                var VendorContactID=itemUpdateLineData2['VendorContactID'];
                                var AmountDue=itemUpdateLineData2['AmountDue'];
                                Map data = {
                                  'WareHouseID': warehouseID.toString(),
                                  'VendorID': vendor.toString(),
                                  'POID': poid.toString(),
                                  'ID': id.toString(),
                                  'ItemReceiptID': ItemReceiptID.toString(),
                                  'TransactionID': TransactionID.toString(),
                                  'BillID': BillID.toString(),
                                  'ItemAmount': subTotal.text,
                                  'TxnNumber': txnNum.toString(),
                                  "DepositDate": DepositDate.toString(),
                                  "DocumentDate": docdatee.text,
                                  "DueDate": duedatee.text,
                                  "BillCredit": BillCredit.toString(),
                                  "IsIMEITracking": IsIMEITracking,
                                  "MaiilingAddress": MaiilingAddress.toString(),
                                  "OriginalTxnNumber": OriginalTxnNumber.toString(),
                                  "POTxnNumber": Po.toString(),
                                  "TermID": TermID.toString(),
                                  "TransactionType": TransactionType.toString(),
                                  "VendorContactID": VendorContactID.toString(),
                                  'PONumber': PONumber.text,
                                  'CompanyID': companyID,
                                  'WareHouseName': wareHouse.text,
                                  'Total': total.text,
                                  'BillTotal': total.text,
                                  'AmountDue': AmountDue.toString(),
                                  'RefNo': refNumber.text,
                                  'WorkOrderNumber': workOrderNumber.text,
                                  'Memo': memo.text,
                                  'ItemLine': orderList
                                };


                                print("" + data.toString());
                                final result1 = await updateRI(idx.id, data);

                                print(result1);

                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text('Success'),
                                      content: Text('Invoice Updated Successfully'),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: Text('Ok'),
                                          onPressed: () {
                                            Get.off(recieveInventory(email:email,CompanyAuthToken: CompanyAuthToken,));

                                          },
                                        )
                                      ],
                                    )
                                );
                              }

                              else if (isEditing == false) {
                                for(int i =0;i<itemssData.length;i++){
                                  Map orderDetails = {
                                    'POLineID': POLineId[i].text,
                                    'CompanyID':companyID,
                                    'ItemCode': ic[i].text,
                                    'ItemID': icid[i].text,
                                    'ItemName': iN[i].text,
                                    'Description': des[i].text,
                                    'Rate': rt[i].text,
                                    'ItemType': ityp[i].text,
                                    'Qty': qtyNeed[i].text,
                                    'Amount': amountTotal[i].text,
                                    'IMEI':ityp[i].text=='20'?serialNumber[i].text:null,
                                  };
                                  orderList.add(orderDetails);


                                  print(orderDetails
                                      .toString());
                                }


                                //  if (orderList.isEmpty) {
                                //   showDialog(
                                //       context: context,
                                //       builder: (_) =>
                                //           AlertDialog(
                                //             title: Text('Error Occurred'),
                                //             content: Text(
                                //                 "Please Select a Item and it's Quantity"),
                                //             actions: <Widget>[
                                //
                                //               ElevatedButton(
                                //                 child: Text('Ok'),
                                //                 onPressed: () {
                                //                   Navigator.of(context).pop();
                                //                 },
                                //               ),
                                //
                                //             ],
                                //           )
                                //   );
                                // }
                                // else
                                if (orderList.isNotEmpty) {
                                  Map data = {
                                    'SubTotal': subTotal.text,
                                    'Total': subTotal.text,
                                    'BillTotal': total.text,
                                    'AmountDue':total.text,
                                    'POID':Po,
                                    'ItemAmount':subTotal.text,
                                    'DocumentDate':docdatee.text,
                                    'DueDate':duedatee.text,
                                    'PaymentTermName': paymentterm.text,
                                    'TermID': paymentTermID,
                                    'TransactionType': 'RCT',
                                    'BillCredit': _checkbox==true ? 3 : 4,
                                    'RefNo': refNumber.text,
                                    'VendorID': vendor,
                                    'WareHouseID': warehouseID,
                                    'WorkOrderNumber': workOrderNumber.text,
                                    'Memo': memo.text,
                                    'ItemLine': orderList,
                                  };


                                  print("" + data.toString());
                                  final result = await addReceiveInv(data);


                                  showDialog(
                                      context: context,
                                      builder: (_) =>
                                          AlertDialog(
                                            title: Text('Success'),
                                            content: Text(
                                                'Receive Inventory Created Successfully'),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: Text('Ok'),
                                                onPressed: () {
                                                  Get.offAll(recieveInventory(
                                                    email: email,
                                                    CompanyAuthToken: CompanyAuthToken,));
                                                },
                                              )
                                            ],
                                          )
                                  );


                                  print(result);
                                }
                              }

                              print('Done');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],

                                  // borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12.0)

                              ),
                              height: 50,
                              width: 150,
                              child: Center(
                                child: Text(
                                  'Save Data'
                                  , style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }

  Future<List<PaymentTermModel>> paymentTerm() async {
    final String ApiUrl2 = "http://test.erp.gold/api/paymentterm/GetList";

    final Response2 = await http.get(Uri.parse(ApiUrl2),
        headers: {"token": "$CompanyAuthToken", "Username": "$email"});
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      PTdata = list;
    });

    return list.map((e) => PaymentTermModel.fromJson(e)).toList();
  }

  Future<List<vendorModel>> vendorList() async {
    final String ApiUrl2 =
        "http://test.erp.gold/api/Purchase/vendor/GetVendorList";

    final Response2 = await http.get(Uri.parse(ApiUrl2),
        headers: {"token": "$CompanyAuthToken", "Username": "$email"});
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      vendorData = list;
    });
    return list.map((e) => vendorModel.fromJson(e)).toList();
  }

  Future<List<WarehouseModel>> warehouse() async {
    final String ApiUrl2 =
        "http://test.erp.gold/api/AdvanceInventory/warehouses/GetList";

    final Response2 = await http.get(Uri.parse(ApiUrl2),
        headers: {"token": "$CompanyAuthToken", "Username": "$email"});
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      wareHdata = list;
    });
    return list.map((e) => WarehouseModel.fromJson(e)).toList();
  }
  Future<List<PurchaseOrderModel>> POFetch() async {
    final String ApiUrl2 = "http://test.erp.gold/api/Purchase/purchaseorder/GetPOList?vendorid=$vendor";
    print(ApiUrl2);
    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      POFet = list;
      pofetch=true;
    });
    print(Response2);
    return list.map((e) => PurchaseOrderModel.fromJson(e)).toList();
  }
  Future<List<RiItemModel>> getItemLine() async {

    idItem=Po;
    print(idItem.runtimeType);
    final String ApiUrl2 = "http://test.erp.gold/api/Purchase/purchaseorder/PucrhaseOrderLineByPOID?id=$idItem";
    print(ApiUrl2);
    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      itemLineData = list;
    });
    return list.map((e) => RiItemModel.fromJson(e)).toList();

  }
  Future<List<Map<String, dynamic>>> getItemLineforUpdate() async {

    idItemUpd=billID;
    print(idItemUpd.runtimeType);
    final String ApiUrl2 = "http://test.erp.gold/api/Purchase/receivingtransaction/GetReceiptListByID?id=$idItemUpd";
    print(ApiUrl2);
    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    Map<String, dynamic> map = json.decode(Response2.body);
    setState(() {
      itemUpdateLineData =  map["ItemLine"];
    });
    //return list.map((e) => ReceiveInventorypdateItemModel.fromJson(e)).toList();
    return List<Map<String, dynamic>>.from(json.decode(Response2.body)['ItemLine']);
  }
  Future<Map<String, dynamic>> getItemLineforUpdate2() async {

    idItemUpd=billID;
    print(idItemUpd.runtimeType);
    final String ApiUrl2 = "http://test.erp.gold/api/Purchase/receivingtransaction/GetReceiptListByID?id=$idItemUpd";
    print(ApiUrl2);
    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    Map<String, dynamic> map = json.decode(Response2.body);


    setState(() {
      itemUpdateLineData2 =  map;
    });
    //return list.map((e) => ReceiveInventorypdateItemModel.fromJson(e)).toList();
    return Map<String, dynamic>.from(json.decode(Response2.body));
  }

  Future pickDocDate(BuildContext context) async {
    final newDocDate = await showDatePicker(
      context: context,
      initialDate: docdate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDocDate != null && newDocDate != duedate)
      setState(() {
        docdatee.text = newDocDate.toString();
      });
  }

  Future pickDueDate(BuildContext context) async {
    // final initialDate = DateTime.now();
    final newDueDate = await showDatePicker(
      context: context,
      initialDate: duedate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDueDate != null && newDueDate != duedate)
      setState(() {
        duedatee.text = newDueDate.toString();
      });
  }
  Future<RecieveInventoryModel> addReceiveInv(Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$CompanyAuthToken",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/Purchase/receivingtransaction/receiptapi"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));

      return RecieveInventoryModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Receive Inventory.');
    }
  }
  Future<RecieveInventoryModel> updateRI(int id,Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$CompanyAuthToken",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/Purchase/receivingtransaction/Put"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return RecieveInventoryModel.fromJson(jsonDecode(response.body));
    }

      else
     {
      throw Exception('Failed to Update Invoice.');
    }
  }

}

import 'dart:developer';
import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobmlt/Models/POItemModel.dart';
import 'package:jobmlt/Models/customer.dart';
import 'package:jobmlt/Models/itemModel.dart';
import 'package:jobmlt/Models/paymentTermModel.dart';
import 'package:jobmlt/Models/purchaseOrderModel.dart';
import 'package:jobmlt/Models/shippingMethodModel.dart';
import 'package:jobmlt/Models/vendorModel.dart';
import 'package:jobmlt/Models/warehouseModel.dart';
import 'package:http/http.dart' as http;
import 'package:jobmlt/Views/invoicePage.dart';
import 'package:jobmlt/Views/purchaseOrder.dart';
import 'dart:convert';
import 'package:jobmlt/Widgets/textfield.dart';
import 'package:collection/collection.dart';
import 'package:table_calendar/table_calendar.dart';
class purchaseOrderUpdate extends StatefulWidget {
  String email,CompanyAuthToken;
  var idx;

  purchaseOrderUpdate({Key? key, this.idx,required this.email, required this.CompanyAuthToken}) : super(key: key);
  @override
  _purchaseOrderUpdateState createState() => _purchaseOrderUpdateState(idx,email,CompanyAuthToken);
}

class _purchaseOrderUpdateState extends State<purchaseOrderUpdate> {
  var idx;
  String email, CompanyAuthToken;

  bool get isEditing => idx != null;

  _purchaseOrderUpdateState(this.idx, this.email, this.CompanyAuthToken);


  TextEditingController customerName = new TextEditingController();
  TextEditingController paymentterm = new TextEditingController();
  TextEditingController wareHouse = new TextEditingController();
  TextEditingController items = new TextEditingController();
  TextEditingController vendorName = new TextEditingController();
  TextEditingController rate = new TextEditingController();
  TextEditingController subTotal = new TextEditingController();
  TextEditingController customerMsg = new TextEditingController();
  TextEditingController memo = new TextEditingController();
  TextEditingController total = new TextEditingController();
  TextEditingController duedatee = new TextEditingController();
  TextEditingController docdatee = new TextEditingController();
  TextEditingController shippingMethod = new TextEditingController();
  TextEditingController docDate = new TextEditingController();
  TextEditingController poStatus = new TextEditingController();
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
  List<CustomerModel> apiResponse = [];
  List Cdata = [];

  List vendorData = [];
  List shippingData = [];
  List PTdata = [];
  List wareHdata = [];
  List itemData = [];
  List itemLineData=[];
  List<WarehouseModel> warehouseResponse = [];
  List<PaymentTermModel> responsePayment = [];
  List<ItemModel> itemJson = [];
  List<POItemModel> itemLineJson=[];
  List<vendorModel> vendorJson = [];
  List<ShippingMethodModel> shippingJson = [];
  var ItemName = '',
      amount = '',
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
      vendor;
  double qty = 0.0;
  List<TextEditingController> qtyNeed = [];
  List<TextEditingController> Rate = [];
  List<TextEditingController> amountTotal = [];
  List<Map<dynamic, dynamic>> orderList = [];
  List<TextEditingController> ic = [];
  List<TextEditingController> icid = [];
  List<TextEditingController> iN = [];
  List<TextEditingController> des = [];
  List<TextEditingController> rt = [];
  List<TextEditingController> ityp = [];
  List<TextEditingController> iuc = [];
  List amt = [];
  var sum;
bool isOldItem =false;
  var idItem=0;
  var toknow=0;
  var doing = false;
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  @override
  String getText() {
    if (duedate == null) {
      return 'Select Due Date';
    }
    else if (docdate == null) {
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

      log(idItem.toString());
      if (isEditing) {
        log(idx.iD.toString());
        vendorName.text = idx.vendorName.toString();
        vendor = idx.vendorID.toString();
        sum = idx.total;

        if (idx.shippingMethodName != null) {
          shippingMethod.text = idx.shippingMethodName.toString();
        }
        if (idx.shippingMethod != null) {
          shippingmethodID = idx.shippingMethod.toString();
        }
        //others.text = idx.other.toString();
        poNumber = idx.transactionNumber.toString();
        poStatus.text = idx.pOStatus.toString();
        if (idx.shipName != null) {
          customerName.text = idx.shipName.toString();
        }
        companyID = idx.companyID.toString();

        if (idx.shipID != null) {
          cstmrz = idx.shipID.toString();
        }
        docdatee.text = idx.transactionDate.toString();
        duedatee.text = idx.dueDate.toString();
        if (idx.wareHouseName != null) {
          wareHouse.text = idx.wareHouseName.toString();
        }
        if (idx.paymentTermName != null) {
          paymentterm.text = idx.paymentTermName.toString();
        }
        customerMsg.text = idx.message.toString();
        memo.text = idx.memo.toString();
        workOrderNumber.text = idx.workOrderNumber.toString();
        subTotal.text = idx.total.toString();
        subTotal.text = idx.subTotal.toString();
        if (idx.paymentTermID != null) {
          paymentTermID = idx.paymentTermID.toString();
        }
        if (idx.wareHouseID != null) {
          warehouseID = idx.wareHouseID.toString();
        }

      }
      if (isEditing == false) {
        docdatee.text =
            DateFormat('yyyy-MM-dd').format(DateTime.parse(docdate.toString()));
        duedatee.text = duedate.toString();
        poStatus.text = 'Open';

      }
    }
  }

  _fetchCustomerName() async {
    return this._memoizer.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));


    vendorJson = await vendorList();
    apiResponse = await ReadJsonData();
    responsePayment = await paymentTerm();
    shippingJson = await shippingList();
    warehouseResponse = await warehouse();
    itemJson = await itemResponse();


    doing=true;


    if(isEditing==true) {

        itemLineJson = await getItemLine();
        log(itemLineData.toString());
        for (int i = 0; i < itemLineData.length; i++) {
          isOldItem = true;
          Map mapItem = {
            'ItemCode': itemLineData[i]['LineItemCode'],
            'ItemCodeID': itemLineData[i]['LineItemID'],
            'ItemName': itemLineData[i]['LineItemName'],
            'LineQuantity': itemLineData[i]['LineQuantity'],
            'Description': itemLineData[i]['LineItemDescription'],
            'ItemPrice': itemLineData[i]['LineRate'],
            'ItemQuantity': itemLineData[i]['LineQuantity'],
            'ItemType': itemLineData[i]['ItemType'],
            'ItemUnitCost': itemLineData[i]['LineRate'],
            'LineTotal': itemLineData[i]['LineTotal'],

          };
          itemssData.add(mapItem);

        log(itemssData.toString());


          qtyNeed.add(new TextEditingController());
          amountTotal.add(new TextEditingController());
          ic.add(new TextEditingController());
          icid.add(new TextEditingController());
          iN.add(new TextEditingController());
          des.add(new TextEditingController());
          rt.add(new TextEditingController());
          ityp.add(new TextEditingController());
          iuc.add(new TextEditingController());

          ic[i].text=itemssData[i]['ItemCode'].toString();
          icid[i].text= itemssData[i]['ItemCodeID'].toString();
          iN[i].text= itemssData[i]['ItemName'].toString();
          des[i].text=itemssData[i]['Description'].toString();
          rt[i].text= itemssData[i]['ItemPrice'].toString();
          ityp[i].text= itemssData[i]['ItemType'].toString();
          iuc[i].text= itemssData[i]['ItemUnitCost'].toString();

             qtyNeed[i].text=itemssData[i]['LineQuantity'].toString();
            qtyNeed[i].text = itemssData[i]['LineQuantity'] == null ? '0' : qtyNeed[i].text;
            amountTotal[i].text=itemssData[i]['LineTotal'].toString();
            amountTotal[i].text=itemssData[i]['LineTotal']==null?'0': amountTotal[i].text;

    }
        toknow=orderList.length;
  }}); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEditing == true ? Text('Update Purchase Order') : Text(
            'Create Purchase Order'),
       centerTitle: true,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(

            ),
            child: FutureBuilder(
                future: _fetchCustomerName(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (doing==true) {
                    // var items = data.data as List<InvoiceModel>;
                    print("donneee");
                return ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),

                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              errorText: vendor == null ? 'Field Required' : '',
                              errorStyle: TextStyle(
                                  color: vendor == null ? Colors.red : Colors.black
                              ),
                              //errorBorder:
                              errorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: vendor == null ? Colors.red : Colors
                                        .black),
                              ),

                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              labelText: "Vendor",
                            ),

                            items: vendorData.map((itms) {
                              return new DropdownMenuItem(
                                onTap: () {
                                  vendorName.text = itms["VendorName"];
                                  print(vendorName);
                                },
                                child: new Text(itms["VendorName"],
                                ),
                                value: itms["ID"].toString(),
                              );
                            }).toList(),
                            onChanged: (itm) {
                              setState(() {
                                vendor = itm as String?;

                                print(vendor);
                              });
                            },
                            value: vendor,

                          ),
                        ),


                             Padding(
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
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: "Drop To",
                                ),

                                items: Cdata.map((itms) {
                                  return new DropdownMenuItem(
                                    onTap: () {
                                      customerName.text = itms["CustomerName"];
                                      print(customerName);
                                    },
                                    child: new Text(itms["CustomerName"],
                                    ),
                                    value: itms["ID"].toString(),
                                  );
                                }).toList(),
                                onChanged: (itm) {
                                  setState(() {
                                    cstmrz = itm as String?;

                                    print(cstmrz);
                                  });
                                },
                                value: cstmrz,

                            ),
                             ),


                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
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
                            child: new Text(item['Name'],
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
                            }

                            else if (paymentterm.text == 'Net30') {
                              duedatee.text = Net30.toString();
                            }
                            else {
                              duedatee.text = duedate.toString();
                            }
                          });
                        },

                        value: paymentTermID,

                      ),
                    ),


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
                                width: MediaQuery.of(context).size.width/5.28,
                                child: TextFormField(
                                    readOnly: true,
                                    onTap: () {
                                      pickDocDate(context);
                                    },
                                    controller: docdatee,

                                    decoration: InputDecoration(
                                      border: InputBorder.none,

                                    )
                                ),
                              )
                            ],
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Due Date: ',

                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width/5.28,
                                child: TextFormField(
                                    readOnly: true,
                                    onTap: () {
                                      pickDueDate(context);
                                    },
                                    controller: duedatee,

                                    decoration: InputDecoration(
                                      border: InputBorder.none,

                                    )
                                ),
                              )
                            ],
                          ),
                        ],
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

                              controller: poStatus,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'PO Status',
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                ),
                              ),),),
                        ],
                      ),
                    ),
                    DropdownButtonFormField(

                      decoration: InputDecoration(

                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        labelText: "Shipping Method",
                      ),
                      items: shippingData.map((item) {
                        return new DropdownMenuItem(
                          onTap: () {
                            shippingMethod.text = item['Name'];
                            print(shippingMethod.text);
                          },
                          child: new Text(item['Name'],
                          ),
                          value: item["ID"].toString(),
                        );
                      }).toList(),
                      onChanged: (itm) {
                        setState(() {
                          shippingmethodID = itm as String?;
                          print(shippingmethodID);
                        });
                      },

                      value: shippingmethodID,

                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),


                      child: DropdownButtonFormField(

                        decoration: InputDecoration(
                          errorText: warehouseID == null
                              ? 'Field Required'
                              : '',
                          errorStyle: TextStyle(
                              color: warehouseID == null
                                  ? Colors.red
                                  : Colors.black
                          ),
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
                            child: new Text(item['WarehouseName'],
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

                      ),
                    ),

                    DropdownButtonFormField(

                      decoration: InputDecoration(

                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        labelText: "Items",
                      ),
                      items: itemData.map((itms) {
                        return new DropdownMenuItem(
                          //var ItemName='',amount='',customerID=0,itemCode,itemCodeID,description,itemprice,itemtype,itemunitcost,linetotal;
                          onTap: () {
                            ItemName = itms["ItemName"];
                            rate.text = itms["UnitPrice"].toString();
                            qty = 0.0;
                            itemCode = itms["ItemCode"];
                            itemCodeID = itms["ID"];
                            description = itms["ItemDescription"];
                            itemunitcost = itms["UnitCost"];
                            itemtype = itms["ItemType"];
                            //linetotal=itms["Qty_OnHand"];
                          },
                          child: new Text(itms["ItemName"],
                          ),
                          value: itms["ID"].toString(),
                        );
                      }).toList(),


                      value: Itemz,

                      onChanged: (itm) {
                        setState(() {


                          Map mapItem = {
                            'ItemCode': itemCode,
                            'ItemCodeID': itemCodeID,
                            'ItemName': ItemName,
                            'Description': description,
                            'ItemPrice': rate.text,
                            'ItemQuantity': qty.toString(),
                            'ItemType': itemtype,
                            'BalanceQuantity':qtynd,
                            'ItemUnitCost': itemunitcost,

                          };
                          itemssData.add(mapItem);


                          ic.add(new TextEditingController());
                          icid.add(new TextEditingController());
                          iN.add(new TextEditingController());
                          des.add(new TextEditingController());
                          rt.add(new TextEditingController());
                          ityp.add(new TextEditingController());
                          iuc.add(new TextEditingController());

                          for(int i=0;i<itemssData.length;i++) {
                            rt[i].text = itemssData[i]['ItemPrice'].toString();
                            ic[i].text = itemssData[i]['ItemCode'].toString();
                            icid[i].text = itemssData[i]['ItemCodeID'].toString();
                            iN[i].text = itemssData[i]['ItemName'].toString();
                            des[i].text = itemssData[i]['Description'].toString();
                            ityp[i].text = itemssData[i]['ItemType'].toString();
                            iuc[i].text = itemssData[i]['ItemUnitCost'].toString();
                            print('for loop rann' );
                          }
                          print(itemssData);
                        });
                      },
                    ),
                    Builder(
                        builder: (context) {

                          if (itemssData.isEmpty && itemLineData.isEmpty) {
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
                                        ityp.remove(ityp[index]);
                                        iuc.remove(iuc[index]);
                                        qtyNeed.remove(qtyNeed[index]);
                                        amountTotal.remove(amountTotal[index]);

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
                                                    '${itemssData[index]['ItemName']}',
                                                  ),
                                                  Text(
                                                    'Balance Quantity: ${itemssData[index]['ItemQuantity']}',
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

                                                      controller: qtyNeed[index],
                                                      keyboardType: TextInputType
                                                          .number,
                                                      onChanged: (val) {

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
                                                        onChanged: (val) {

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
                        labelText: 'Sub Total',

                      ),
                      onChanged: (val) {
                        print('doneeeeeeeeeee');
                      },
                    ),

                    TextFormField(
                      readOnly: true,
                      controller: subTotal,

                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Total Amount',

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: TextFormField(
                        controller: customerMsg,
                        maxLines: 3,

                        decoration: InputDecoration(
                            labelText: 'Vendor Message',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(12.0)
                            )
                        ),
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
                            wareHouse.text=wareHouse.text.isEmpty?'':wareHouse.text;
                            warehouseID=warehouseID==null?'':warehouseID;
                            paymentterm.text=paymentterm.text.isEmpty?'':paymentterm.text;
                            paymentTermID=paymentTermID==null?'':paymentTermID;
                            for(int i =0;i<itemssData.length;i++){
                              Map orderDetails = {
                                'BalanceQuantity': qtyNeed[i].text,
                                'LineItemCode': ic[i].text,
                                'LineItemID': icid[i].text,
                                'LineItemName': iN[i].text,
                                'LineItemDescription': des[i].text,
                                'LineRate': rt[i].text,
                                'ItemType': ityp[i].text,
                                'LineQuantity': qtyNeed[i].text,
                                'WareHouseName': wareHouse.text,
                                'WareHouseID': warehouseID,
                                'LineTotal': amountTotal[i].text,
                              };
                              orderList.add(orderDetails);
                              print(orderDetails
                                  .toString());
                            }
                            if (orderList.isEmpty&&itemLineData.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      AlertDialog(
                                        title: Text('Error Occurred'),
                                        content: Text(
                                            "Please Select a Item and it's Quantity"),
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
                            }
                            if (isEditing) {

                              Map data = {
                                'CompanyID':companyID,
                                'ID': idx.iD.toString(),
                                'DueDate': duedatee.text,
                                'ChangeShpippingAddress': false,
                                'DueDateRequired': false,
                                'AdvanceInventory': false,
                                'ShippingMethodRequired': false,
                                'IMEITracking': false,
                                'POStatus': poStatus.text,
                                'ShipToCity': '',
                                'ShipToCountry': '',
                                'ShipToState': '',
                                'ShipToStreetAddress': '',
                                'ShipToVendorName': '',
                                'ShipToZipCode': '',
                                'SubTotal': subTotal.text,
                                'Total': subTotal.text,
                                'ShipID':  cstmrz.toString(),
                                'PaymentTermName': paymentterm.text,
                                'PaymentTermID': paymentTermID,
                                'ShippingMethod': shippingmethodID,
                                'TransactionDate': docdatee.text,
                                'TransactionNumber': idx.transactionNumber.toString(),
                                'VendorID': vendor,
                                'WareHouseID': warehouseID,
                                'WorkOrderNumber': workOrderNumber.text,
                                'Memo': memo.text,
                                'Message': customerMsg.text,
                                'ItemDetail': orderList,
                              };

                              print("" + data.toString());
                              final result1 = await updatePO(idx.iD, data);

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
                                          Get.off(purchaseOrder(email:email,CompanyAuthToken: CompanyAuthToken,));

                                        },
                                      )
                                    ],
                                  )
                              );
                            }

                            else if (isEditing == false) {
                              if (vendor == null) {
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
                              else if (orderList.isEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Error Occurred'),
                                          content: Text(
                                              "Please Select a Item and it's Quantity"),
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
                              }
                              else if (orderList.isNotEmpty) {
                                Map data = {
                                  'DueDate': duedatee.text,
                                  'ChangeShpippingAddress': false,
                                  'DueDateRequired': false,
                                  'AdvanceInventory': false,
                                  'ShippingMethodRequired': false,
                                  'IMEITracking': false,
                                  'POStatus': poStatus.text,
                                  'ShipToCity': '',
                                  'ShipToCountry': '',
                                  'ShipToState': '',
                                  'ShipToStreetAddress': '',
                                  'ShipToVendorName': '',
                                  'ShipToZipCode': '',
                                  'SubTotal': subTotal.text,
                                  'Total': subTotal.text,
                                  'ShipID': cstmrz.toString(),
                                  'PaymentTermName': paymentterm.text,
                                  'PaymentTermID': paymentTermID,
                                  'ShippingMethod': shippingmethodID,
                                  'TransactionDate': docdatee.text,
                                  'VendorID': vendor,
                                  'WareHouseID': warehouseID,
                                  'WorkOrderNumber': workOrderNumber.text,
                                  'Memo': memo.text,
                                  'Message': customerMsg.text,
                                  'ItemDetail': orderList,
                                };

                                print("" + data.toString());
                                final result = await addPurchaseOrder(data);


                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Success'),
                                          content: Text(
                                              'Purchase Order Created Successfully'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Get.offAll(purchaseOrder(
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

                  ],
                );
              }

                else {
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

  Future<List<CustomerModel>> ReadJsonData() async {
    final String ApiUrl2 = "http://test.erp.gold/api/Sales/customer/GetCustomerListwithBalance";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      Cdata = list;
    });
    return list.map((e) => CustomerModel.fromJson(e)).toList();
  }

  Future<List<vendorModel>> vendorList() async {
    final String ApiUrl2 = "http://test.erp.gold/api/Purchase/vendor/GetVendorList";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      vendorData = list;
    });
    return list.map((e) => vendorModel.fromJson(e)).toList();
  }

  Future<List<ShippingMethodModel>> shippingList() async {
    final String ApiUrl2 = "http://test.erp.gold/api/shippingmethod/GetList";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      shippingData = list;
    });
    return list.map((e) => ShippingMethodModel.fromJson(e)).toList();
  }

  Future<List<PaymentTermModel>> paymentTerm() async {
    final String ApiUrl2 = "http://test.erp.gold/api/paymentterm/GetList";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      PTdata = list;
    });

    return list.map((e) => PaymentTermModel.fromJson(e)).toList();
  }

  Future<List<WarehouseModel>> warehouse() async {
    final String ApiUrl2 = "http://test.erp.gold/api/AdvanceInventory/warehouses/GetList";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      wareHdata = list;
    });
    return list.map((e) => WarehouseModel.fromJson(e)).toList();
  }

  Future<List<ItemModel>> itemResponse() async {
    final String ApiUrl2 = "http://test.erp.gold/api/advanceinventory/items/GetList";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      itemData = list;
    });
    return list.map((e) => ItemModel.fromJson(e)).toList();
  }

  Future pickDocDate(BuildContext context) async {
    final newDocDate = await showDatePicker(
      context: context,
      initialDate: docdate,
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime(DateTime
          .now()
          .year + 5),

    );

    if (newDocDate != null && newDocDate != duedate)
      setState(() {
        docdatee.text =
            newDocDate.toString();
      });
  }

  Future pickDueDate(BuildContext context) async {
    // final initialDate = DateTime.now();
    final newDueDate = await showDatePicker(
      context: context,
      initialDate: duedate,
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime(DateTime
          .now()
          .year + 5),
    );

    if (newDueDate != null && newDueDate != duedate)
      setState(() {
        duedatee.text =
            newDueDate.toString();
      });
  }

  Future<PurchaseOrderModel> addPurchaseOrder(Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$CompanyAuthToken",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/Purchase/purchaseorder/Post"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));

      return PurchaseOrderModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Add Invoice.');
    }
  }

  Future<List<POItemModel>> getItemLine() async {

    idItem=idx.iD;
    log(idItem.toString());
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
    return list.map((e) => POItemModel.fromJson(e)).toList();

  }
  Future<PurchaseOrderModel> updatePO(int id,Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$CompanyAuthToken",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/Purchase/purchaseorder/Put"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return PurchaseOrderModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Update Invoice.');
    }
  }


  // getitemindi(){
  //
  //   return FutureBuilder(
  //       future: itemResponse(),
  //   builder: (context, data) {
  //   if (data.hasError) {
  //   print('${data.error}');
  //   return Center(child: Text("${data.error}",)
  //   );
  //   } else if (data.hasData) {
  //   var items = data.data as List<ItemModel>;
  //   return Icon(Icons.arrow_circle_down);}
  //   else {
  //   return Center(
  //   child: Transform.scale(
  //     scale: 0.6,
  //     child: CircularProgressIndicator(),
  //   )
  //   );
  //   }
  //
  //   });}

}




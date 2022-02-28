import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobmlt/Models/paymentTermModel.dart';
import 'package:http/http.dart' as http;
import 'package:jobmlt/Models/purchaseOrderModel.dart';
import 'package:jobmlt/Models/riItemModel.dart';
import 'package:jobmlt/Models/vendorModel.dart';
import 'package:jobmlt/Models/warehouseModel.dart';
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

  _receiveInventoryUpdateState(this.idx, this.email, this.CompanyAuthToken);

  TextEditingController PONumber = new TextEditingController();
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

  List Cdata = [];

  List vendorData = [];
  List shippingData = [];
  List PTdata = [];
  List wareHdata = [];
  List POFet = [];
  List itemData = [];
  List itemLineData = [];
  List<WarehouseModel> warehouseResponse = [];
  List<PaymentTermModel> responsePayment = [];
  List<PurchaseOrderModel> poResponse = [];
  List<RiItemModel> itemLineJson=[];
  List<vendorModel> vendorJson = [];

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
      vendor,
  Po;
  double qty = 0.0;
  List<TextEditingController> qtyNeed = [];
  List<TextEditingController> blncQty = [];
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
  bool isOldItem = false;
  var idItem='';
  var toknow = 0;
  var doing = false;
  bool _checkbox = false;
  bool _checkboxListTile = false;
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

  _fetchCustomerName() async {
    return this._memoizer.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));

      vendorJson = await vendorList();

      responsePayment = await paymentTerm();
      warehouseResponse = await warehouse();
      print('done');
      doing = true;
      // responsePayment = await paymentTerm();
      //
      // warehouseResponse = await warehouse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: isEditing == true ? Text('Update Purchase Order') : Text(
        //'Create Purchase Order'),
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
                          });
                        },
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10.0),
                      //   child: DropdownButtonFormField(
                      //     decoration: InputDecoration(
                      //       errorText: vendor == null ? 'Field Required' : '',
                      //       errorStyle: TextStyle(
                      //           color:
                      //               vendor == null ? Colors.red : Colors.black),
                      //       //errorBorder:
                      //       errorBorder: OutlineInputBorder(
                      //         borderRadius: const BorderRadius.all(
                      //           const Radius.circular(10.0),
                      //         ),
                      //         borderSide: BorderSide(
                      //             color: vendor == null
                      //                 ? Colors.red
                      //                 : Colors.black),
                      //       ),
                      //
                      //       filled: true,
                      //       hintStyle: TextStyle(color: Colors.grey[800]),
                      //       labelText: "Receipt / Receipt & Bill",
                      //     ),
                      //     items: vendorData.map((itms) {
                      //       return new DropdownMenuItem(
                      //         onTap: () {
                      //           vendorName.text = itms["VendorName"];
                      //           print(vendorName);
                      //         },
                      //         child: new Text(
                      //           itms["VendorName"],
                      //         ),
                      //         value: itms["ID"].toString(),
                      //       );
                      //     }).toList(),
                      //     onChanged: (itm) {
                      //       setState(() {
                      //         vendor = itm as String?;
                      //
                      //         print(vendor);
                      //       });
                      //     },
                      //     value: vendor,
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            errorText: vendor == null ? 'Field Required' : '',
                            errorStyle: TextStyle(
                                color:
                                    vendor == null ? Colors.red : Colors.black),
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
                              onTap: () {
                                vendorName.text = itms["VendorName"];

                                print(vendorName);
                              },
                              child: new Text(
                                itms["VendorName"],
                              ),
                              value: itms["ID"].toString(),
                            );
                          }).toList(),
                          onChanged: (itm) async{

                            setState(() {
                              Po=null;
                              vendor = itm as String?;
                              if(itemssData.isNotEmpty){
                                for(int i =0 ; i<itemssData.length;i++){
                                  itemssData.removeAt(i);}
                              }
                              print(vendor);
                            });
                            poResponse = await POFetch();
                          },
                          value: vendor,
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if(vendor!=null){
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
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                labelText: "Purchase Order",
                              ),

                              items: POFet.map((itms) {
                                return new DropdownMenuItem(
                                  onTap: () {
                                    PONumber.text = itms["TransactionNumber"];
                                    print(PONumber.text);
                                  },
                                  child: new Text(
                                    '${itms["TransactionNumber"]} - ${itms["POStatus"]}',
                                  ),
                                  value: itms["ID"].toString(),
                                );
                              }).toList(),
                              onChanged: (itm) async{
                                Po==null;
                                setState(() {

                                  Po = itm as String?;
                                  if(itemssData.isNotEmpty){
                                    for(int i =0 ; i<itemssData.length;i++){
                                    itemssData.removeAt(i);}
                                  }
                                  print(Po);

                                });
                                itemLineJson = await getItemLine();


                                print(itemLineData.length);

                                for(int i = 0 ; i < itemLineData.length ; i++) {
                                  ic.add(new TextEditingController());
                                  icid.add(new TextEditingController());
                                  iN.add(new TextEditingController());
                                  des.add(new TextEditingController());
                                  rt.add(new TextEditingController());
                                  ityp.add(new TextEditingController());
                                  iuc.add(new TextEditingController());
                                  qtyNeed.add(new TextEditingController());
                                  amountTotal.add(new TextEditingController());
                                  blncQty.add(TextEditingController());
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

                                  };
                                  itemssData.add(mapItem);
                                  ic[i].text=itemssData[i]['ItemCode'].toString();
                                  icid[i].text= itemssData[i]['ItemCodeID'].toString();
                                  iN[i].text= itemssData[i]['ItemName'].toString();
                                  des[i].text=itemssData[i]['Description'].toString();
                                  rt[i].text= itemssData[i]['ItemPrice'].toString();
                                  ityp[i].text= itemssData[i]['ItemType'].toString();
                                  iuc[i].text= itemssData[i]['ItemUnitCost'].toString();
                                  qtyNeed[i].text= itemssData[i]['ItemQuantity'].toString();
                                  blncQty[i].text= itemssData[i]['BalanceQuantity'].toString();
                                  amountTotal[i].text= itemssData[i]['LineTotal'].toString();
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
                                  print('for loop rann' );
                                }
                                subTotal.text =
                                    sum.toString();

                                total.text =
                                    subTotal.text;
                              },
                              value: Po,

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
                        child: DropdownButtonFormField(
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
                        ),
                      ),
                      Builder(
                          builder: (context) {

                            if (Po==null || itemLineData.isEmpty) {
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
                                                Container(
                                                    child: Builder(
                                                        builder: (context) {

                                                          if(ityp[index].text=='20') {
                                                            return InkWell(
                                                                onTap:(){
                                                                 },
                                                                child: Container(
                                                                  height: 40,

                                                                  decoration: BoxDecoration(
                                                                    color: Colors.grey[300],
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors.grey.withOpacity(0.2),
                                                                        spreadRadius: 3,
                                                                        blurRadius: 4,
                                                                        offset: Offset(0, 3), // changes position of shadow
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Serial #',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold
                                                                      ),
                                                                    ),
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
    });
    print(Response2);
    return list.map((e) => PurchaseOrderModel.fromJson(e)).toList();
  }
  Future<List<RiItemModel>> getItemLine() async {

    idItem=Po;
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
    return list.map((e) => RiItemModel.fromJson(e)).toList();

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

}

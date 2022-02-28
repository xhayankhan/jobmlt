import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:async';
import 'package:async/async.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:jobmlt/Models/InvoiceItemLineModel.dart';
import 'package:jobmlt/Models/customer.dart';
import 'package:jobmlt/Models/invoiceModel.dart';
import 'package:jobmlt/Models/itemModel.dart';
import 'package:jobmlt/Models/paymentTermModel.dart';
import 'package:jobmlt/Models/warehouseModel.dart';
import 'package:jobmlt/Views/customerPage.dart';
import 'package:http/http.dart' as http;
import 'package:jobmlt/Views/invoicePage.dart';
import 'dart:convert';
import 'package:jobmlt/Widgets/textfield.dart';
import 'package:collection/collection.dart';
import 'package:table_calendar/table_calendar.dart';



class invoiceUpdate extends StatefulWidget {
  String email,CompanyAuthToken;
  var idx;

  invoiceUpdate({Key? key, this.idx,required this.email, required this.CompanyAuthToken}) : super(key: key);
  @override
  _invoiceUpdateState createState() => _invoiceUpdateState(idx,email,CompanyAuthToken);
}

class _invoiceUpdateState extends State<invoiceUpdate> {
  var idx;
  String email, CompanyAuthToken;

  bool get isEditing => idx != null;

  _invoiceUpdateState(this.idx, this.email, this.CompanyAuthToken);


  TextEditingController customerName = new TextEditingController();
  TextEditingController paymentterm = new TextEditingController();
  TextEditingController wareHouse = new TextEditingController();
  TextEditingController items = new TextEditingController();
    //TextEditingController qtyNeed = new TextEditingController();
    TextEditingController rate = new TextEditingController();
    TextEditingController subTotal = new TextEditingController();
  TextEditingController discount = new TextEditingController();
  TextEditingController discountprcntg = new TextEditingController();
  TextEditingController shipping = new TextEditingController();
  TextEditingController customerMsg = new TextEditingController();
  TextEditingController memo = new TextEditingController();
  TextEditingController others = new TextEditingController();
  TextEditingController total = new TextEditingController();
  TextEditingController duedatee = new TextEditingController();
  TextEditingController docdatee = new TextEditingController();

  // TextEditingController dueDate = new TextEditingController();
  // TextEditingController docDate = new TextEditingController();


  String? Itemz,newItm;
  List<dynamic> itemssData=[];
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime docdate = DateTime.now();
  DateTime duedate = DateTime.now();
  var datee = new DateTime.now();
  DateTime Net15 =  DateTime.now().add(new Duration(days: 15));
  DateTime Net30 =  DateTime.now().add(new Duration(days: 30));

  DateTime? _selectedDay;
  List<CustomerModel> apiResponse = [];
  List Cdata=[] ;
  List PTdata=[];
  List wareHdata=[];
  List itemData= [];
  List itemLineData=[];
  List<WarehouseModel> warehouseResponse=[];
  List<PaymentTermModel> responsePayment = [];
  List<ItemModel> itemJson = [];
  List<InvoiceItemModel> itemLineJson=[];
  var ItemName='',itemCode,itemCodeID,description,itemtype,itemunitcost,amount='',qtynd,customerID,linetotal,cstmrz,paymentTermID,warehouseID,txnNum,companyID;
  double qty =0.0;
  List<TextEditingController> qtyNeed = [];
  //List<TextEditingController> Rate=[];
  List<TextEditingController> amountTotal = [];
  List<Map<dynamic, dynamic>> orderList = [];
  List<TextEditingController> ic = [];
  List<TextEditingController> icid = [];
  List<TextEditingController> iN = [];
  List<TextEditingController> des = [];
  List<TextEditingController> rt = [];
  List<TextEditingController> ityp = [];
  List<TextEditingController> iuc = [];

  // 'ItemCode': itemCode,
  // 'ItemCodeID': itemCodeID,
  // 'ItemName': ItemName,
  // 'Description': description,
  // 'ItemPrice': rate.text,
  // 'ItemQuantity': qtyNeed[index].text,
  // 'ItemType': itemtype,
  // 'ItemUnitCost': itemunitcost,
  // 'LineTotal': amountTotal[index].text,

  List amt=[];
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  bool isOldItem =false;
  var sum;
  var idItem=0;
  var qtty=0.0;
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
    if(mounted) {
      _fetchCustomerName();
      if (isEditing) {
        print(idx.id.toString());
        others.text = idx.other.toString();
        txnNum = idx.txnNumber.toString();
        companyID=idx.companyID.toString();
        customerName.text = idx.customerName.toString();
        cstmrz = idx.customerId.toString();
        docdatee.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(idx.docDate.toString()));
        duedatee.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(idx.dueDate.toString()));
        if (idx.wareHouseName != null) {
          wareHouse.text = idx.wareHouseName.toString();
        }
        if (idx.paymentTermName != null) {
          paymentterm.text = idx.paymentTermName.toString();
        }
        //discountprcntg.text = idx.discountPercentage.toString();
        shipping.text = idx.shippingRate.toString();
        customerMsg.text = idx.customerMessage.toString();
        memo.text = idx.memo.toString();
        total.text = idx.totalAmount.toString();
        discountprcntg.text = idx.discountPercentage.toString();
        discount.text = idx.discount.toString();
         subTotal.text = idx.subTotal.toString();
        sum = idx.subTotal;
        if (idx.paymentTermId != null) {
          paymentTermID = idx.paymentTermId.toString();
        }
        if (idx.wareHouseId != null) {
          warehouseID = idx.wareHouseId.toString();
        }

      }
      if(isEditing==false){
        docdatee.text = docdate.toString();
        duedatee.text = duedate.toString();
      }
    }
  }
var doing=false;
  _fetchCustomerName() async {
    return this._memoizer.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));



      apiResponse = await ReadJsonData();
      responsePayment = await paymentTerm();

      warehouseResponse = await warehouse();
      itemJson = await itemResponse();
      discount.text=discount.text.isEmpty?'0.0':discount.text;
      discountprcntg.text=discountprcntg.text.isEmpty?'0.0':discountprcntg.text;
      others.text=others.text.isEmpty?'0.0':others.text;
      shipping.text=shipping.text.isEmpty?'0.0':shipping.text;
      doing=true;


      if(isEditing==true) {

        itemLineJson = await getItemLine();
        print(itemLineData.toString());
        for (int i = 0; i < itemLineData.length; i++) {
          isOldItem = true;
          Map mapItem = {
            'ItemCode': itemLineData[i]['ItemCode'],
            'ItemCodeID': itemLineData[i]['ItemCodeID'],
            'ItemName': itemLineData[i]['ItemName'],
            'LineQuantity': itemLineData[i]['ItemQuantity'],
            'Description': itemLineData[i]['Description'],
            'ItemPrice': itemLineData[i]['ItemPrice'],
            'ItemQuantity': itemLineData[i]['BalanceQty'],
            'ItemType': itemLineData[i]['ItemType'],
            'ItemUnitCost': itemLineData[i]['ItemUnitCost'],
            'LineTotal': itemLineData[i]['LineTotal'],
          };
          itemssData.add(mapItem);

           log(itemssData.toString());
          // Map orderDetails = {
          //
          //
          //   'ItemCode': itemLineData[i]['ItemCode'],
          //   'ItemCodeID': itemLineData[i]['ItemCodeID'],
          //   'ItemName': itemLineData[i]['ItemName'],
          //   'Description': itemLineData[i]['Description'],
          //   'ItemPrice': itemLineData[i]['ItemPrice'],
          //   'ItemQuantity': itemLineData[i]['ItemQuantity'],
          //   'ItemType': itemLineData[i]['ItemType'],
          //   'ItemUnitCost': itemLineData[i]['ItemUnitCost'],
          //   'LineTotal': itemLineData[i]['LineTotal'],
          //
          // };
          // orderList.add(orderDetails);
          // print(orderDetails
          //     .toString());




          qtyNeed.add(new TextEditingController());
          amountTotal.add(new TextEditingController());
          ic.add(new TextEditingController());
          icid.add(new TextEditingController());
          iN.add(new TextEditingController());
          des.add(new TextEditingController());
          rt.add(new TextEditingController());
          ityp.add(new TextEditingController());
          iuc.add(new TextEditingController());

          ic[i].text= itemLineData[i]['ItemCode'].toString();
          icid[i].text= itemLineData[i]['ItemCodeID'].toString();
       iN[i].text= itemLineData[i]['ItemName'].toString();
       des[i].text=itemLineData[i]['Description'].toString();
        rt[i].text= itemLineData[i]['ItemPrice'].toString();
        ityp[i].text= itemLineData[i]['ItemType'].toString();
        iuc[i].text= itemLineData[i]['ItemUnitCost'].toString();

          qtyNeed[i].text=itemssData[i]['LineQuantity'].toString();
          qtyNeed[i].text = itemssData[i]['LineQuantity'] == null ? '0' : qtyNeed[i].text;
          amountTotal[i].text=itemssData[i]['LineTotal'].toString();
          amountTotal[i].text=itemssData[i]['LineTotal']==null?'0': amountTotal[i].text;
        }


      }}); }



  @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title:  isEditing==true? Text('Update Invoice'): Text('Create Invoice'),
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
                                errorText: cstmrz == null
                                    ? 'Field Required'
                                    : '',
                                errorStyle: TextStyle(
                                    color: cstmrz == null ? Colors.red : Colors
                                        .black
                                ),
                                //errorBorder:
                                errorBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: cstmrz == null
                                          ? Colors.red
                                          : Colors.black),
                                ),

                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                labelText: "Customer",
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
                            padding: const EdgeInsets.only(top: 10.0),


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
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      'Doc Date: ',

                                    ),
                                    SizedBox(
                                      width: 85,
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
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      'Due Date: ',

                                    ),
                                    SizedBox(
                                      width: 85,
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


                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: DropdownButtonFormField(

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
                                    qty = itms["Qty_OnHand"];
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
                              //value: itemss,
                              onChanged: (itm) {
                                setState(() {
                                  //Itemz = itm as String?;

                                  //itemssData.add(itm);

                                  Map mapItem = {
                                    'ItemCode': itemCode,
                                    'ItemCodeID': itemCodeID,
                                    'ItemName': ItemName,
                                    'Description': description,
                                    'ItemPrice': rate.text,
                                    'ItemQuantity': qty.toString(),
                                    'ItemType': itemtype,
                                    'ItemUnitCost': itemunitcost,
                                    'LineTotal': amount,
                                    'QuantityNeeded': qtynd,
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
                                  //print(Itemz);
                                });
                              },
                            ),
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



                            //  qtyNeed[index].text = qtyNeed[index].text.isEmpty ? '0' : qtyNeed[index].text;
                              amountTotal[index].text=amountTotal[index].text.isEmpty?'0': amountTotal[index].text;

                              return Dismissible(
                                key: UniqueKey(),
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



                                    print(sum);
                                    ic.remove(ic[index]);
                                    icid.remove(icid[index]);
                                    iN.remove(iN[index]);
                                    des.remove(des[index]);
                                    rt.remove(rt[index]);
                                    ityp.remove(ityp[index]);
                                    iuc.remove(iuc[index]);
                                    qtyNeed.remove(qtyNeed[index]);
                                    amountTotal.remove(amountTotal[index]);
                                    itemssData.removeAt(index);
                                    // if(orderList.isNotEmpty){
                                    //   orderList.removeAt(index);
                                    // }


                                      double a = double.parse(shipping.text); // this is the value in my first text field (This is the percentage rate i intend to use)
                                      double b = double.parse(subTotal.text); // this is my second text field
                                      double d = double.parse(others.text);
                                      double g=double.parse(discount.text);//do your calculation
                                      double e = a+b+d;

                                      double f = e - g;
                                      total.text = f.toStringAsFixed(2);
                                      print(total.text);


                                    print(itemssData);
                                  });
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                    borderRadius: BorderRadius.circular(
                                        10),),
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
                                                'Qty on Hand: ${itemssData[index]['ItemQuantity']}',
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

                                                    qtty = val.isEmpty ? 0 : double.parse(val);
                                                     if(isEditing==false) {
                                                    double a = double.parse(rt[index].text); // this is the value in my first text field (This is the percentage rate i intend to use)
                                                    double b = val.isEmpty?0:double.parse(val);// this is my second text field
                                                    double c = a * b; //do your calculation
                                                    amountTotal[index].text = c.toStringAsFixed(2);
                                                    total.text = c.toStringAsFixed(2);
                                                    for(int i=0; i<itemssData.length; i++){
                                                      if (0 < i) {
                                                        sum = sum + double.parse(amountTotal[i].text);
                                                      }
                                                      else {
                                                        sum = double.parse(amountTotal[i].text);
                                                      }

                                                    }

                                                    subTotal.text = sum.toString();
                                                    sum = double.parse(subTotal.text);
                                                    total.text = sum.toString();



                                                    amount = amountTotal[index].text;
                                                    qtynd = qtyNeed[index].text;
                                                    //print(itemssData);
                                                     }
                                                    if(isEditing==true){
                                                      double a = double.parse(rt[index].text); // this is the value in my first text field (This is the percentage rate i intend to use)
                                                      double b = val.isEmpty?0:double.parse(val);// this is my second text field
                                                      double c = a * b; //do your calculation
                                                      amountTotal[index].text = c.toStringAsFixed(2);
                                                      for(int i=0; i<itemssData.length; i++){
                                                        if (0 < i) {
                                                          sum = sum + double.parse(amountTotal[i].text);
                                                        }
                                                        else {
                                                          sum = double.parse(amountTotal[i].text);
                                                        }

                                                      }
                                                      subTotal.text = sum.toString();
                                                      sum = double.parse(subTotal.text);
                                                      total.text = sum.toString();
                                                      double d=double.parse(total.text);
                                                      double i=double.parse(idx.discount.toString());
                                                      double j=double.parse(idx.shippingRate.toString());
                                                      double k=double.parse(idx.other.toString());
                                                      double e=(j+k+d)-i;
                                                      total.text = e.toStringAsFixed(2);
                                                    }




                                                  },
                                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                                validator: (value){

                                                  if(value == null || value.isEmpty || value=='0')
                                                    { return "Cannot be empty";}
                                                  else if( double.parse(value)> double.parse(itemssData[index]['ItemQuantity'].toString()))
                                                    {
                                                      return 'Max Quantity';
                                                    }
                                                  else {
                                                    return null;
                                                  }
                                                },
                                                  decoration: InputDecoration(

                                                      labelText: 'Quantity',
                                                     // errorText: qtty > double.parse(itemssData[index]['ItemQuantity'].toString()) ? 'QTY is greater' : ''
                                                  ),
                                                ),
                                              ),
                                              Expanded(

                                                child: TextFormField(

                                                    controller: rt[index],
                                                    keyboardType: TextInputType
                                                        .number,
                                                    decoration: InputDecoration(
                                                        labelText: 'Unit Price'

                                                    ),
                                                    onChanged: (val) {
                                                      val= val.isEmpty?'0.0':val;
                                                      if(isEditing==false) {
                                                        double a = double.parse(val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                                        double b = qtyNeed[index].text.isEmpty?0:double.parse(qtyNeed[index].text);// this is my second text field
                                                        double c = a * b; //do your calculation
                                                        amountTotal[index].text = c.toStringAsFixed(2);
                                                        total.text = c.toStringAsFixed(2);
                                                        for(int i=0; i<itemssData.length; i++){
                                                          if (0 < i) {
                                                            sum = sum + double.parse(amountTotal[i].text);
                                                          }
                                                          else {
                                                            sum = double.parse(amountTotal[i].text);
                                                          }

                                                        }

                                                        subTotal.text = sum.toString();
                                                        sum = double.parse(subTotal.text);
                                                        total.text = sum.toString();



                                                        amount = amountTotal[index].text;
                                                        qtynd = qtyNeed[index].text;
                                                        //print(itemssData);
                                                      }
                                                      if(isEditing==true){
                                                        double a = double.parse(val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                                        double b = qtyNeed[index].text.isEmpty?0:double.parse(qtyNeed[index].text);// this is my second text field
                                                        double c = a * b; //do your calculation
                                                        amountTotal[index].text = c.toStringAsFixed(2);
                                                        for(int i=0; i<itemssData.length; i++){
                                                          if (0 < i) {
                                                            sum = sum + double.parse(amountTotal[i].text);
                                                          }
                                                          else {
                                                            sum = double.parse(amountTotal[i].text);
                                                          }

                                                        }
                                                        subTotal.text = sum.toString();
                                                        sum = double.parse(subTotal.text);
                                                        total.text = sum.toString();
                                                        double d=double.parse(total.text);
                                                        double i=double.parse(idx.discount.toString());
                                                        double j=double.parse(idx.shippingRate.toString());
                                                        double k=double.parse(idx.other.toString());
                                                        double e=(j+k+d)-i;
                                                        total.text = e.toStringAsFixed(2);
                                                      }



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
                    }),
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
                            onChanged: (val) {

                              val= val.isEmpty?'0.0':val;

                              if (double.parse(val) >
                                  double.parse(subTotal.text)) {
                                val = subTotal.text;
                                // if(isEditing==false) {
                                double a = double.parse(
                                    val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                double b = double.parse(subTotal
                                    .text); // this is my second text field
                                double d = ((b - a) / b) *
                                    100; //do your calculation
                                double e = 100 - d;
                                double f = b - a;
                                total.text = f.toStringAsFixed(2);
                                discountprcntg.text = e.toStringAsFixed(2);
                                // }
                                // if(isEditing==true) {
                                //   double a = double.parse(val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                //   double b = double.parse(subTotal.text); // this is my second text field
                                //   double d = ((b - a) / b) * 100; //do your calculation
                                //   double e = 100 - d;
                                //   double f = b - a;
                                //   double g=double.parse(idx.totalAmount.toString());
                                //   double h=f+g;
                                //   total.text = h.toStringAsFixed(2);
                                //   discountprcntg.text = e.toStringAsFixed(2);
                                // }
                                for (int i = 0; i > itemssData.length; i++) {
                                  linetotal += amountTotal[i].text;
                                }
                                print(linetotal);
                              }
                              else {
                                //if(isEditing==false) {
                                double a = double.parse(
                                    val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                double b = double.parse(subTotal
                                    .text); // this is my second text field
                                double d = ((b - a) / b) *
                                    100; //do your calculation
                                double e = 100 - d;
                                double f = b - a;
                                total.text = f.toStringAsFixed(2);
                                discountprcntg.text = e.toStringAsFixed(2);
                                // }
                                // if(isEditing==true) {
                                //   double a = double.parse(val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                //   double b = double.parse(subTotal.text); // this is my second text field
                                //   double d = ((b - a) / b) * 100; //do your calculation
                                //   double e = 100 - d;
                                //   double f = b - a;
                                //   double g=double.parse(idx.totalAmount.toString());
                                //   double h=f+g;
                                //   total.text = h.toStringAsFixed(2);
                                //   discountprcntg.text = e.toStringAsFixed(2);
                                // }
                                for (int i = 0; i > itemssData.length; i++) {
                                  linetotal += amountTotal[i].text;
                                }
                              }
                            },
                            controller: discount,
                            keyboardType: TextInputType.number,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value){
                              if(value == null || value.isEmpty || value=='0')
                              { return null;}
                              else if( double.parse(value)> double.parse(sum.toString()))
                              {
                                return 'Discount cannot be greater than subtotal';
                              }
                              else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Discount Amount',

                            ),
                          ),
                          TextFormField(

                            onChanged: (val) {
                              val= val.isEmpty?'0.0':val;
                              if (double.parse(val) > 100) {
                                val = '100';
                                // if(isEditing==false) {

                                double a = double.parse(
                                    val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                double b = double.parse(
                                    subTotal
                                        .text); // this is my second text field

                                double e = (a / 100) * b;
                                discount.text = e.toStringAsFixed(2);
                                double g = double.parse(discount.text);
                                double h = b - g;
                                total.text = h.toStringAsFixed(2);
                                // }
                                // if(isEditing==true){
                                //   double a = double.parse(
                                //       val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                //   double b = double.parse(
                                //       subTotal.text); // this is my second text field
                                //
                                //   double e = (a / 100) * b;
                                //   discount.text = e.toStringAsFixed(2);
                                //   double g = double.parse(discount.text);
                                //   double h = b - g;
                                //   double i=double.parse(idx.totalAmount.toString());
                                //   double j=i+h;
                                //   total.text = j.toStringAsFixed(2);
                                // }

                              }
                              else {
                                double a = double.parse(
                                    val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                double b = double.parse(
                                    subTotal
                                        .text); // this is my second text field

                                double e = (a / 100) * b;
                                discount.text = e.toStringAsFixed(2);
                                double g = double.parse(discount.text);
                                double h = b - g;
                                total.text = h.toStringAsFixed(2);
                                //
                                // if(isEditing==true){
                                //   double a = double.parse(
                                //       val); // this is the value in my first text field (This is the percentage rate i intend to use)
                                //   double b = double.parse(
                                //       subTotal.text); // this is my second text field
                                //
                                //   double e = (a / 100) * b;
                                //   discount.text = e.toStringAsFixed(2);
                                //   double g = double.parse(discount.text);
                                //   double h = b - g;
                                //   double i=double.parse(idx.totalAmount.toString());
                                //   double j=i+h;
                                //   total.text = j.toStringAsFixed(2);
                                // }
                              }
                            },

                            controller: discountprcntg,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value){
                              if(value == null || value.isEmpty || value=='0')
                              { return null;}
                              else if( double.parse(value)>100)
                              {
                                return 'Discount % cannot be greater than 100';
                              }
                              else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Discount %',

                            ),

                          ),
                          TextFormField(
                            onChanged: (val) {
                              val= val.isEmpty?'0.0':val;
                              //if(isEditing==false) {
                              double a = double.parse(
                                  val); // this is the value in my first text field (This is the percentage rate i intend to use)
                              double b = double.parse(subTotal
                                  .text); // this is my second text field
                              double f = discount.text.isEmpty?0.0:double.parse(discount.text);
                              double e = a + b;
                              double c = e - f;
                              total.text = c.toStringAsFixed(2);
                              //}
                              // if(isEditing==true){
                              //   double a = double.parse(val); // this is the value in my first text field (This is the percentage rate i intend to use)
                              //   double b = double.parse(subTotal.text); // this is my second text field
                              //
                              //   double e =a+b;
                              //   double i=double.parse(idx.totalAmount.toString());
                              //   double j=i+e;
                              //   total.text = j.toStringAsFixed(2);
                              // }

                            },
                            controller: shipping,

                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Shipping Charges',

                            ),
                          ),
                          TextFormField(
                            onChanged: (val) {
                              val= val.isEmpty?'0.0':val;
                              // if(isEditing==false) {
                              double a = double.parse(val);
                              double c = shipping.text.isEmpty?0.0:double.parse(shipping.text); // this is the value in my first text field (This is the percentage rate i intend to use)
                              double b = double.parse(subTotal
                                  .text); // this is my second text field
                              double f = discount.text.isEmpty?0.0:double.parse(discount.text);
                              double e = (a + b + c) - f;

                              total.text = e.toStringAsFixed(2);
                              // }
                              // if(isEditing==true){
                              //   double a = double.parse(val);
                              //   double c = double.parse(shipping.text);// this is the value in my first text field (This is the percentage rate i intend to use)
                              //   double b = double.parse(subTotal.text); // this is my second text field
                              //
                              //   double e =a+b+c;
                              //   double i=double.parse(idx.totalAmount.toString());
                              //   double j=i+e;
                              //   total.text = j.toStringAsFixed(2);
                              // }

                            },
                            controller: others,

                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Other Charges',

                            ),
                          ),
                          TextFormField(
                            readOnly: true,
                            controller: total,

                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Total',

                            ),
                          ),
                          TextFormField(
                            readOnly: true,
                            controller: total,

                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Balance Amount',

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: TextFormField(
                              controller: customerMsg,
                              maxLines: 3,

                              decoration: InputDecoration(
                                  labelText: 'Customer Message',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black),
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
                            for(int i =0;i<itemssData.length;i++){
                              Map orderDetails = {

                                'ItemCode': ic[i].text,
                                'ItemCodeID': icid[i].text,
                                'ItemName': iN[i].text,
                                'Description': des[i].text,
                                'ItemPrice': rt[i].text,
                                'ItemQuantity': qtyNeed[i].text,
                                'ItemType': ityp[i].text,
                                'ItemUnitCost': iuc[i].text,
                                'LineTotal': amountTotal[i].text,
                              };
                              orderList.add(orderDetails);
                              print(orderList.toString());
                            }
                                  if (isEditing) {
                                   if(double.parse(discount.text)>double.parse(subTotal.text)&&double.parse(discount.text.toString())!=null){
                                    showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Text('Error Occurred'),
                                          content: Text("The discount amount cannot be more than the Sub total: ${subTotal.text}",
                                          ),
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
                                  else if(double.parse(discountprcntg.text)>100&&double.parse(discountprcntg.text)!=null){
                                    showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Text('Error Occurred'),
                                          content: Text("The discount % cannot be more than 100",
                                          ),
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
                                  else if(orderList.isNotEmpty){


                                    Map data = {

                                      //'SA_TransactionID':524274,
                                      'TxnNumber': txnNum,
                                      'CompanyID': companyID,
                                      'ID': idx.id,
                                      'CustomerID': cstmrz,
                                      'CustomerName': customerName.text,
                                      'DocDate': docdatee.text,
                                      'DueDate': duedatee.text,
                                      'WareHouseID': warehouseID,
                                      'WareHouseName': wareHouse.text,
                                      'SubTotal': subTotal.text,
                                      'PaymentTermID': paymentTermID,
                                      'PaymentTermName': paymentterm.text,
                                      'DiscountAmount': discount.text,
                                      'Discount_Percentage': discountprcntg
                                          .text,
                                      'Freight': shipping.text,
                                      'CustomerMessage': customerMsg.text,
                                      'Memo': memo.text,
                                      'Other': others.text,
                                      'TotalAmount': total.text,
                                      'BalanceAmount': total.text,
                                      'OrderDetail': orderList,
                                    };

                                    print("" + data.toString());
                                    final result1 = await updateInvoice(
                                        idx.id, data);

                                    print(result1);

                                    showDialog(
                                        context: context,
                                        builder: (_) =>
                                            AlertDialog(
                                              title: Text('Success'),
                                              content: Text(
                                                  'Invoice Updated Successfully'),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  child: Text('Ok'),
                                                  onPressed: () {
                                                    Get.offAll(invoice(
                                                      email: email,
                                                      CompanyAuthToken: CompanyAuthToken,));
                                                  },
                                                )
                                              ],
                                            )
                                    );
                                  } }
                                  else if (isEditing == false) {
                                    if (cstmrz == null) {
                                      showDialog(
                                          context: context,
                                          builder: (_) =>
                                              AlertDialog(
                                                title: Text('Error Occurred'),
                                                content: Text(
                                                    'Please Select a Customer'),
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
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),

                                                ],
                                              )
                                      );
                                    }
                                   else if(double.parse(discount.text)>double.parse(subTotal.text)&&double.parse(discount.text)!=null){
                                      showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: Text('Error Occurred'),
                                            content: Text("The discount amount cannot be more than the Sub total: ${subTotal.text}",
                                            ),
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
                                   else if(double.parse(discountprcntg.text)>100&&double.parse(discountprcntg.text)!=null){
                                      showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: Text('Error Occurred'),
                                            content: Text("The discount % cannot be more than 100",
                                            ),
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
                                        'CustomerID': cstmrz,
                                        'CustomerName': customerName.text,
                                        'DocDate': docdatee.text,
                                        'DueDate': duedatee.text,
                                        'WareHouseID': warehouseID,
                                        'WareHouseName': wareHouse.text,
                                        'SubTotal': subTotal.text,
                                        'PaymentTermID': paymentTermID,
                                        'PaymentTermName': paymentterm.text,
                                        'DiscountAmount': discount.text,
                                        'Discount_Percentage': discountprcntg
                                            .text,
                                        'Freight': shipping.text,
                                        'CustomerMessage': customerMsg.text,
                                        'Other': others.text,
                                        'Memo': memo.text,
                                        'TotalAmount': total.text,
                                        'BalanceAmount': total.text,
                                        'OrderDetail': orderList,
                                      };

                                      print("" + data.toString());
                                      final result = await addInvoice(data);

                                      print(result);
                                      // Center(
                                      //   child: FutureBuilder(
                                      //     future: addInvoice(data),
                                      //     builder: (context, snapshot) {
                                      //       if (snapshot.hasData) {
                                      //         return Text('snapshot.data');
                                      //       } else if (snapshot.hasError) {
                                      //         return Text("${snapshot.error}");
                                      //       }
                                      //       // By default, show a loading spinner
                                      //       return CircularProgressIndicator();
                                      //     },
                                      //   ),
                                      // );
                                      showDialog(
                                          context: context,
                                          builder: (_) =>
                                              AlertDialog(
                                                title: Text('Success'),
                                                content: Text(
                                                    'Invoice Created Successfully'),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    child: Text('Ok'),
                                                    onPressed: () {
                                                      Get.offAll(invoice(
                                                        email: email,
                                                        CompanyAuthToken: CompanyAuthToken,));
                                                    },
                                                  )
                                                ],
                                              )
                                      );
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
      initialDate: duedate ,
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
  Future<InvoiceModel> addInvoice(Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$CompanyAuthToken",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/Sales/invoice/Post"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));

      return InvoiceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Add Invoice.');
    }
  }
  Future<InvoiceModel> updateInvoice(int id,Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$CompanyAuthToken",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/Sales/invoice/Put"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return InvoiceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Update Invoice.');
    }
  }

  Future<List<InvoiceItemModel>> getItemLine() async {

    idItem=idx.id;
    print(idItem.toString());
    final String ApiUrl2 = "http://test.erp.gold/api/Sales/invoice/SA_TransactionLineBySA_TransID?id=$idItem";
    print(ApiUrl2);
    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      itemLineData = list;
    });
    return list.map((e) => InvoiceItemModel.fromJson(e)).toList();

  }

}




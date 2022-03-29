import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobmlt/Models/binLocationModel.dart';
import 'package:jobmlt/Models/docNumberSiteTransfer.dart';
import 'package:async/async.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:jobmlt/Models/imeiModel.dart';
import 'package:jobmlt/Models/itemModel.dart';
import 'package:jobmlt/Models/locationDataModel.dart';
import 'package:jobmlt/Models/warehouseModel.dart';
import 'package:jobmlt/Views/addImei.dart';
import 'package:jobmlt/Views/moreOptions.dart';
import 'package:table_calendar/table_calendar.dart';
class siteTransfer extends StatefulWidget {
  String email, CompanyAuthToken;
  var idx;

  siteTransfer(
      {Key? key, this.idx, required this.email, required this.CompanyAuthToken})
      : super(key: key);
  @override
  _siteTransferState createState() =>
      _siteTransferState(idx, email, CompanyAuthToken);
}

class _siteTransferState extends State<siteTransfer> {
  var idx;
  String email, CompanyAuthToken;
  bool get isEditing => idx != null;
  _siteTransferState(this.idx, this.email, this.CompanyAuthToken);

  TextEditingController wareHouseFrom = new TextEditingController();
  TextEditingController wareHouseTo = new TextEditingController();
  TextEditingController binLocFrom = new TextEditingController();
  TextEditingController binLocTo = new TextEditingController();
  TextEditingController docNumber = new TextEditingController();
  TextEditingController docdatee = new TextEditingController();
  TextEditingController refNumber = new TextEditingController();
  TextEditingController rate = new TextEditingController();




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
  List<TextEditingController> itemID = [];
  List<TextEditingController> blncQty = [];
  List<TextEditingController> serialNumbers = [];
  List<TextEditingController> qtyOnHand = [];
  List<TextEditingController> snmbrs = [];
  var docNum, warehouseFromID, binLocFromID, warehouseToID, binLocToID;
  double qty = 0.0;
  var itemnotfound=false;
  var qtyiszero=false;
  List imeiLists=[];
  var ItemName = '',
      qtynd,
      customerID,
      itemCode,
  itemid,
      itemCodeID,
      description,
      itemprice,
      itemtype,
      qtyonhand,
      itemunitcost,
      paymentTermID,
      companyID;
  String? Itemz, newItm;
  List<dynamic> itemssData = [];
  List<dynamic> itemsLocData = [];

  var doing = false;
  List wareHdata = [];
  List binData = [];
  List itemData = [];
  List itemLocationData = [];
  List<LocationData> itemLocationDataList = [];
  List<ItemModel> itemJson = [];
  List<WarehouseModel> warehouseResponse = [];
  List<BinLocationModel> binResponse = [];
  DateTime docdate = DateTime.now();
  DateTime? _selectedDay;
  var jsonRe='';
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  @override

  String getText() {
    if (docdate == null) {
      return 'Select Doc Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(docdate);

      // return '${date.month}/${date.day}/${date.year}';
    }
  }
  fetchData() async {
    return this._memoizer.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      warehouseResponse = await warehouse();
      docNum = docNumFetch();
      binResponse=await binLocation();
      itemJson = await itemResponse();
      qtyiszero=false;
      doing = true;
    });
  }
  void initState() {

    if (mounted) {

      if (isEditing == false) {

        docdatee.text = docdate.toString();



      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Site Transfer'),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: FutureBuilder(
                future: fetchData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (doing == true) {
                    return ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Doc Number',
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                            ),
                            controller: docNumber,
                          ),
                        ),
                        Row(

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
                        TextFormField(

                          controller: refNumber,

                          decoration: InputDecoration(
                            labelText: 'Reference Number',
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                          ),),
                        Builder(
                          builder: (context) {
                            if(itemssData.isEmpty||itemnotfound==true){
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: DropdownButtonFormField(

                                decoration: InputDecoration(
                                  errorText: warehouseFromID == null
                                      ? 'Field Required'
                                      : '',
                                  errorStyle: TextStyle(
                                      color: warehouseFromID == null
                                          ? Colors.red
                                          : Colors.black),
                                  //errorBorder:
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: warehouseFromID == null
                                            ? Colors.red
                                            : Colors.black),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  prefixIcon: Icon(Icons.subdirectory_arrow_left),
                                  labelText: "From WareHouse",
                                ),
                                items: wareHdata.map((item) {
                                  return new DropdownMenuItem(
                                    onTap: () {
                                      wareHouseFrom.text = item['WarehouseName'];
                                      print(wareHouseFrom.text);
                                    },
                                    child: new Text(
                                      item["WarehouseName"],
                                    ),
                                    value: item["ID"].toString(),
                                  );
                                }).toList(),
                                onChanged: (itm) {
                                  setState(() {
                                    warehouseFromID = itm as String?;

                                    print(warehouseFromID);
                                  });
                                },
                                value: warehouseFromID,
                              ),
                            );
                          }
                            else{
                              return Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'From WareHouse',
                                    prefixIcon: Icon(Icons.subdirectory_arrow_left),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                  ),
                                  controller: wareHouseFrom,
                                ),
                              );
                            }
                          }
                        ),
                        Builder(
                          builder: (context) {
                            if(itemssData.isEmpty||itemnotfound==true){
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  errorText: binLocFromID == null
                                      ? 'Field Required'
                                      : '',
                                  errorStyle: TextStyle(
                                      color: binLocFromID == null
                                          ? Colors.red
                                          : Colors.black),
                                  //errorBorder:
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: binLocFromID == null
                                            ? Colors.red
                                            : Colors.black),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  prefixIcon: Icon(Icons.subdirectory_arrow_left),
                                  labelText: "From BinLocation",
                                ),
                                items: binData.map((items) {
                                  return new DropdownMenuItem(
                                    onTap: () {
                                      binLocFrom.text = items['BinLocationName'];
                                      print(binLocFrom.text);
                                    },
                                    child: new Text(
                                      items['BinLocationName'],
                                    ),
                                    value: items["ID"].toString(),
                                  );
                                }).toList(),
                                onChanged: (itm) {
                                  setState(() {
                                    binLocFromID = itm as String?;

                                    print(binLocFromID);
                                  });
                                },
                                value: binLocFromID,
                              ),
                             );
                          }
                            else{
                              return Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'From BinLocation',
                                    prefixIcon: Icon(Icons.subdirectory_arrow_left),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                  ),
                                  controller: binLocFrom,
                                ),
                              );
                            }
                          }
                        ),
                          Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              errorText: warehouseToID == null
                                  ? 'Field Required'
                                  : '',
                              errorStyle: TextStyle(
                                  color: warehouseToID == null
                                      ? Colors.red
                                      : Colors.black),
                              //errorBorder:
                              errorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: warehouseToID == null
                                        ? Colors.red
                                        : Colors.black),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              prefixIcon: Icon(Icons.subdirectory_arrow_right),
                              labelText: "To WareHouse",
                            ),
                            items: wareHdata.map((item) {
                              return new DropdownMenuItem(
                                onTap: () {
                                  wareHouseTo.text = item['WarehouseName'];
                                  print(wareHouseTo.text);
                                },
                                child: new Text(
                                  item['WarehouseName'],
                                ),
                                value: item["ID"].toString(),
                              );
                            }).toList(),
                            onChanged: (itm) {
                              setState(() {
                                warehouseToID = itm as String?;

                                print(warehouseToID);
                              });
                            },
                            value: warehouseToID,
                          ),
                        ),
                  Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              errorText: binLocToID == null
                                  ? 'Field Required'
                                  : '',
                              errorStyle: TextStyle(
                                  color: binLocToID == null
                                      ? Colors.red
                                      : Colors.black),
                              //errorBorder:
                              errorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: binLocToID == null
                                        ? Colors.red
                                        : Colors.black),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              prefixIcon: Icon(Icons.subdirectory_arrow_right),
                              labelText: "To BinLocation",
                            ),
                            items: binData.map((item) {
                              return new DropdownMenuItem(
                                onTap: () {
                                  binLocTo.text = item['BinLocationName'];
                                  print(binLocTo.text);
                                },
                                child: new Text(
                                  item['BinLocationName'],
                                ),
                                value: item["ID"].toString(),
                              );
                            }).toList(),
                            onChanged: (itm) {
                              setState(() {
                                binLocToID = itm as String?;

                                print(binLocToID);
                              });
                            },
                            value: binLocToID,
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if(warehouseFromID!=null&&binLocFromID!=null){
                            return Padding(
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
                                  labelText: "Items",
                                ),
                                items: itemData.map((itms) {
                                  return new DropdownMenuItem(
                                    //var ItemName='',amount='',customerID=0,itemCode,itemCodeID,description,itemprice,itemtype,itemunitcost,linetotal;
                                    onTap: () {
                                      ItemName = itms["ItemName"];
                                      rate.text = itms["UnitPrice"].toString();
                                      qty = 0.0;
                                      itemid=itms['ID'].toString();
                                      itemCode = itms["ItemCode"];
                                      itemCodeID = itms["ID"];
                                      description = itms["ItemDescription"];
                                      itemunitcost = itms["UnitCost"];
                                      itemtype = itms["ItemType"];
                                      //qtyonhand=itms["Qty_OnHand"];
                                      itemLocationData=itms['Location'];
                                      qtyonhand='0';

                                      for(int i=0;i<itemLocationData.length;i++){
                                    if(itemLocationData[i]['WarehouseID'].toString()==warehouseFromID.toString() && itemLocationData[i]['BinLocationID'].toString() == binLocFromID.toString()){
                                    qtyonhand=itemLocationData[i]['Qty_OnHand'].toString();
                                    }


                                  }
                                      if(double.parse(qtyonhand)<=0)
                                      {
                                        qtyiszero=true;
                                      }

                                    },
                                    child: new Text(itms["ItemName"],
                                    ),
                                    value: itms["ID"].toString(),
                                  );
                                }).toList(),


                                value: Itemz,

                                onChanged: (itm) {
                                  setState(() {
                                    if(double.parse(qtyonhand)<=0)
                                    {
                                      qtyiszero=true;
                                       Fluttertoast.showToast(
                                          msg: "$ItemName not found in this Warehouse",
                                          toastLength: Toast.LENGTH_LONG,
                                           gravity: ToastGravity.CENTER,
                                          fontSize: 16,
                                          backgroundColor: Colors.red
                                      );
                                    }
                                    else{
                                      qtyiszero=false;
                                    }
                                  if(qtyiszero==false) {
                                    Map mapItem = {
                                      'ItemCode': itemCode,
                                      'ItemCodeID': itemCodeID,
                                      'ItemName': ItemName,
                                      'Description': description,
                                      'ItemPrice': rate.text,
                                      'ItemQuantity': qty.toString(),
                                      'ItemType': itemtype,
                                      'BalanceQuantity': qtynd,
                                      'ItemUnitCost': itemunitcost,
                                      'ID': itemid,
                                      'Qty_OnHand': qtyonhand,

                                    };
                                    itemssData.add(mapItem);

                                  }

                                    ic.add(new TextEditingController());
                                    icid.add(new TextEditingController());
                                    iN.add(new TextEditingController());
                                    des.add(new TextEditingController());
                                    rt.add(new TextEditingController());
                                    ityp.add(new TextEditingController());
                                    iuc.add(new TextEditingController());
                                    itemID.add(new TextEditingController());
                                    qtyOnHand.add(new TextEditingController());

                                    for(int i=0;i<itemssData.length;i++) {
                                      rt[i].text = itemssData[i]['ItemPrice'].toString();
                                      ic[i].text = itemssData[i]['ItemCode'].toString();
                                      icid[i].text = itemssData[i]['ItemCodeID'].toString();
                                      iN[i].text = itemssData[i]['ItemName'].toString();
                                      des[i].text = itemssData[i]['Description'].toString();
                                      ityp[i].text = itemssData[i]['ItemType'].toString();
                                      iuc[i].text = itemssData[i]['ItemUnitCost'].toString();
                                      itemID[i].text=itemssData[i]['ID'].toString();
                                      qtyOnHand[i].text=itemssData[i]['Qty_OnHand'].toString();
                                      print('for loop rann' );
                                    }
                                    print(itemssData);
                                  });
                                },
                              ),
                            );
                          }
                            else{
                              return Text('');
                            }
                          }
                        ),
                        Builder(
                            builder: (context) {

                              if (itemssData.isEmpty) {
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
                                            itemssData.removeAt(index);
                                            ic.remove(ic[index]);
                                            icid.remove(icid[index]);
                                            iN.remove(iN[index]);
                                            des.remove(des[index]);
                                            rt.remove(rt[index]);
                                            if(ityp[index].text=='20'){
                                              serialNumbers.remove(serialNumbers[index]);}
                                            ityp.remove(ityp[index]);
                                            iuc.remove(iuc[index]);
                                            qtyNeed.remove(qtyNeed[index]);
                                            amountTotal.remove(amountTotal[index]);
                                           for(int i=0;i<imeiLists.length;i++){

                                            imeiLists.remove(imeiLists[i]);}
                                           serialNumbers.remove(serialNumbers[index]);
                                            qtyOnHand.remove(qtyOnHand[index]);
                                            print(itemssData);

                                          });
                                        },
                                        child: Builder(
                                          builder: (context) {

                                            return Card(
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
                                                          Expanded(
                                                            child: TextFormField(
                                                              controller: iN[index],
                                                              readOnly: true,
                                                              decoration: InputDecoration(
                                                                labelText: 'Item Name',

                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: TextFormField(
                                                              controller: ic[index],
                                                              readOnly: true,
                                                              decoration: InputDecoration(
                                                                labelText: 'Item Code',

                                                              ),
                                                            ),
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
                                                              readOnly: true,
                                                              controller: qtyOnHand[index],

                                                              decoration: InputDecoration(
                                                                labelText: 'Available Quantity',

                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: TextFormField(

                                                              controller: qtyNeed[index],
                                                              keyboardType: TextInputType
                                                                  .number,

                                                              decoration: InputDecoration(
                                                                labelText: 'Transfer Quantity',

                                                              ),
                                                              autovalidateMode: AutovalidateMode.always,
                                                              validator: (value){

                                                                if(value == null || value.isEmpty || value=='0')
                                                                { return "Cannot be empty ";}
                                                                else if(double.parse(value)>double.parse(qtyOnHand[index].text)){
                                                                  return "Max Quantity";
                                                                }
                                                                else{
                                                                  return null;
                                                                }
                                                              },
                                                            ),
                                                          ),


                                                        ],
                                                      ),
                                                      Container(
                                                          child: Builder(
                                                              builder: (context) {

                                                                if(ityp[index].text=='20') {
                                                                  serialNumbers.add(new TextEditingController());
                                                                 // snmbrs.add(new TextEditingController());
                                                                  return InkWell(
                                                                      onTap:() async {

                                                                      },
                                                                      // imeiLists=

                                                                      child: Container(

                                                                        height: 80,
                                                                        child: TextFormField(onTap: () async {

                                                                          if(qtyNeed[index].text.isEmpty){
                                                                            qtyNeed[index].text='0';
                                                                          }
                                                                          //  imeiLists= serialNumbers[index].text as List;
                                                                          final result = await Get.to(addImei(
                                                                            email: email,
                                                                            CAT: CompanyAuthToken,
                                                                            id: itemID[index].text,
                                                                            imeiList: imeiLists,
                                                                          listLength: qtyNeed[index].text,
                                                                          warehouseid: warehouseFromID,
                                                                              BinLocationID: binLocFromID));
                                                                         // var imList=result.split(',').map((e) => e).toList();
                                                                          if(result!=''&&result!=null){

                                                                         imeiLists.add(result);}
                                                                          serialNumbers[index].text=imeiLists.join(",");

                                                                        },
                                                                          readOnly: true,
                                                                          controller: serialNumbers[index],
                                                                          maxLines: 2,
                                                                          decoration: InputDecoration(
                                                                            hintText: 'Add the Serial # Here (Separate with comma for multiple Serial #)',

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
                                            );



                                          }
                                        ),
                                      );
                                    });
                              }
                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: InkWell(
                            child: Center(
                              child: InkWell(
                                onTap: () async {
                  if (warehouseFromID==null||warehouseToID==null||binLocFromID==null||binLocToID==null) {
                    showDialog(
                        context: context,
                        builder: (_) =>
                            AlertDialog(
                              title: Text('Error Occurred'),
                              content: Text(
                                  "Please Select all required fields"),
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
                  // else if(itemssData.isEmpty){
                  //   showDialog(
                  //       context: context,
                  //       builder: (_) =>
                  //           AlertDialog(
                  //             title: Text('Error Occurred'),
                  //             content: Text(
                  //                 "Please Select at least one item"),
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
                  // else if(qtyNeed.isEmpty){
                  //   showDialog(
                  //       context: context,
                  //       builder: (_) =>
                  //           AlertDialog(
                  //             title: Text('Error Occurred'),
                  //             content: Text(
                  //                 "Please type the quantity"),
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
                  else {
                    for (int i = 0; i < itemssData.length; i++) {
                      blncQty.add(new TextEditingController());
                      blncQty[i].text = (double.parse(qtyOnHand[i].text) - double.parse(qtyNeed[i].text)).toString();
                      Map orderDetail = {
                        'ItemId': itemID[i].text,
                        'ItemCode': ic[i].text,
                        'ItemName': iN[i].text,
                        'IVTransactionLineID': null,
                        'Description': des[i].text.isEmpty ? iN[i].text : des[i].text,
                        'ItemQuantity': qtyNeed[i].text,
                        'BalanceQuantity': qtyOnHand[i].text,
                        'ItemType': ityp[i].text,
                        'ItemUnitCost': iuc[i].text,
                        'IMEI': ityp[i].text == '20' ? serialNumbers[i].text : null,
                      };
                      orderList.add(orderDetail);
                    }
                    Map order = {
                      'DocDate': docdatee.text,
                      'DocNumber': docNumber.text,
                      'ReferenceNumber': refNumber.text,
                      'WarehouseID_From': warehouseFromID.toString(),
                      'WarehouseID_To': warehouseToID.toString(),
                      'BinLocation_To': binLocToID.toString(),
                      'BinLocation_From': binLocFromID.toString(),
                      'IsJson': true,

                    };
                    Map data = {"order": order, "OrderDetail": orderList};
                    print("" + data.toString());
                    final result = await siteTransferPost(data);

                    showDialog(
                        context: context,
                        builder: (_) =>
                            AlertDialog(
                              //title: Text('Success'),
                              content: Text(
                                  '$jsonRe'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  }
                  },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[700],

                                      // borderSide: BorderSide(color: Colors.black),
                                      borderRadius:
                                      BorderRadius.circular(18.0)),
                                  height: 45,
                                  width: 180,
                                  child: Center(
                                    child: Text(
                                      'Save Data',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );

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

  Future docNumFetch() async {
    final String ApiUrl2 =
        "http://test.erp.gold/api/AdvanceInventory/sitetransfer/GetDocNumber";
    print(ApiUrl2);
    final Response2 = await http.get(Uri.parse(ApiUrl2),
        headers: {"token": "$CompanyAuthToken", "Username": "$email"});
    Map map = json.decode(Response2.body);
    setState(() {
      docNumber.text = map["DocNumber"];
    });
    return docNumber.text;
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
  Future pickDocDate(BuildContext context) async {
    final newDocDate = await showDatePicker(
      context: context,
      initialDate: docdate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDocDate != null )
      setState(() {
        docdatee.text = newDocDate.toString();
      });
  }
  Future<List<BinLocationModel>> binLocation() async {
    final String ApiUrl2 =
        "http://test.erp.gold/api/AdvanceInventory/BinLocation/GetList";

    final Response2 = await http.get(Uri.parse(ApiUrl2),
        headers: {"token": "$CompanyAuthToken", "Username": "$email"});
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      binData = list;
    });
    return list.map((e) => BinLocationModel.fromJson(e)).toList();
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
  Future siteTransferPost(Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$CompanyAuthToken",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/advanceinventory/sitetransfer/Post"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      if(jsonDecode(response.body)['success'].toString()=='0'){
 jsonRe="Error Occurred\n\n${jsonDecode(response.body)['error_msg']}";}
      else if(jsonDecode(response.body)['success'].toString()=='1')
      {
        jsonRe="Success \n\n${jsonDecode(response.body)['msg']}";

      }

     // return PurchaseOrderModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Add Invoice.');
    }
  }

  // Future<List<Map<String, dynamic>>> itemlocationResponse() async {
  //   final String ApiUrl2 = "http://test.erp.gold/api/advanceinventory/items/GetList";
  //
  //   final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
  //     "token": "$CompanyAuthToken",
  //     "Username": "$email"
  //   });
  //   Map<String, dynamic> map = json.decode(Response2.body);
  //   setState(() {
  //     itemLocationData =  map["Location"];
  //   });
  //   return List<Map<String, dynamic>>.from(json.decode(Response2.body)['Location']);
  // }
  // Future<List<LocationData>> itemlocationResponse() async {
  //   final String ApiUrl2 = "http://test.erp.gold/api/advanceinventory/items/GetList";
  //
  //   final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
  //     "token": "$CompanyAuthToken",
  //     "Username": "$email"
  //   });
  //   final list = json.decode(Response2.body)["Location"] as List<dynamic>;
  //   setState(() {
  //     itemLocationData = list;
  //   });
  //   return list.map((e) => LocationData.fromJson(e)).toList();
  // }
}

import 'dart:convert';
import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobmlt/Models/paymentTermModel.dart';
import 'package:http/http.dart' as http;
import 'package:jobmlt/Models/purchaseOrderModel.dart';
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
  var idItem = 0;
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
      poResponse = await POFetch();
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
                            labelText: "Receipt / Receipt & Bill",
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
                            labelText: "Purchase Order",
                          ),

                          items: POFet.map((itms) {
                            return new DropdownMenuItem(
                              onTap: () {
                                PONumber.text = itms["TransactionNumber"];
                                print(PONumber.text);
                              },
                              child: new Text(itms["TransactionNumber"],
                              ),
                              value: itms["ID"].toString(),
                            );
                          }).toList(),
                          onChanged: (itm) {
                            setState(() {
                              Po = itm as String?;

                              print(Po);
                            });
                          },
                          value: Po,

                        ),
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
    final String ApiUrl2 = "http://test.erp.gold/api/Purchase/purchaseorder/GetPurchaseOrderList";

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

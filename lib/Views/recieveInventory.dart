import 'package:flutter/material.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

import 'package:jobmlt/Models/invoiceModel.dart';
import 'package:jobmlt/Models/recieveInventoryModel.dart';
import 'package:jobmlt/Views/invoiceUpdate.dart';
import 'package:jobmlt/Views/receiveInventoryUpdate.dart';



class recieveInventory extends StatefulWidget {

  String email,CompanyAuthToken;
  recieveInventory({Key? key, required this.email, required this.CompanyAuthToken}) : super(key: key);
  @override
  recieveInventoryState createState() => recieveInventoryState(email,CompanyAuthToken);

}
class recieveInventoryState extends State<recieveInventory> {
  String email, CompanyAuthToken;

  recieveInventoryState(this.email, this.CompanyAuthToken);

  List<RecieveInventoryModel> _apiResponse = [];
  List<RecieveInventoryModel> ulist=[];
  TextEditingController search=new TextEditingController();
  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    _apiResponse = await ReadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Receive Inventory'),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],

          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9)
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                          controller: search,
                          //                       onChanged: (text){
                          // if(text.isEmpty){
                          // setState(() {
                          // _apiResponse = ulist;
                          // });
                          // }
                          // else{
                          // final List<InvoiceModel> filteredBreeds = [];
                          // ulist.map((InvoiceModel){
                          // if(InvoiceModel.contains(text.toString().toUpperCase())){
                          // filteredBreeds.add(InvoiceModel);
                          // }
                          // }).toList();
                          // setState(() {
                          // ulist = _apiResponse;
                          // });
                          // }
                          // }



                          //},
                        ),
                      ),
                      Container(

                        child: IconButton(onPressed: (){
                          Get.to(receiveInventoryUpdate(
                            email: email, CompanyAuthToken: CompanyAuthToken,));
                        }, icon: Icon(Icons.add_rounded )),
                      )
                    ],
                  ),
                ),

              ),


              Expanded(
                child: FutureBuilder(
                  future: ReadJsonData(),
                  builder: (context, data) {

                      if (data.hasError) {
                      return Center(child: Text("${data.error}"));
                    }
                    else if (data.hasData) {
                        if(data.data.isBlank==true){
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Text('Sorry you do not have any Receive Inventory',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic
                                ),))
                              ],
                            ),
                          );
                        }else {
                          var items = data.data as List<RecieveInventoryModel>;
                          return ListView.builder(

                              itemCount: items == null ? 0 : items.length,
                              itemBuilder: (context, index) {
                                return Card(

                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                    borderRadius: BorderRadius.circular(10),),
                                  elevation: 5,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: ExpansionTile(
                                    title: Center(
                                      child: Text(
                                        '${items[index].vendorName.toString()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),),

                                    ),
                                    subtitle: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'TXN #: ${items[index].txnNumber
                                              .toString()}',
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 15,
                                          ),),
                                      ),
                                    ),
                                    controlAffinity: ListTileControlAffinity
                                        .platform,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [

                                            Expanded(
                                                child: GestureDetector(
                                                  onTap: () {

                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 8),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              left: 8,
                                                              right: 8),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Text(
                                                                items[index]
                                                                    .vendorName
                                                                    .toString(),

                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight
                                                                        .bold),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left: 20,
                                                                    right: 8),
                                                                child: Text(
                                                                  'PO #: ${items[index].poNumber
                                                                      .toString()}',

                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              left: 8,
                                                              right: 8,
                                                              top: 10),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Text(

                                                                'Doc Date: ${DateFormat(
                                                                    'dd-MM-yyyy')
                                                                    .format(
                                                                    DateTime.parse(
                                                                        items[index]
                                                                            .dateTimeCreated
                                                                            .toString()))
                                                                    .toString()}',

                                                              ),
                                                              Text(

                                                                'Due Date: ${DateFormat(
                                                                    'dd-MM-yyyy')
                                                                    .format(
                                                                    DateTime.parse(
                                                                        items[index]
                                                                            .dueDate
                                                                            .toString()))
                                                                    .toString()}',

                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              left: 8,
                                                              right: 8,
                                                              top: 20),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [

                                                              Text(
                                                                'Total Amount: ${items[index]
                                                                    .totalAmount
                                                                    .toString()}',
                                                                style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .green,
                                                                ),

                                                              ),
                                                              IconButton(
                                                                  onPressed: () {
                                                                    var idx = items[index];
                                                                    Get.to(
                                                                        receiveInventoryUpdate(
                                                                          email: email,
                                                                          CompanyAuthToken: CompanyAuthToken,
                                                                          idx: idx,));
                                                                  },
                                                                  icon: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios_outlined)),
                                                            ],
                                                          ),

                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              left: 8,
                                                              right: 8,
                                                              top: 10),
                                                          child: Text(
                                                            'Amount Due: ${items[index]
                                                                .amountDue
                                                                .toString()}',
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors.red,
                                                            ),

                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }}
                    else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                  },
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Future<List<RecieveInventoryModel>> ReadJsonData() async {
    final String ApiUrl2 = "http://test.erp.gold/api/Purchase/receivingtransaction/GetList";

    final Response2 = await http.post(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    print(Response2);
    return list.map((e) => RecieveInventoryModel.fromJson(e)).toList();
  }
}

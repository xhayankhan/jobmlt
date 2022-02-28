
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

import 'package:jobmlt/Models/itemModel.dart';
import 'package:jobmlt/Views/createItemPage.dart';
import 'package:jobmlt/Views/serialNumberPage.dart';



class items extends StatefulWidget {

  String email,CompanyAuthToken;
  items({Key? key, required this.email, required this.CompanyAuthToken}) : super(key: key);
  @override
  itemsState createState() => itemsState(email,CompanyAuthToken);

}
class itemsState extends State<items> {
  String email, CompanyAuthToken;

  itemsState(this.email, this.CompanyAuthToken);

  List<ItemModel> _apiResponse = [];

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

      body: SafeArea(
        child: Container(

          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){Get.to(createItem());
                    }, icon: Icon(Icons.add))
                  ],
                ),

              ),


              Expanded(
                child: FutureBuilder(
                  future: ReadJsonData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(child: Text("${data.error}"));
                    } else if (data.hasData) {
                      var items = data.data as List<ItemModel>;
                      return ListView.builder(

                          itemCount: items == null ? 0 : items.length,
                          itemBuilder: (context, index)
                          {
                            return Card(
                              elevation: 5,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Expanded(
                                        child: GestureDetector(
                                          onTap: () {

                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(bottom: 8),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8, right: 8),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        items[index].itemName.toString(),

                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight
                                                                .bold),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8, right: 8,top: 10),
                                                  child: Text(

                                                    'Item Code: ${items[index].itemCode.toString()}',

                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8, right: 8,top: 20),
                                                  child: Text(
                                                    'Unit Price: ${items[index].unitPrice.toString()}',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.green,
                                                    ),

                                                  ),

                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8, right: 8,top: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        'Quantity on Hand: ${items[index].qtyOnHand.toString()}',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.red,
                                                        ),

                                                      ),
                                                      Container(
                                                          child: Builder(
                                                              builder: (context) {

                                                            if(items[index].itemType=='20') {
                                                              return InkWell(
                                                                onTap:(){
                                                                  var name=items[index].itemName.toString();
                                                                  var id=items[index].id.toString();
                                                                  Get.to(serialPage(name:name,id:id,email: email,CAT: CompanyAuthToken,));},
                                                                  child: Container(
                                                                    height: 40,
                                                                    width: 100,
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

                                              ],
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },);

                    } else {
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

  Future<List<ItemModel>> ReadJsonData() async {
    final String ApiUrl2 = "http://test.erp.gold/api/advanceinventory/items/GetList";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;

    return list.map((e) => ItemModel.fromJson(e)).toList();
  }
}
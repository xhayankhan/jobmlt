import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:jobmlt/Views/addCustomerPage.dart';
import 'package:jobmlt/Api%20Services/api_service.dart';
import 'package:jobmlt/Views/loginPage.dart';
import 'package:jobmlt/Models/loginModel.dart';
import 'dart:async';
import 'dart:convert';
import '../Models/customer.dart';
import 'customerDetail.dart';


class newPage extends StatefulWidget {

  String email,CompanyAuthToken;
  newPage({Key? key, required this.email, required this.CompanyAuthToken}) : super(key: key);
  @override
  newPageState createState() => newPageState(email,CompanyAuthToken);

}
class newPageState extends State<newPage> {
  String email, CompanyAuthToken;

  newPageState(this.email, this.CompanyAuthToken);

  List<CustomerModel> apiResponse = [];

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    apiResponse = await ReadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Customers'),
        centerTitle: true,

      ),
      body: SafeArea(

        child: Container(
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
                        child: TextField(
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
                        ),
                      ),
                      Container(

                        child: IconButton(onPressed: (){
                          Get.to(Customer(
                            email: email, companyAuthToken: CompanyAuthToken,));
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
                    } else if (data.hasData) {
                      var items = data.data as List<CustomerModel>;
                      return ListView.builder(

                          itemCount: items == null ? 0 : items.length,
                          itemBuilder: (context, index) {
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
                                            var i = items[index];
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        Customer(
                                                          i: i,
                                                          companyAuthToken: CompanyAuthToken,
                                                          email: email,)));
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
                                                      left: 8, right: 8,top: 10),
                                                  child: Text(
                                                    'Name: ${items[index].customerName}'
                                                        .toString(),

                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:  EdgeInsets.only(
                                                      left: 8, right: 8, top: 10),
                                                  child: Text('Opening Balance: ${items[index]
                                                      .openingBalance
                                                      .toString()}'),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8, right: 8, top: 10),
                                                  child: Text('Open Balance: ${items[index]
                                                      .openBalance
                                                      .toString()}'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          });
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

  Future<List<CustomerModel>> ReadJsonData() async {
    final String ApiUrl2 = "http://test.erp.gold/api/Sales/customer/GetCustomerListwithBalance";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CompanyAuthToken",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;

    return list.map((e) => CustomerModel.fromJson(e)).toList();
  }


}
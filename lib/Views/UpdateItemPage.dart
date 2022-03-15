import 'package:flutter/material.dart';


class UpdateItemPage extends StatefulWidget {
  String email, CompanyAuthToken;
  var idx;

  UpdateItemPage(
      {Key? key, this.idx, required this.email, required this.CompanyAuthToken})
      : super(key: key);
  @override
  _UpdateItemPageState createState() =>
      _UpdateItemPageState(idx, email, CompanyAuthToken);
}

class _UpdateItemPageState extends State<UpdateItemPage> {

  var idx;
  String email, CompanyAuthToken;
  bool get isEditing => idx != null;
  _UpdateItemPageState(this.idx, this.email, this.CompanyAuthToken);
  List itemTypList=[];
  List itemCatList=[];
  TextEditingController itemTypController=new TextEditingController();
  TextEditingController itemCatController=new TextEditingController();
  var itemCat,itemType;
 var doing =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(

            ),
            child: FutureBuilder(
               // future: _fetchCustomerName(),
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
                              errorText: itemCat == null
                                  ? 'Field Required'
                                  : '',
                              errorStyle: TextStyle(
                                  color: itemCat == null ? Colors.red : Colors
                                      .black
                              ),
                              //errorBorder:
                              errorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: itemCat == null
                                        ? Colors.red
                                        : Colors.black),
                              ),

                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              labelText: "Item Category",
                            ),

                            items: itemCatList.map((itms) {
                              return new DropdownMenuItem(
                                onTap: () {
                                  itemCatController.text = itms["CustomerName"];
                                  print(itemCatController);
                                },
                                child: new Text(itms["CustomerName"],
                                ),
                                value: itms["ID"].toString(),
                              );
                            }).toList(),
                            onChanged: (itm) {
                              setState(() {
                                itemCat = itm as String?;

                                print(itemCat);
                              });
                            },
                            value: itemCat,

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),


                          child: DropdownButtonFormField(

                            decoration: InputDecoration(
                              errorText: itemType == null
                                  ? 'Field Required'
                                  : '',
                              errorStyle: TextStyle(
                                  color: itemType == null ? Colors.red : Colors
                                      .black
                              ),
                              //errorBorder:
                              errorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: itemType == null
                                        ? Colors.red
                                        : Colors.black),
                              ),

                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              labelText: "Item Type",
                            ),

                            items: itemTypList.map((itms) {
                              return new DropdownMenuItem(
                                onTap: () {
                                  itemTypController.text = itms["CustomerName"];
                                  print(itemTypController);
                                },
                                child: new Text(itms["CustomerName"],
                                ),
                                value: itms["ID"].toString(),
                              );
                            }).toList(),
                            onChanged: (itm) {
                              setState(() {
                                itemType = itm as String?;

                                print(itemType);
                              });
                            },
                            value: itemType,

                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: Center(

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
}

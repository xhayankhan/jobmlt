import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobmlt/Models/makeModel.dart';
import 'package:jobmlt/Models/serialNumberModel.dart';
import 'package:http/http.dart' as http;
import 'package:jobmlt/Views/itemsPage.dart';
import 'package:jobmlt/Views/makeBrandModelList.dart';




class makeBrandCreate extends StatefulWidget {
  String id,makeName,brandName,email,CAT;
  makeBrandCreate({Key? key, required this.id,required this.makeName,required this.email,required this.CAT,required this.brandName}) : super(key: key);
  @override
  _makeBrandCreateState createState() => _makeBrandCreateState(id,makeName,email,CAT,brandName);
}

class _makeBrandCreateState extends State<makeBrandCreate> {
  String id,makeName,brandName,email,CAT;
  _makeBrandCreateState(this.id, this.makeName,this.email,this.CAT,this.brandName);
  List<MakeModel> _apiResponse = [];
  var valNeeded='';
 TextEditingController make=new TextEditingController();
  TextEditingController brand=new TextEditingController();
  TextEditingController model=new TextEditingController();
  TextEditingController color=new TextEditingController();
  TextEditingController capacity=new TextEditingController();
  TextEditingController condition=new TextEditingController();
  TextEditingController carrier=new TextEditingController();
  @override
  void initState() {
    //_fetchNotes();
    super.initState();
    if(brandName.isNotEmpty) {
      brand.text = brandName.toString();}
  }

  // _fetchNotes() async {
  //   _apiResponse = await makeFetch();
  //   print(id);
  //   print(_apiResponse.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(

            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width*0.7,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 5),
                    child: Text('Add ${id}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),),
                  ),),
                Container(
                  child: Builder(
                      builder: (context) {
                        if(id=='Make') {
                          return Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Make'
                                  ),
                                  controller: make,
                                ),
                              )
                            ],
                          );
                        }
                        else if(id=='Brand'){
                          if(makeName.isNotEmpty) {
                            make.text = makeName.toString();}
                          return Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(

                                    readOnly: true,
                                    onTap: () async {
                                      final result = await Get.to(makeBrandList(
                                        email: email,
                                        CAT: CAT,
                                        id: 'Make',
                                        filteredBy: '',
                                        svalue: '',
                                      ));

                                      setState(() {
                                        print(result);
                                        make.text = result;

                                      });
                                    },
                                    controller: make,
                        decoration: InputDecoration(
                        labelText: "Make",
                        ),



                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Brand'
                                    ),
                                    controller: brand,
                                  ),
                                )
                              ],
                            );

                        }
                        else if(id=='Model'){
                          if(makeName.isNotEmpty) {
                            make.text = makeName.toString();}

                          return Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () async {
                                    final result = await Get.to(makeBrandList(
                                      email: email,
                                      CAT: CAT,
                                      id: 'Make',
                                      filteredBy: '',
                                      svalue: '',
                                    ));

                                    setState(() {
                                      print(result);
                                      make.text = result;

                                    });
                                  },
                                  controller: make,
                                  decoration: InputDecoration(
                                    labelText: 'Make',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () async {
                                    final result = await Get.to(makeBrandList(
                                      email: email,
                                      CAT: CAT,
                                      id: 'Brand',
                                      filteredBy: 'BRAND',
                                      svalue: make.text,
                                    ));

                                    setState(() {
                                      print(result);
                                      brand.text = result;
                                      model.text = '';
                                    });
                                  },
                                  controller: brand,
                                  decoration: InputDecoration(
                                    labelText: 'Brand',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Model'
                                  ),
                                  controller: model,
                                ),
                              )
                            ],
                          );
                        }
                        else if(id=='Color'){
                          return Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Color'
                                  ),
                                  controller: color,
                                ),
                              )
                            ],
                          );
                        }
                        else if(id=='Capacity'){
                          return Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Capacity'
                                  ),
                                  controller: capacity,
                                ),
                              )
                            ],
                          );
                        }
                        else if(id=='Carrier'){
                          return Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Carrier'
                                  ),
                                  controller: carrier,
                                ),
                              )
                            ],
                          );
                        }

                        else if(id=='Condition'){
                          return Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Condition'
                                  ),
                                  controller: condition,
                                ),
                              )
                            ],
                          );
                        }
                        else{
                          return Text('');
                        }
                      }
                  ),
                ),


                Expanded(child: Divider(height: 10,)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: (){  Navigator.pop(context,
                                '');},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Close',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: () async{
                              if(id=='Make'){

                              Map data = {
                                "sLogicalTableName": 'Make',
                                "sMake_Name": "",
                                "sBrand_Name": "",
                                "sName": make.text,
                                "sActionSource": "Create",
                              };


                              print("" + data.toString());
                              final result = await makeCreate(data);
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      AlertDialog(
                                        title: Text('Success'),
                                        content: Text(
                                            'Attribute Added Successfully'),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            child: Text('Ok'),
                                            onPressed: () {
                                              Navigator.pop(context,
                                                  '');
                                            },
                                          )
                                        ],
                                      ));
                            }
                              else if(id=='Brand'){

                                if (make.text.isEmpty || make.text=='') {
                                  showDialog(
                                      context: context,
                                      builder: (_) =>
                                          AlertDialog(
                                            title: Text('Error Occurred'),
                                            content: Text(
                                                "Please Select Make "),
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
                                else{
                                Map data = {
                                  "sLogicalTableName": 'Brand',
                                  "sMake_Name": make.text,
                                  "sBrand_Name": "",
                                  "sName": brand.text,
                                  "sActionSource": "Create",
                                };


                                print("" + data.toString());
                                final result = await makeCreate(data);
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Success'),
                                          content: Text(
                                              'Attribute Added Successfully'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.pop(context,
                                                    '');
                                              },
                                            )
                                          ],
                                        )
                                );


                                }}
                              else if(id=='Model'){

                                if (make.text.isEmpty || make.text==''||brand.text.isEmpty || brand.text=='') {
                                  showDialog(
                                      context: context,
                                      builder: (_) =>
                                          AlertDialog(
                                            title: Text('Error Occurred'),
                                            content: Text(
                                                "Please Select Make and Brand "),
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
                                else {
                                  Map data = {
                                    "sLogicalTableName": 'Model',
                                    "sMake_Name": make.text,
                                    "sBrand_Name": brand.text,
                                    "sName": model.text,
                                    "sActionSource": "Create",
                                  };


                                  print("" + data.toString());
                                  final result = await makeCreate(data);
                                  showDialog(
                                      context: context,
                                      builder: (_) =>
                                          AlertDialog(
                                            title: Text('Success'),
                                            content: Text(
                                                'Attribute Added Successfully'),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: Text('Ok'),
                                                onPressed: () {
                                                  Navigator.pop(context,
                                                      '');
                                                },
                                              )
                                            ],
                                          )
                                  );
                                } }
                             else if(id=='Color'){
                                Map data = {
                                  "sLogicalTableName": 'Color',
                                  "sMake_Name": "",
                                  "sBrand_Name": "",
                                  "sName": color.text,
                                  "sActionSource": "Create",
                                };


                                print("" + data.toString());
                                final result = await makeCreate(data);
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Success'),
                                          content: Text(
                                              'Attribute Added Successfully'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.pop(context,
                                                    '');
                                              },
                                            )
                                          ],
                                        )
                                );

                              }
                              else if(id=='Carrier'){
                                Map data = {
                                  "sLogicalTableName": 'Carrier',
                                  "sMake_Name": "",
                                  "sBrand_Name": "",
                                  "sName": carrier.text,
                                  "sActionSource": "Create",
                                };


                                print("" + data.toString());
                                final result = await makeCreate(data);
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Success'),
                                          content: Text(
                                              'Attribute Added Successfully'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.pop(context,
                                                    '');
                                              },
                                            )
                                          ],
                                        )
                                );

                              }
                              else if(id=='Condition'){
                                Map data = {
                                  "sLogicalTableName": 'Condition',
                                  "sMake_Name": "",
                                  "sBrand_Name": "",
                                  "sName": condition.text,
                                  "sActionSource": "Create",
                                };


                                print("" + data.toString());
                                final result = await makeCreate(data);
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Success'),
                                          content: Text(
                                              'Attribute Added Successfully'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.pop(context,
                                                    '');
                                              },
                                            )
                                          ],
                                        )
                                );


                              }
                              else if(id=='Capacity'){
                                Map data = {
                                  "sLogicalTableName": 'Capacity',
                                  "sMake_Name": "",
                                  "sBrand_Name": "",
                                  "sName": capacity.text,
                                  "sActionSource": "Create",
                                };


                                print("" + data.toString());
                                final result = await makeCreate(data);
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('Success'),
                                          content: Text(
                                              'Attribute Added Successfully'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.pop(context,
                                                    '');
                                              },
                                            )
                                          ],
                                        )
                                );


                              }



                              },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.blue
                                ),
                                child: Center(
                                  child: Text(
                                    'Create',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),

        ),
      ),
    );
  }
  Future<MakeModel> makeCreate(Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$CAT",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/general/PostAttribute"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return MakeModel.fromJson(jsonDecode(response.body));
    }

    else
    {
      throw Exception('Failed to Update Invoice.');
    }
  }

}

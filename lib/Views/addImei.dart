import 'dart:convert';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:jobmlt/Models/imeiModel.dart';
import 'dart:async';
import 'dart:developer';
import 'package:async/async.dart';
class addImei extends StatefulWidget {

  String id,email,CAT,listLength,warehouseid,BinLocationID;
  List imeiList=[];
   addImei({Key? key,required this.id,required this.email,required this.CAT,required this.imeiList,required this.listLength,required this.warehouseid,required this.BinLocationID}) : super(key: key);

  @override
  _addImeiState createState() => _addImeiState(id,email,CAT,imeiList,listLength,warehouseid,BinLocationID);
}

class _addImeiState extends State<addImei> {

  String id,email,CAT,listLength,warehouseid,BinLocationID;
  List imeiList=[];
  _addImeiState(this.id,this.email,this.CAT,this.imeiList,this.listLength,this.warehouseid,this.BinLocationID);


  TextEditingController imei=new TextEditingController();
  List imeiData=[];
  List itemssData=[];
  List <Imeidata> imeiJson=[];
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  var done = false;

  var listCom=false;
List imeis=[];


@override
    _fetchImei() async{
  return this._memoizer.runOnce(() async {
    await Future.delayed(Duration(seconds: 2));
    imeiJson = await imeiListResponse();

  for (int i = 0; i < imeiData.length; i++) {
    if(imeiData[i]['WarehouseID'].toString()==warehouseid.toString()&&imeiData[i]['BinLocationID'].toString()==BinLocationID.toString())
      {
        print('this page ${imeiData[i]['BinLocationID'].toString()}');
        print('from page ${BinLocationID.toString()}');
        Map mapItem = {
          'sIMEI': imeiData[i]['sIMEI'],
        };
        itemssData.add(mapItem);
        imeis.add(imeiData[i]['sIMEI'].toString());
      }
  }
  print(itemssData);
  if(imeiList.length>=double.parse(listLength)){
    listCom=true;
  }
print(imeis);
done=true;
  });}

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
                //shrinkWrap: true,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 5),
                    child: Text('Add Serial Numbers',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),),
                  ),),
                FutureBuilder(

                    future: _fetchImei(),
                    builder: (context,data) {
                      if (data.hasError) {
                        return Center(child: Text("${data.error}"));
                      } else if (done == true) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: imeiList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(child: Text('${imeiList[index]}',style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),)),
                                          Container(child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                imeiList.removeAt(index);
                                                //imeiList.remove(imeiList[index]);
                                              });
                                            },
                                            icon: Icon(Icons.clear),
                                          ))
                                        ],
                                      ),
                                    ),

                                  ],
                              );
                            }

                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                ),
                Builder(
                  builder: (context) {
                    if(done==true&&listCom==false) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'IMEI',
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                            ),
                            controller: imei,
                          ),
                        ),
                      );
                    }
                    else if(listCom==true){
                      return Text('IMEIs are equal to the Transfer Quantity');
                    }
                    else{
                      return (Text(''));
                    }

                  }
                ),

                Expanded(child: Divider(height: 10,)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: InkWell(
                        onTap: (){Navigator.pop(context,
                            );},
                        child: Center(
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
                      Expanded(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: InkWell(
                            onTap: (){
                              //var myListFiltered = imeis.where((e) => e == imei.text);
                              var myListFiltered = imeis.contains(imei.text);
                              var checksame=imeiList.contains(imei.text);
                              if (myListFiltered==true && checksame==false) {
                                Navigator.pop(context,
                                    imei.text);
                              } else if(myListFiltered==false){
                                Get.snackbar(
                                    'IMEI not found',
                                    '',
                                    icon: Icon(
                                        Icons.person, color: Colors.white),
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2)

                                );
                              }
                              else if(checksame==true){
                                Get.snackbar(
                                    'IMEI already exists in the list',
                                    '',
                                    icon: Icon(
                                        Icons.person, color: Colors.white),
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2)

                                );
                              }

                              print(checksame);





                              },
                            child: Center(
                              child: Text(
                                'Save',
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
                  ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<List<Imeidata>> imeiListResponse() async {
    final String ApiUrl2 = "http://test.erp.gold/api/general/GET_IMEI?itemid=$id";
print(ApiUrl2);
    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CAT",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      imeiData = list;
    });
    return list.map((e) => Imeidata.fromJson(e)).toList();
  }
}

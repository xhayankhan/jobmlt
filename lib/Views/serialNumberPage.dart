import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobmlt/Models/serialNumberModel.dart';
import 'package:http/http.dart' as http;
import 'package:jobmlt/Views/itemsPage.dart';




class serialPage extends StatefulWidget {
  String id,name,email,CAT;
  serialPage({Key? key, required this.id,required this.name,required this.email,required this.CAT}) : super(key: key);
  @override
  _serialPageState createState() => _serialPageState(id,name,email,CAT);
}

class _serialPageState extends State<serialPage> {
  String id,name,email,CAT;
  _serialPageState(this.id, this.name,this.email,this.CAT);
  List<SerialNumberModel> _apiResponse = [];
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0,bottom: 5),
                        child: Text('$name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20,
                          ),),
                      ),),
                  Container(
                        child: Column(

                          children: [
                            FutureBuilder(
                              future: ReadJsonData(),
                              builder: (context, data) {
                                if (data.hasError) {
                                  return Center(child: Text("${data.error}"));
                                } else if (data.hasData) {
                                  var items = data.data as List<SerialNumberModel>;
                                  return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemCount: items == null ? 0 : items.length,
                                      itemBuilder: (context, index)
                                      {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Column(

                                              children: [
                                                Text('${items[index].sImei}',
                                                  style: TextStyle(

                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  ),),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                  );

                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),


                  Expanded(child: Divider(height: 10,)),
                  Center(
                    child: InkWell(
                      onTap: (){Get.back();},
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
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
  Future<List<SerialNumberModel>> ReadJsonData() async {
    final String ApiUrl2 = "http://test.erp.gold/api/general/GET_IMEI?itemid=$id";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CAT",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;

    return list.map((e) => SerialNumberModel.fromJson(e)).toList();
  }
}

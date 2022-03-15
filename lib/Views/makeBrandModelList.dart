import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobmlt/Models/makeModel.dart';
import 'package:jobmlt/Models/serialNumberModel.dart';
import 'package:http/http.dart' as http;
import 'package:jobmlt/Views/itemsPage.dart';




class makeBrandList extends StatefulWidget {
  String id,filteredBy,svalue,email,CAT;
  makeBrandList({Key? key, required this.id,required this.filteredBy,required this.email,required this.CAT,required this.svalue}) : super(key: key);
  @override
  _makeBrandListState createState() => _makeBrandListState(id,filteredBy,email,CAT,svalue);
}

class _makeBrandListState extends State<makeBrandList> {
  String id,filteredBy,svalue,email,CAT;
  _makeBrandListState(this.id, this.filteredBy,this.email,this.CAT,this.svalue);
  List<MakeModel> _apiResponse = [];
  var valNeeded='';
  @override
  void initState() {
    //_fetchNotes();
    super.initState();

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
                        child: Text('',
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
                                FutureBuilder(
                                  future: makeFetch(),
                                  builder: (context, data) {
                                    if (data.hasError) {
                                      return Center(
                                          child: Text("${data.error}"));
                                    } else if (data.hasData) {
                                      var items = data.data as List<MakeModel>;
                                      return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemCount: items == null ? 0 : items
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Column(

                                                children: [
                                                  InkWell(

                                                    child: Text(
                                                      '${items[index].text}',
                                                      style: TextStyle(

                                                        color: Colors.black,
                                                        fontSize: 20,
                                                      ),),
                                                    onTap: () {
                                                      Navigator.pop(context,
                                                          items[index].text);
                                                    },
                                                  ),
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
                            );
                          }
                          else if(id=='Brand'){
                            return Column(

                              children: [
                                FutureBuilder(
                                  future: brandFetch(),
                                  builder: (context, data) {
                                    if (data.hasError) {
                                      return Center(
                                          child: Text("${data.error}"));
                                    } else if (data.hasData) {
                                      var items = data.data as List<MakeModel>;
                                      return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemCount: items == null ? 0 : items
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Column(

                                                children: [
                                                  InkWell(

                                                    child: Text(
                                                      '${items[index].text}',
                                                      style: TextStyle(

                                                        color: Colors.black,
                                                        fontSize: 20,
                                                      ),),
                                                    onTap: () {
                                                      Navigator.pop(context,
                                                          items[index].text);
                                                    },
                                                  ),
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
                            );
                          }
                          else if(id=='Model'){
                            return Column(

                              children: [
                                FutureBuilder(
                                  future: modelFetch(),
                                  builder: (context, data) {
                                    if (data.hasError) {
                                      return Center(
                                          child: Text("${data.error}"));
                                    } else if (data.hasData) {
                                      var items = data.data as List<MakeModel>;
                                      return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemCount: items == null ? 0 : items
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Column(

                                                children: [
                                                  InkWell(

                                                    child: Text(
                                                      '${items[index].text}',
                                                      style: TextStyle(

                                                        color: Colors.black,
                                                        fontSize: 20,
                                                      ),),
                                                    onTap: () {
                                                      Navigator.pop(context,
                                                          items[index].text);
                                                    },
                                                  ),
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
                            );
                          }
                          else if(id=='Color'){
                            return Column(

                              children: [
                                FutureBuilder(
                                  future: colorFetch(),
                                  builder: (context, data) {
                                    if (data.hasError) {
                                      return Center(
                                          child: Text("${data.error}"));
                                    } else if (data.hasData) {
                                      var items = data.data as List<MakeModel>;
                                      return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemCount: items == null ? 0 : items
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Column(

                                                children: [
                                                  InkWell(

                                                    child: Text(
                                                      '${items[index].text}',
                                                      style: TextStyle(

                                                        color: Colors.black,
                                                        fontSize: 20,
                                                      ),),
                                                    onTap: () {
                                                      Navigator.pop(context,
                                                          items[index].text);
                                                    },
                                                  ),
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
                            );
                          }
                          else if(id=='Capacity'){
                            return Column(

                              children: [
                                FutureBuilder(
                                  future: capacityFetch(),
                                  builder: (context, data) {
                                    if (data.hasError) {
                                      return Center(
                                          child: Text("${data.error}"));
                                    } else if (data.hasData) {
                                      var items = data.data as List<MakeModel>;
                                      return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemCount: items == null ? 0 : items
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Column(

                                                children: [
                                                  InkWell(

                                                    child: Text(
                                                      '${items[index].text}',
                                                      style: TextStyle(

                                                        color: Colors.black,
                                                        fontSize: 20,
                                                      ),),
                                                    onTap: () {
                                                      Navigator.pop(context,
                                                          items[index].text);
                                                    },
                                                  ),
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
                            );
                          }
                          else if(id=='Carrier'){
                            return Column(

                              children: [
                                FutureBuilder(
                                  future: carrierFetch(),
                                  builder: (context, data) {
                                    if (data.hasError) {
                                      return Center(
                                          child: Text("${data.error}"));
                                    } else if (data.hasData) {
                                      var items = data.data as List<MakeModel>;
                                      return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemCount: items == null ? 0 : items
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Column(

                                                children: [
                                                  InkWell(

                                                    child: Text(
                                                      '${items[index].text}',
                                                      style: TextStyle(

                                                        color: Colors.black,
                                                        fontSize: 20,
                                                      ),),
                                                    onTap: () {
                                                      Navigator.pop(context,
                                                          items[index].text);
                                                    },
                                                  ),
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
                            );
                          }
                          else if(id=='Condition'){
                            return Column(

                              children: [
                                FutureBuilder(
                                  future: conditionFetch(),
                                  builder: (context, data) {
                                    if (data.hasError) {
                                      return Center(
                                          child: Text("${data.error}"));
                                    } else if (data.hasData) {
                                      var items = data.data as List<MakeModel>;
                                      return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemCount: items == null ? 0 : items
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Column(

                                                children: [
                                                  InkWell(

                                                    child: Text(
                                                      '${items[index].text}',
                                                      style: TextStyle(

                                                        color: Colors.black,
                                                        fontSize: 20,
                                                      ),),
                                                    onTap: () {
                                                      Navigator.pop(context,
                                                          items[index].text);
                                                    },
                                                  ),
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
                            );
                          }
                          else{
                            return Text('');
                          }
                        }
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
  Future<List<MakeModel>> makeFetch() async {
    final String ApiUrl2 = "http://test.erp.gold/api/general/PhoneBasicInfo?id=${id}&filterBy=&sValue=&prevValue=";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CAT",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;

    return list.map((e) => MakeModel.fromJson(e)).toList();
  }
  Future<List<MakeModel>> brandFetch() async {
    final String ApiUrl2 = "http://test.erp.gold/api/general/PhoneBasicInfo?id=${id}&filterBy=${filteredBy}&sValue=${svalue}&prevValue=";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CAT",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;

    return list.map((e) => MakeModel.fromJson(e)).toList();
  }
  Future<List<MakeModel>> modelFetch() async {
    final String ApiUrl2 = "http://test.erp.gold/api/general/PhoneBasicInfo?id=${id}&filterBy=${filteredBy}&sValue=${svalue}&prevValue=";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CAT",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;

    return list.map((e) => MakeModel.fromJson(e)).toList();
  }
  Future<List<MakeModel>> colorFetch() async {
    final String ApiUrl2 = "http://test.erp.gold/api/general/PhoneBasicInfo?id=${id}&filterBy=&sValue=&prevValue=";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CAT",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;

    return list.map((e) => MakeModel.fromJson(e)).toList();
  }
  Future<List<MakeModel>> conditionFetch() async {
    final String ApiUrl2 = "http://test.erp.gold/api/general/PhoneBasicInfo?id=${id}&filterBy=&sValue=&prevValue=";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CAT",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;

    return list.map((e) => MakeModel.fromJson(e)).toList();
  }
  Future<List<MakeModel>> carrierFetch() async {
    final String ApiUrl2 = "http://test.erp.gold/api/general/PhoneBasicInfo?id=${id}&filterBy=&sValue=&prevValue=";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CAT",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;

    return list.map((e) => MakeModel.fromJson(e)).toList();
  }
  Future<List<MakeModel>> capacityFetch() async {
    final String ApiUrl2 = "http://test.erp.gold/api/general/PhoneBasicInfo?id=${id}&filterBy=&sValue=&prevValue=";

    final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
      "token": "$CAT",
      "Username": "$email"
    });
    final list = json.decode(Response2.body) as List<dynamic>;

    return list.map((e) => MakeModel.fromJson(e)).toList();
  }
}

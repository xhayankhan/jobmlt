import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:jobmlt/Models/itemCategoryModel.dart';
import 'package:jobmlt/Models/itemModel.dart';
import 'package:jobmlt/Models/itemTypeModel.dart';
import 'package:jobmlt/Views/itemsPage.dart';
import 'package:jobmlt/Views/makeBrandCreate.dart';
import 'package:jobmlt/Views/makeBrandModelList.dart';
import 'package:jobmlt/Views/recieveInventory.dart';
import 'package:jobmlt/Widgets/textfield.dart';
import 'package:http/http.dart' as http;

class createItem extends StatefulWidget {
  String email, CompanyAuthToken;
  var idx;

  createItem(
      {Key? key, this.idx, required this.email, required this.CompanyAuthToken})
      : super(key: key);
  @override
  _createItemState createState() =>
      _createItemState(idx, email, CompanyAuthToken);
}

class _createItemState extends State<createItem> {
  var idx;
  String email, CompanyAuthToken;
  bool get isEditing => idx != null;
  _createItemState(this.idx, this.email, this.CompanyAuthToken);

  TextEditingController itemCode = new TextEditingController();
  TextEditingController companyID = new TextEditingController();
  TextEditingController upcCode = new TextEditingController();
  TextEditingController itemName = new TextEditingController();
  TextEditingController itemDescription = new TextEditingController();
  TextEditingController stnCost = new TextEditingController();
  TextEditingController sellCost = new TextEditingController();
  TextEditingController weightLB = new TextEditingController();
  TextEditingController weightOZ = new TextEditingController();
  TextEditingController make = new TextEditingController();
  TextEditingController brand = new TextEditingController();
  TextEditingController model = new TextEditingController();
  TextEditingController capacity = new TextEditingController();
  TextEditingController carrier = new TextEditingController();
  TextEditingController color = new TextEditingController();
  TextEditingController condition = new TextEditingController();
  TextEditingController locked = new TextEditingController();
  TextEditingController itemTypController = new TextEditingController();
  TextEditingController itemCatController = new TextEditingController();
  List itemTypList = [];
  List itemCatList = [];
  List<ItemCategoryModel> itemCatResponse = [];
  List<ItemTypeModel> itemTypeResponse = [];
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  var itemCat, itemType, id, lockChk;
  var doing = false;
  var serialized = false;
  var lockCheck = [
    "LOCKED",
    "UNLOCKED",
  ];
  @override
  void initState() {
    if (mounted) {
      if (isEditing) {
        id = idx.id.toString();
        companyID.text = idx.companyId.toString();
        itemName.text = idx.itemName.toString();
        itemCode.text = idx.itemCode.toString();
        upcCode.text = idx.upcCode.toString();
        itemDescription.text = idx.itemDescription.toString();
        stnCost.text = idx.standardCost.toString();
        sellCost.text = idx.unitPrice.toString();
        weightLB.text = idx.itemWeightLb.toString();
        weightOZ.text = idx.itemWeightOz.toString();
        make.text = idx.sMake.toString();
        brand.text = idx.sBrand.toString();
        capacity.text = idx.sCapacity.toString();
        color.text = idx.sColor.toString();
        carrier.text = idx.sCarrier.toString();
        condition.text = idx.sCondition.toString();
        model.text = idx.sModel.toString();
        locked.text = idx.sLockedUnLocked.toString();
        itemType = idx.itemType.toString();
        itemCat = idx.itemCategoryId.toString();
      }
    }
  }

  _fetchCustomerName() async {
    return this._memoizer.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));

      itemCatResponse = await itemCategoryFetch();
      itemTypeResponse = await itemTypeFetch();
      print('done');

      doing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEditing == true ? Text('Update Item') : Text('Create Item'),
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
                    return ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              errorText:
                                  itemCat == null ? 'Field Required' : '',
                              errorStyle: TextStyle(
                                  color: itemCat == null
                                      ? Colors.red
                                      : Colors.black),
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
                                  itemCatController.text =
                                      itms["ItemCategoryName"];
                                  print(itemCatController.text);
                                },
                                child: new Text(
                                  itms["ItemCategoryName"],
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
                              errorText:
                                  itemType == null ? 'Field Required' : '',
                              errorStyle: TextStyle(
                                  color: itemType == null
                                      ? Colors.red
                                      : Colors.black),
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
                                  itemTypController.text = itms["ItemTypeName"];
                                  print(itemTypController.text);
                                },
                                child: new Text(
                                  itms["ItemTypeName"],
                                ),
                                value: itms["ID"].toString(),
                              );
                            }).toList(),
                            onChanged: (itm) {
                              setState(() {
                                itemType = itm as String?;
                                if (itemType == '20') {
                                  serialized = true;
                                  print('Serialized');
                                }
                                print(itemType);
                              });
                            },
                            value: itemType,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            controller: itemCode,
                            decoration: InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                  ),
                  ),
                  filled: true,

                              labelText: 'Item Code',
                            ),
                              autovalidateMode: AutovalidateMode.always,
                              validator: (value) {
                                if (value == null || value.isEmpty || value == '0') {
                                  return "Field Required";
                                }
                                else {
                                  return null;
                                }
                              }
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                              controller: itemName,
                              decoration: InputDecoration(
                                labelText: 'Item Name',
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                filled: true,
                              ),
                              autovalidateMode: AutovalidateMode.always,
                              validator: (value) {
                                if (value == null || value.isEmpty || value == '0') {
                                  return "Field Required";
                                }
                                else {
                                  return null;
                                }
                              } ),
                        ),
                        CustomTextField(
                            labelText: 'UPC Code', controllers: upcCode),

                        CustomTextField(
                            labelText: 'Item Description',
                            controllers: itemDescription),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: stnCost,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Standard Cost',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: sellCost,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Sell Cost',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: weightLB,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Weight(LB)',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: weightOZ,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Weight(OZ)',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () async {
                                    final result = await Get.to(makeBrandList(
                                      email: email,
                                      CAT: CompanyAuthToken,
                                      id: 'Make',
                                      filteredBy: '',
                                      svalue: '',
                                    ));

                                    setState(() {
                                      print(result);
                                      make.text = result;
                                      brand.text = '';
                                      model.text = '';
                                    });
                                  },
                                  controller: make,
                                  decoration: InputDecoration(
                                    labelText: itemType=='20'?'Make *':'Make',
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () async{final result = await Get.to(makeBrandCreate(
                                      email: email,
                                      CAT: CompanyAuthToken,
                                      id: 'Make',
                                      makeName: '',
                                      brandName: '',
                                    ));},
                                    icon: Icon(Icons.add_rounded)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () async {
                                    final result = await Get.to(makeBrandList(
                                      email: email,
                                      CAT: CompanyAuthToken,
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
                                    labelText: itemType=='20'?'Brand *':'Brand',
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () async{
                                      final result = await Get.to(makeBrandCreate(
                  email: email,
                  CAT: CompanyAuthToken,
                  id: 'Brand',
                  makeName: make.text,
                  brandName: '',
                  ));},
                                    icon: Icon(Icons.add_rounded)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () async {
                                    var modelSVal;
                                    if (make.text.isEmpty ||
                                        brand.text.isEmpty) {
                                      modelSVal == 'null';
                                    } else {
                                      modelSVal = '${brand.text},${make.text}';
                                    }
                                    print(modelSVal);
                                    final result = await Get.to(makeBrandList(
                                      email: email,
                                      CAT: CompanyAuthToken,
                                      id: 'Model',
                                      filteredBy: 'MODEL',
                                      svalue: modelSVal.toString(),
                                    ));

                                    setState(() {
                                      print(result);
                                      model.text = result;
                                    });
                                  },
                                  controller: model,
                                  decoration: InputDecoration(
                                    labelText: itemType=='20'?'Model *':'Model',
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () async {
                                      final result = await Get.to(makeBrandCreate(
                                        email: email,
                                        CAT: CompanyAuthToken,
                                        id: 'Model',
                                        makeName: make.text,
                                        brandName: brand.text,
                                      ));

                                    },
                                    icon: Icon(Icons.add_rounded)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () async {
                                    final result = await Get.to(makeBrandList(
                                      email: email,
                                      CAT: CompanyAuthToken,
                                      id: 'Capacity',
                                      filteredBy: '',
                                      svalue: '',
                                    ));

                                    setState(() {
                                      print(result);
                                      capacity.text = result;
                                    });
                                  },
                                  controller: capacity,
                                  decoration: InputDecoration(
                                    labelText: 'Capacity',
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () async {
                  final result = await Get.to(makeBrandCreate(
                  email: email,
                  CAT: CompanyAuthToken,
                  id: 'Capacity',
                  makeName: '',
                  brandName: '',
                  ));},
                                    icon: Icon(Icons.add_rounded)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: carrier,
                                  readOnly: true,
                                  onTap: () async {
                                    final result = await Get.to(makeBrandList(
                                      email: email,
                                      CAT: CompanyAuthToken,
                                      id: 'Carrier',
                                      filteredBy: '',
                                      svalue: '',
                                    ));

                                    setState(() {
                                      print(result);
                                      carrier.text = result;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Carrier',
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () async {
                                      final result = await Get.to(makeBrandCreate(
                                        email: email,
                                        CAT: CompanyAuthToken,
                                        id: 'Carrier',
                                        makeName: '',
                                        brandName: '',
                                      ));},
                                    icon: Icon(Icons.add_rounded)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: color,
                                  readOnly: true,
                                  onTap: () async {
                                    final result = await Get.to(makeBrandList(
                                      email: email,
                                      CAT: CompanyAuthToken,
                                      id: 'Color',
                                      filteredBy: '',
                                      svalue: '',
                                    ));

                                    setState(() {
                                      print(result);
                                      color.text = result;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Color',
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: ()  async {
    final result = await Get.to(makeBrandCreate(
    email: email,
    CAT: CompanyAuthToken,
    id: 'Color',
    makeName: '',
    brandName: '',
    ));},
                                    icon: Icon(Icons.add_rounded)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: condition,
                                  readOnly: true,
                                  onTap: () async {
                                    final result = await Get.to(makeBrandList(
                                      email: email,
                                      CAT: CompanyAuthToken,
                                      id: 'Condition',
                                      filteredBy: '',
                                      svalue: '',
                                    ));

                                    setState(() {
                                      print(result);
                                      condition.text = result;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Condition',
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () async {
                                      final result = await Get.to(makeBrandCreate(
                                        email: email,
                                        CAT: CompanyAuthToken,
                                        id: 'Condition',
                                        makeName: '',
                                        brandName: '',
                                      ));},
                                    icon: Icon(Icons.add_rounded)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                        padding: const EdgeInsets.only(top: 8.0),

                        child: TextFormField(
                          readOnly: true,
                          onTap: () async {
                            final result = await Get.to(makeBrandList(
                              email: email,
                              CAT: CompanyAuthToken,
                              id: 'LOCKED',
                              filteredBy: '',
                              svalue: '',
                            ));

                            setState(() {
                              print(result);
                              locked.text = result;
                            });
                          },
                          controller: locked,
                          decoration: InputDecoration(
                              labelText: 'Locked / Unlocked'
                          ),
                        ),
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
                                  if(isEditing==false) {
                                    if (itemCat==null) {
                                      showDialog(
                                          context: context,
                                          builder: (_) =>
                                              AlertDialog(
                                                title: Text('Error Occurred'),
                                                content: Text(
                                                    "Please Select the Item Category"),
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
                                   else if (itemType==null) {
                                      showDialog(
                                          context: context,
                                          builder: (_) =>
                                              AlertDialog(
                                                title: Text('Error Occurred'),
                                                content: Text(
                                                    "Please Select the Item Type"),
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
                                    else if (itemName.text.isEmpty) {
                                      showDialog(
                                          context: context,
                                          builder: (_) =>
                                              AlertDialog(
                                                title: Text('Error Occurred'),
                                                content: Text(
                                                    "Please type Item Name"),
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
                                    else if (itemCode.text.isEmpty) {
                                      showDialog(
                                          context: context,
                                          builder: (_) =>
                                              AlertDialog(
                                                title: Text('Error Occurred'),
                                                content: Text(
                                                    "Please type Item Code"),
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
                                   else if(itemType=='20'){
                                      if (make.text.isEmpty) {
                                        showDialog(
                                            context: context,
                                            builder: (_) =>
                                                AlertDialog(
                                                  title: Text('Error Occurred'),
                                                  content: Text(
                                                      "Please Select the Make of Item"),
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
                                     else if (brand.text.isEmpty) {
                                        showDialog(
                                            context: context,
                                            builder: (_) =>
                                                AlertDialog(
                                                  title: Text('Error Occurred'),
                                                  content: Text(
                                                      "Please Select the Brand of Item"),
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
                                     else if (model.text.isEmpty) {
                                        showDialog(
                                            context: context,
                                            builder: (_) =>
                                                AlertDialog(
                                                  title: Text('Error Occurred'),
                                                  content: Text(
                                                      "Please Select the Model of Item"),
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
                                    }
                                   else {
                                      Map data = {
                                        "ItemCategoryID": itemCat,
                                        "ItemCode": itemCode.text,
                                        "ItemName": itemName.text,
                                        "ItemDescription": itemDescription.text,
                                        "ItemType": itemType,
                                        "UPCCode": upcCode.text,
                                        "StandardCost": stnCost.text,
                                        "UnitCost": sellCost.text,
                                        "UnitPrice": sellCost.text,
                                        "Item_Weight_LB": weightLB.text,
                                        "Item_Weight_OZ": weightOZ.text,
                                        "sMake": make.text,
                                        "sBrand": brand.text,
                                        "sModel": model.text,
                                        "sCapacity": capacity.text,
                                        "sColor": color.text,
                                        "sCarrier": carrier.text,
                                        "sCondition": condition.text,
                                        "sLocked_UnLocked": locked.text,
                                        "isActive": 1
                                      };

                                      print("" + data.toString());
                                      final result = await addItem(data);

                                      showDialog(
                                          context: context,
                                          builder: (_) =>
                                              AlertDialog(
                                                title: Text('Success'),
                                                content: Text(
                                                    'Item Created Successfully'),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    child: Text('Ok'),
                                                    onPressed: () {
                                                      Get.offAll(items(
                                                        email: email,
                                                        CompanyAuthToken:
                                                        CompanyAuthToken,
                                                      ));
                                                    },
                                                  )
                                                ],
                                              ));
                                    } }
                                  else if(isEditing){
                                    Map data = {
                                      "ID": idx.id.toString(),
                                      "CompanyID": companyID.text,
                                      "ItemCategoryID": itemCat,
                                      "ItemCode": itemCode.text,
                                      "ItemName": itemName.text,
                                      "ItemDescription": itemDescription.text,
                                      "ItemType": itemType,
                                      "UPCCode": upcCode.text,
                                      "StandardCost": stnCost.text,
                                      "UnitCost": sellCost.text,
                                      "UnitPrice": sellCost.text,
                                      "Item_Weight_LB": weightLB.text,
                                      "Item_Weight_OZ": weightOZ.text,
                                      "sMake": make.text,
                                      "sBrand": brand.text,
                                      "sModel": model.text,
                                      "sCapacity": capacity.text,
                                      "sColor": color.text,
                                      "sCarrier": carrier.text,
                                      "sCondition": condition.text,
                                      "sLocked_UnLocked": locked.text,
                                      "isActive": 1
                                    };

                                    print("" + data.toString());
                                    final result = await updateItem(idx.id,data);

                                    showDialog(
                                        context: context,
                                        builder: (_) =>
                                            AlertDialog(
                                              title: Text('Success'),
                                              content: Text(
                                                  'Item Updated Successfully'),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  child: Text('Ok'),
                                                  onPressed: () {
                                                    Get.offAll(items(
                                                      email: email,
                                                      CompanyAuthToken:
                                                      CompanyAuthToken,
                                                    ));
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

  Future<List<ItemCategoryModel>> itemCategoryFetch() async {
    final String ApiUrl2 =
        "http://test.erp.gold/api/AdvanceInventory/Category/GetList";

    final Response2 = await http.get(Uri.parse(ApiUrl2),
        headers: {"token": "$CompanyAuthToken", "Username": "$email"});
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      itemCatList = list;
    });
    return list.map((e) => ItemCategoryModel.fromJson(e)).toList();
  }

  Future<List<ItemTypeModel>> itemTypeFetch() async {
    final String ApiUrl2 =
        "http://test.erp.gold/api/AdvanceInventory/items/GetItemTypeList";

    final Response2 = await http.get(Uri.parse(ApiUrl2),
        headers: {"token": "$CompanyAuthToken", "Username": "$email"});
    final list = json.decode(Response2.body) as List<dynamic>;
    setState(() {
      itemTypList = list;
    });
    return list.map((e) => ItemTypeModel.fromJson(e)).toList();
  }

  Future<ItemModel> addItem(Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$CompanyAuthToken",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/advanceinventory/items/Post"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));

      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add Item.');
    }
  }
  Future<ItemModel> updateItem(int id,Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$CompanyAuthToken",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/advanceinventory/items/Put"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));

      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add Item.');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobmlt/Views/binTransferPage.dart';
import 'package:jobmlt/Views/purchaseOrder.dart';
import 'package:jobmlt/Views/recieveInventory.dart';
import 'package:jobmlt/Views/siteTransferPage.dart';

class moreOptions extends StatefulWidget {
  String email,CompanyAuthToken;
  moreOptions({Key? key, required this.email, required this.CompanyAuthToken}) : super(key: key);
  @override
  _moreOptionsState createState() => _moreOptionsState(email,CompanyAuthToken);

}

class _moreOptionsState extends State<moreOptions> {
  String email,CompanyAuthToken;
  _moreOptionsState (this.email,this.CompanyAuthToken);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Options'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black,Colors.blueAccent])),
      child: Column(
        children: [
          InkWell(
            onTap: (){
                      Get.to(purchaseOrder(email: email, CompanyAuthToken: CompanyAuthToken));
            },
            child: Container(margin: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 10),

              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Purchase Order',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.arrow_forward_ios_outlined))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Get.to(recieveInventory(email: email, CompanyAuthToken: CompanyAuthToken));
            },
            child: Container(margin: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 10),

              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Receive Inventory',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){ Get.to(recieveInventory(email: email, CompanyAuthToken: CompanyAuthToken));},
                      icon: Icon(Icons.arrow_forward_ios_outlined))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Get.to(siteTransfer(email: email, CompanyAuthToken: CompanyAuthToken));
            },
            child: Container(margin: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 10),

              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Site Transfer',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){ Get.to(siteTransfer(email: email, CompanyAuthToken: CompanyAuthToken));},
                      icon: Icon(Icons.arrow_forward_ios_outlined))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Get.to(binTransfer(email: email, CAT: CompanyAuthToken));
            },
            child: Container(margin: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 10),

              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bin Transfer',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){ Get.to(binTransfer(email: email, CAT: CompanyAuthToken));},
                      icon: Icon(Icons.arrow_forward_ios_outlined))
                ],
              ),
            ),
          )
        ],
      ),
      ),

    );
  }
}

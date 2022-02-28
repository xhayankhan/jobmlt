import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobmlt/Views/itemsPage.dart';
import 'package:jobmlt/Views/customerPage.dart';
import 'package:jobmlt/Views/moreOptions.dart';

import 'invoicePage.dart';

class mainPage extends StatefulWidget {

  String email,CompanyAuthToken;
  mainPage({Key? key, required this.email, required this.CompanyAuthToken}) : super(key: key);
  @override
  _mainPageState createState() => _mainPageState(email,CompanyAuthToken);
}

class _mainPageState extends State<mainPage> {
  String email,CompanyAuthToken;
  _mainPageState (this.email,this.CompanyAuthToken);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black, Colors.yellow.shade700,Colors.deepPurple])),
        child: ListView(
          children:<Widget>[
            Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/erp-gold.png',
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.4,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        "$email",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),

                      ),
                    ),
                  ],
                ),
              ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('More Options:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(onPressed: (){
                        Get.to(moreOptions(email: email,CompanyAuthToken: CompanyAuthToken,));
                      },
                          icon: Icon(Icons.more_horiz),
                      iconSize: 30,),
                    )
                  ],
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children:<Widget> [
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>newPage(email:email,CompanyAuthToken: CompanyAuthToken,));
                          },
                          child: Image.asset('images/customer.png',
                            height: MediaQuery.of(context).size.height*0.17,
                            width: MediaQuery.of(context).size.width*0.2,
                          ),

                        ),
                        Text(
                          "Customers",
                          style: TextStyle(
                            fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),

                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children:<Widget> [
                        GestureDetector(
                          onTap: (){ Get.to(()=>invoice(email:email,CompanyAuthToken: CompanyAuthToken,));},
                          child: Image.asset('images/invoice.png',
                            height: MediaQuery.of(context).size.height*0.17,
                            width: MediaQuery.of(context).size.width*0.2,
                          ),

                        ),
                        Text(
                          "Invoices",
                          style: TextStyle(
                            fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),

                        ),

                      ],
                    ),
                  ),

                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children:<Widget> [
                        GestureDetector(
                          onTap: (){Get.to(()=>items(email:email,CompanyAuthToken: CompanyAuthToken,));},
                          child: Image.asset('images/item.png',
                            height: MediaQuery.of(context).size.height*0.17,
                            width: MediaQuery.of(context).size.width*0.2,
                          ),

                        ),
                        Text(
                          "Item Master",
                          style: TextStyle(
                            fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),

                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children:<Widget> [
                        GestureDetector(
                          onTap: (){},
                          child: Image.asset('images/categories.png',
                            height: MediaQuery.of(context).size.height*0.17,
                            width: MediaQuery.of(context).size.width*0.2,
                          ),

                        ),
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),

                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ],

          ),],
        ),
        
      ),
      
    );
  }
}

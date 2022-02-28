

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobmlt/Models/customer.dart';
import 'package:jobmlt/Models/loginModel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../Api Services/api_service.dart';
import 'homePage.dart';
import 'customerPage.dart';


class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();

}
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();


class _homePageState extends State<homePage> {
  bool _isHidden = true;
  late LoginModel _login;
  late CustomerModel _customer;
  //late List _customer;
  Timer? _timer;
  //late double _progress;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });

    // EasyLoading.removeCallbacks();
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(

            image: DecorationImage(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              image: AssetImage(
                  "images/erpgoldintegration.png"),
              fit: BoxFit.fill,

            ),),
          child:  BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3),
              ),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('images/erp-gold.png',
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.4,),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          labelText: 'Email',
                          fillColor: Colors.grey[300]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,

                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(

                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            size: 18,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          labelText: 'Password',
                          fillColor: Colors.grey[300]
                      ),

                    ),
                    SizedBox(
                      height: 19,
                    ),

                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red.shade700,
                          borderRadius: BorderRadius.circular(20)),
                      height: 40,
                      width: 150,
                      child: GestureDetector(
                         onTap: () async {
                           final String email = emailController.text;
                           final String password = passwordController.text;


                           _timer?.cancel();
                            EasyLoading.show(
                             status: 'Loading...',
                             maskType: EasyLoadingMaskType.black,
                           );
                           final LoginModel login = await loginUser(email, password);

                           setState(()  {

                          _login = login;

                          EasyLoading.dismiss();


                           });

                         },


                        child: Center(
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      ),

                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
            ),
          ),
        ),

    );

  }


}


LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
class LoginModel {

  LoginModel({ this.success, this.msg,  this.error_msg, this.CompanyAuthToken,this.email});
  final String? email;
  final String? msg;
  final int? success;
  final String? error_msg;
  final String? CompanyAuthToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final success = json['success'] as int?;
    final msg = json['msg'] as String?;
    final error_msg = json['error_msg'] as String?;
    final CompanyAuthToken = json['CompanyAuthToken'] as String?;
    final email= emailController.text;

    if(success==1&&CompanyAuthToken!=null) {
    var CAT=CompanyAuthToken;
      EasyLoading.dismiss();
      print(json);
      Get.to(()=>mainPage(email:email,CompanyAuthToken: CAT,));
      Get.snackbar(
        'Login Successful',
        '$msg',
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    }
    else if(success==0){
      EasyLoading.dismiss();
      print(json);
      Get.snackbar(
          'Error Occurred',
          '$error_msg',
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5)

      );}



    return LoginModel(success:success,msg: msg, error_msg: error_msg, CompanyAuthToken: CompanyAuthToken);
  }

}


//
//
//
// LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
//
// //String loginModelToJson(LoginModel data) => json.encode(data.toJson());
//
// class LoginModel {
//     int success;
//     String? msg;
//     String? errorMsg;
//     String? companyAuthToken;
//
//   LoginModel({
//      required this.success,
//       this.errorMsg,
//        this.msg,
//       this.companyAuthToken,
//   });
//
//
//
//    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//      success: json["success"]as int;
//        if(success==1){
//
//        };
//     errorMsg: json["error_msg"] as String,
//     msg: json["msg"] as String,
//     companyAuthToken: json["CompanyAuthToken"] as String,
//
//   );
//
//   //
//   // Map<String, dynamic> toJson() => {
//   //
//   //   "success": success,
//   //   if(success==1)
//   //     {
//   //
//   //     };
//   //   "msg": msg,
//   //   "CompanyAuthToken": companyAuthToken,
//   // };
// }
//


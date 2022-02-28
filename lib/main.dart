import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jobmlt/Views/homePage.dart';

import 'Views/loginPage.dart';
void main() {
  runApp(
      GetMaterialApp(
        home: homePage(),
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),

      ));
}

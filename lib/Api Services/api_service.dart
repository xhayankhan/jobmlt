import 'dart:convert';
import 'package:jobmlt/Models/customer.dart';
import '../Views/loginPage.dart';
import '../Models/loginModel.dart';
import 'package:http/http.dart'as http;

Future<LoginModel> loginUser(String email, String password,) async{
  final String apiUrl = "http://test.erp.gold/api/accounts/Login?Username=$email&Password=$password";
  final response = await http.post(Uri.parse(apiUrl), body: {
    "Username": email,
    "Password": password
  },
  headers: {
    "token": "erp.gold",

      }
  );

  final String responseString = response.body;
  var data = jsonDecode(responseString);
    return loginModelFromJson(responseString);
  }
//
// Future<List<Customer>> customerModel(String email, String CompanyAuthToken) async {
//   final String ApiUrl2="http://test.erp.gold/api/Sales/customer/GetCustomerListwithBalance";
//
//   final Response2 = await http.get(Uri.parse(ApiUrl2), headers: {
//     "token": "f71d5a40-0397-49a7-9daa-c09513244b0e",
//     "Username": "shayaniqbal515@gmail.com"
//   });
//   final ResponseString1 =jsonDecode (Response2.body);
//   var r =ResponseString1.map((job) => new Customer.fromJson(job)).toList();
//   if (Response2.statusCode == 200) {
//     print(ResponseString1);
//     print(r);
//   }
//   else if (Response2.statusCode == 401) {
//     print("Un authorized");
//   }
//   return r;
//
// }
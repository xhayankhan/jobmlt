import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jobmlt/Widgets/textfield.dart';
import '../Models/customer.dart';

class Customer extends StatefulWidget {
  String email, companyAuthToken;
  var i;

  Customer(
      {Key? key, this.i, required this.email, required this.companyAuthToken})
      : super(key: key);

  @override
  CustomerState createState() => CustomerState(i, email, companyAuthToken);
}

class CustomerState extends State<Customer> {
  var i;
  String email, companyAuthToken;

  bool get isEditing => i != null;

  CustomerState(this.i, this.email, this.companyAuthToken);

  var rnd = new Random();
  TextEditingController faxController = new TextEditingController();
  TextEditingController openingBalanceController = new TextEditingController();
  TextEditingController openBalanceController = new TextEditingController();
  TextEditingController customerCodeController = new TextEditingController();
  TextEditingController customerNameController = new TextEditingController();
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController companynameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController streetAddressController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController zipcodeController = new TextEditingController();
  TextEditingController stateController = new TextEditingController();
  TextEditingController countryController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      print(i.id.toString());
      companynameController.text = i.companyName.toString();
      customerNameController.text = i.customerName.toString();
      emailController.text = i.email.toString();
      firstnameController.text = i.firstName.toString();
      lastnameController.text = i.lastName.toString();
      phoneController.text = i.phone.toString();
      mobileController.text = i.phone2.toString();
      streetAddressController.text = i.streetAddress.toString();
      cityController.text = i.city.toString();
      stateController.text = i.state.toString();
      zipcodeController.text = i.zipCode.toString();
      faxController.text = i.fax.toString();
      openBalanceController.text = i.openingBalance.toString();
      openBalanceController.text = i.openBalance.toString();
      // companynameController.text = Customer().companyName;
    }
    // else {
    //   companynameController.text = customerUpdate().companyName.toString();
    //   customerNameController.text = customerUpdate().customerName.toString();
    //   emailController.text = customerUpdate().email.toString();
    //   firstnameController.text =customerUpdate().firstName.toString();
    //   lastnameController.text = customerUpdate().lastName.toString() ;
    //   phoneController.text = customerUpdate().phone.toString() ;
    //   mobileController.text =customerUpdate().phone2.toString();
    //   streetAddressController.text = customerUpdate().streetAddress.toString();
    //   cityController.text = customerUpdate().city.toString();
    //   stateController.text = customerUpdate().state.toString();
    //   zipcodeController.text = customerUpdate().zipCode.toString();
    //   faxController.text = customerUpdate().fax.toString();
    //   openBalanceController.text = customerUpdate().openBalance.toString();
    //   openingBalanceController.text = customerUpdate().openingBalance.toString();
    // }
  }

  @override
  Widget build(BuildContext context) {
    //
    // if(i.id==null){
    //   i=customerUpdate();
    //
    // }
    // else{
    //   i=i;
    // }

    return Scaffold(appBar: AppBar(
      title:  isEditing==true? Text('Update Customer'): Text('Create Customer'),
      centerTitle: true,

    ),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView(
            children: <Widget>[
              CustomTextField(
                  controllers: customerNameController,
                  labelText: 'Customer Name'),
              CustomTextField(
                  controllers: firstnameController, labelText: 'First Name'),
              CustomTextField(
                controllers: lastnameController,
                labelText: 'Last Name',
              ),
              CustomTextField(
                  controllers: openingBalanceController,
                  labelText: 'Opening Balance'),
              CustomTextField(
                  controllers: companynameController,
                  labelText: 'Company Name'),
              CustomTextField(controllers: emailController, labelText: 'Email'),
              CustomTextField(controllers: phoneController, labelText: 'Phone'),
              CustomTextField(
                  controllers: mobileController, labelText: 'Mobile'),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextFormField(
                    controller: streetAddressController,
                    maxLines: 4,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(labelText: 'Street Address',
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                    )),
              ),
              CustomTextField(controllers: cityController, labelText: 'City'),
              CustomTextField(controllers: stateController, labelText: 'State'),
              CustomTextField(
                  controllers: zipcodeController, labelText: 'Zip Code'),
              CustomTextField(
                  controllers: countryController, labelText: 'Country'),
              CustomTextField(controllers: faxController, labelText: 'Fax'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 50,right: 50),
                child: SizedBox(
                  height:50, //height of button
                  width:50,
                  child: ElevatedButton(
                      child:Text('Save Data',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder(),


                      shadowColor: Colors.black),
                      onPressed: () async {
                    if (isEditing) {
                      Map data = {
                        'ID': i.id,
                        'CustomerName': customerNameController.text,
                        'CompanyName': companynameController.text,
                        'CustomerCode': 1656,
                        'StreetAddress': streetAddressController.text,
                        'City': cityController.text,
                        'State': stateController.text,
                        'ZipCode': zipcodeController.text,
                        'Country': countryController.text,
                        'Phone': phoneController.text,
                        'Fax': faxController.text,
                        'FirstName': firstnameController.text,
                        'LastName': lastnameController.text,
                        'Mobile': mobileController.text,
                        'Email': emailController.text,
                        'isActive': 1,
                      };

                      print("" + data.toString());
                      final result1 = await updateCustomer(i.id, data);
                      print(result1);
                    } else {
                      // final create = CustomerUpdate(
                      //   customerCode: 1656,
                      //   customerName: customerNameController.text,
                      //   openingBalance: openingBalanceController.text,
                      //   openBalance: openBalanceController.text,
                      //   companyName: companynameController.text,
                      //   firstName: firstnameController.text,
                      //   lastName: lastnameController.text,
                      //   streetAddress: streetAddressController.text,
                      //   city: cityController.text,
                      //   state: stateController.text,
                      //   zipCode: zipcodeController.text,
                      //   country: countryController.text,
                      //   phone: phoneController.text,
                      //   phone2: mobileController.text,
                      //   fax: faxController.text,
                      //   email: emailController.text,
                      // );
                      Map data = {
                        'CustomerName': customerNameController.text,
                        'CompanyName': companynameController.text,
                        'CustomerCode': 1656,
                        'StreetAddress': streetAddressController.text,
                        'City': cityController.text,
                        'State': stateController.text,
                        'ZipCode': zipcodeController.text,
                        'Country': countryController.text,
                        'Phone': phoneController.text,
                        'Fax': faxController.text,
                        'FirstName': firstnameController.text,
                        'LastName': lastnameController.text,
                        'Mobile': mobileController.text,
                        'Email': emailController.text,
                        'isActive': 1,
                      };

                      print("" + data.toString());
                      final result = await addCustomer(data);
                      print(result);
                    }
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<CustomerUpdate> addCustomer(Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$companyAuthToken",
      'Username': "$email"
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/Sales/customer/Post"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return CustomerUpdate.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Add Customer.');
    }
  }

  Future<CustomerUpdate> updateCustomer(int id, Map item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Token': "$companyAuthToken",
      'Username': "$email",
    };
    final response = await http.post(
        Uri.parse("http://test.erp.gold/api/Sales/customer/Put"),
        headers: headers,
        body: json.encode(item));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return CustomerUpdate.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to Update Customer.');
    }
  }
}

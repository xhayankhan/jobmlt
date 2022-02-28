import 'package:flutter/material.dart';
import 'package:jobmlt/Widgets/textfield.dart';

class createItem extends StatefulWidget {
  const createItem({Key? key}) : super(key: key);

  @override
  _createItemState createState() => _createItemState();
}

class _createItemState extends State<createItem> {
  TextEditingController itemCode=new TextEditingController();
  TextEditingController upcCode=new TextEditingController();
  TextEditingController itemName=new TextEditingController();
  TextEditingController itemDescription=new TextEditingController();
  TextEditingController stnCost=new TextEditingController();
  TextEditingController sellCost=new TextEditingController();
  TextEditingController weightLB=new TextEditingController();
  TextEditingController weightOZ=new TextEditingController();
  TextEditingController phoneController=new TextEditingController();
  TextEditingController mobileController=new TextEditingController();
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  TextEditingController streetAddressController=new TextEditingController();
  TextEditingController cityController=new TextEditingController();
  TextEditingController zipcodeController=new TextEditingController();
  TextEditingController stateController=new TextEditingController();
  TextEditingController countryController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ListView(
              children: <Widget> [
                // DropdownButtonFormField(
                //   items: [],onChanged:(Object? value) {  },
                // decoration: InputDecoration(
                //   labelText: 'Item Category',
                // ),),
                // DropdownButtonFormField(items: [],
                //   decoration: InputDecoration(
                //     labelText: 'Item Type',
                //   ), onChanged: (Object? value) {  },),
                CustomTextField(labelText: 'Item Code', controllers: itemCode),
                CustomTextField(labelText: 'UPC Code', controllers: upcCode),
                CustomTextField(labelText: 'Item Name', controllers: itemName),
                CustomTextField(labelText: 'Item Description', controllers: itemDescription),
                Row(
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
                Row(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

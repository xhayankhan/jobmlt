import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controllers;

String labelText;
CustomTextField({  required this.labelText, required this.controllers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        controller: controllers,

        // controller: customerName.text=i.customerName==null?'':i.customerName,
        //initialValue: i.customerName.toString(),
        style: TextStyle(),
        decoration: InputDecoration(labelText: labelText,
      border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
      const Radius.circular(10.0),
      ),
      ),
      filled: true,
      )
      ),
    );
  }
}

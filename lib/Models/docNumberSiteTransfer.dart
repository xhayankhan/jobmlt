// To parse this JSON data, do
//
//     final docNumber = docNumberFromJson(jsonString);

import 'dart:convert';

DocNumber docNumberFromJson(String str) => DocNumber.fromJson(json.decode(str));

String docNumberToJson(DocNumber data) => json.encode(data.toJson());

class DocNumber {
  DocNumber({
    this.docNumber,
  });

  dynamic docNumber;

  factory DocNumber.fromJson(Map<String, dynamic> json) => DocNumber(
    docNumber: json["DocNumber"],
  );

  Map<String, dynamic> toJson() => {
    "DocNumber": docNumber,
  };
}
// To parse this JSON data, do
//
//     final makeModel = makeModelFromJson(jsonString);

import 'dart:convert';

List<MakeModel> makeModelFromJson(String str) => List<MakeModel>.from(json.decode(str).map((x) => MakeModel.fromJson(x)));

String makeModelToJson(List<MakeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MakeModel {
  MakeModel({
    this.text,
    this.value,
  });

  dynamic text;
  dynamic value;

  factory MakeModel.fromJson(Map<String, dynamic> json) => MakeModel(
    text: json["Text"],
    value: json["Value"],
  );

  Map<String, dynamic> toJson() => {
    "Text": text,
    "Value": value,
  };
}

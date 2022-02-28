import 'dart:convert';

List<SerialNumberModel> serialNumberModelFromJson(String str) => List<SerialNumberModel>.from(json.decode(str).map((x) => SerialNumberModel.fromJson(x)));

String serialNumberModelToJson(List<SerialNumberModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SerialNumberModel {
  SerialNumberModel({

    this.sImei,

  });


  dynamic sImei;

  factory SerialNumberModel.fromJson(Map<String, dynamic> json) => SerialNumberModel(

    sImei: json["sIMEI"],

  );

  Map<String, dynamic> toJson() => {

    "sIMEI": sImei,

  };
}

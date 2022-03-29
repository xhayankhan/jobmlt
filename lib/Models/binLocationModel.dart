// To parse this JSON data, do
//
//     final binLocationModel = binLocationModelFromJson(jsonString);

import 'dart:convert';

List<BinLocationModel> binLocationModelFromJson(String str) => List<BinLocationModel>.from(json.decode(str).map((x) => BinLocationModel.fromJson(x)));

String binLocationModelToJson(List<BinLocationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BinLocationModel {
  BinLocationModel({
    this.isShow =true,
    this.id,
    this.binLocationName,
    this.companyId,
    this.warehouseId,
    this.binLocationDescription,
    this.binMaxQuantity,
    this.ivWarehouseName,
  });

  bool isShow;
  dynamic id;
  dynamic binLocationName;
  dynamic companyId;
  dynamic warehouseId;
  dynamic binLocationDescription;
  dynamic binMaxQuantity;
  dynamic ivWarehouseName;

  factory BinLocationModel.fromJson(Map<String, dynamic> json) => BinLocationModel(
    isShow: json["IsShow"],
    id: json["ID"],
    binLocationName: json["BinLocationName"],
    companyId: json["CompanyID"],
    warehouseId: json["WarehouseID"],
    binLocationDescription: json["BinLocationDescription"],
    binMaxQuantity: json["Bin_MaxQuantity"],
    ivWarehouseName: json["IVWarehouseName"],
  );

  Map<String, dynamic> toJson() => {
    "IsShow": isShow,
    "ID": id,
    "BinLocationName": binLocationName,
    "CompanyID": companyId,
    "WarehouseID": warehouseId,
    "BinLocationDescription": binLocationDescription,
    "Bin_MaxQuantity": binMaxQuantity,
    "IVWarehouseName": ivWarehouseName,
  };
}

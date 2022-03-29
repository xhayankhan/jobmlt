// To parse this JSON data, do
//
//     final locationData = locationDataFromJson(jsonString);

import 'dart:convert';

List<LocationData> locationDataFromJson(String str) => List<LocationData>.from(json.decode(str).map((x) => LocationData.fromJson(x)));

String locationDataToJson(List<LocationData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationData {
  LocationData({
    this.warehouseId,
    this.itemCode,
    this.itemCardId,
    this.binLocationId,
    this.qtyOnHand,
  });

  dynamic warehouseId;
  dynamic itemCode;
  dynamic itemCardId;
  dynamic binLocationId;
  dynamic qtyOnHand;

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
    warehouseId: json["WarehouseID"],
    itemCode: json["ItemCode"],
    itemCardId: json["ItemCardID"],
    binLocationId: json["BinLocationID"],
    qtyOnHand: json["Qty_OnHand"],
  );

  Map<String, dynamic> toJson() => {
    "WarehouseID": warehouseId,
    "ItemCode": itemCode,
    "ItemCardID": itemCardId,
    "BinLocationID": binLocationId,
    "Qty_OnHand": qtyOnHand,
  };
}

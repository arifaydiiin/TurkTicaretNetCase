// To parse this JSON data, do
//
//     final menuModel = menuModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MenuModel menuModelFromMap(String str) => MenuModel.fromMap(json.decode(str));

String menuModelToMap(MenuModel data) => json.encode(data.toMap());

class MenuModel {
    MenuModel({
        required this.itemname,
        required this.itemprice,
        required this.itemdescribe,
        required this.itempoint,
        required this.itemurl,
    });

    String itemname;
    int itemprice;
    String itemdescribe;
    double itempoint;
    String itemurl;

    factory MenuModel.fromMap(Map<String, dynamic> json) => MenuModel(
        itemname: json["itemname"] == null ? null : json["itemname"],
        itemprice: json["itemprice"] == null ? null : json["itemprice"],
        itemdescribe: json["itemdescribe"] == null ? null : json["itemdescribe"],
        itempoint: json["itempoint"] == null ? null : json["itempoint"].toDouble(),
        itemurl: json["itemurl"] == null ? null : json["itemurl"],
    );

    Map<String, dynamic> toMap() => {
        "itemname": itemname == null ? null : itemname,
        "itemprice": itemprice == null ? null : itemprice,
        "itemdescribe": itemdescribe == null ? null : itemdescribe,
        "itempoint": itempoint == null ? null : itempoint,
        "itemurl": itemurl == null ? null : itemurl,
    };
}

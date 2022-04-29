// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
    UserModel({
        required this.username,
        required this.email,
    });

    String username;
    String email;

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
    );

    Map<String, dynamic> toMap() => {
        "username": username == null ? null : username,
        "email": email == null ? null : email,
    };
}

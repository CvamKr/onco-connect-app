// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';



class UserModel {
  String userId;
  String email;
  String username;
  String phoneNo;

  UserModel({
    this.userId = "",
    this.email = "",
    this.username = "",
    this.phoneNo = "",
  });

  UserModel copyWith({
    String? userId,
    String? email,
    String? username,
    String? phoneNo,
  }) =>
      UserModel(
        userId: userId ?? this.userId,
        email: email ?? this.email,
        username: username ?? this.username,
        phoneNo: phoneNo ?? this.phoneNo,
      );

  factory UserModel.fromJson(DocumentSnapshot doc, Map<String, dynamic> json) =>
      UserModel(
        userId: doc.id,
        email: json["email"],
        username: json["username"],
        phoneNo: json["phoneNo"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "phoneNo": phoneNo,
      };
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'device.dart';
import 'package:proj/main.dart';

class User {
  late Device? devices;
  String? userName;
  String? userAccount;
  String? userPassword;

  User({
    this.devices,
    required this.userAccount,
    required this.userPassword,
    required this.userName,
  });

  Map<String, dynamic> toJson() => {
        'userAccount': userAccount,
        'userPassword': userPassword,
        'userName': userName,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        userAccount: json['userAccount'],
        userPassword: json['userPassword'],
        userName: json['userName'],
      );
}

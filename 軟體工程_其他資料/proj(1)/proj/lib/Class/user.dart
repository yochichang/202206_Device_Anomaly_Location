import 'package:flutter/material.dart';
import 'dart:async';

class User {
  String name = ' ';
  String account = ' ';
  String password = ' ';

  User(String name, String password, String account) {
    this.name = name;
    this.password = password;
    this.account = account;
  }

  void set(String name, String password, String account) {
    this.name = name;
    this.password = password;
    this.account = account;
  }
}

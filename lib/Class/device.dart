import 'package:flutter/material.dart';
import 'dart:async';
import 'package:proj/main.dart';

class Device {
  String? deviceName;
  int? deviceDis;
  late double? latitude;
  late double? longtitude;

  Device({
    required this.deviceName,
    required this.deviceDis,
    this.latitude,
    this.longtitude,
  });

  Map<String, dynamic> toJson() => {
        'deviceName': deviceName,
        'deviceDis': deviceDis,
        'latitude': latitude,
        'longtitude': longtitude,
      };

  static Device fromJson(Map<String, dynamic> json) => Device(
        deviceName: json['deviceName'],
        deviceDis: json['deviceDis'],
        latitude: json['latitude'],
        longtitude: json['longtitude'],
      );
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:proj/main.dart';
import 'package:proj/Class/device.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocgpsPage extends StatefulWidget {
  @override
  _LocgpsState createState() => _LocgpsState();
}

class _LocgpsState extends State<LocgpsPage> {
  Position? _currentPosition;
  bool putButton = false;
  DateTime _dateTime = DateTime.now();
  DateTime latestTime = DateTime.now(), newTime = DateTime.now();
  int freq = 3;

  @override
  void initState() {
    super.initState();
    Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (putButton == true && _dateTime.second % freq == 0) {
      determinePosition();
      newTime = DateTime.now();
      updateGps();
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('image/ok.jpg', width: 300, height: 300),
            Container(
                child: Text(
                    "LAT: ${nowDevice.latitude}, LNG: ${nowDevice.longtitude}, Time: ${latestTime}")),
            Text(
                "LAT: ${_currentPosition?.latitude}, LNG: ${_currentPosition?.longitude}, Time: ${newTime}"),
            Text(
              '${_dateTime}'.substring(0, 19),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
            ),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                determinePosition();
                newTime = DateTime.now();
                updateGps();
                putButton = !putButton;
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      print('Location permissions are denied');
      return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied, we cannot request permissions.');
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((result) {
      setState(() {
        _currentPosition = result;
        print(result);
      });
    });

    return await Geolocator.getCurrentPosition();
  }

  void updateGps() {
    final docGps = FirebaseFirestore.instance
        .collection('/users/${nowUser.userAccount}/devices')
        .doc(nowDevice.deviceName);

    if (_currentPosition != 0.0 && _currentPosition != null) {
      nowDevice.latitude = _currentPosition?.latitude;
      nowDevice.longtitude = _currentPosition?.longitude;
      latestTime = DateTime.now();
    }

    docGps.update({
      'latitude': nowDevice.latitude,
      'longtitude': nowDevice.longtitude,
    });
  }

  // void _getCurrentLocation() {
  //   //print('${_dateTime.second}');
  //   Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.best,
  //           forceAndroidLocationManager: true)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //       print(_currentPosition);
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
}

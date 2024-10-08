import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class LocgpsPage extends StatefulWidget {
  @override
  _LocgpsState createState() => _LocgpsState();
}

class _LocgpsState extends State<LocgpsPage> {
  Position? _currentPosition;
  int putBotton = 0;
  DateTime _dateTime = DateTime.now();
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: LayoutBuilder(builder: (context, constraints) {
              if (_currentPosition != null && _dateTime.second % freq == 0) {
                _getCurrentLocation();
                return Text(
                    "LAT: ${_currentPosition?.latitude}, LNG: ${_currentPosition?.longitude}");
              } else {
                return Text("nono");
              }
            })),
            Text(
              '${_dateTime}'.substring(0, 19),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
            ),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                if (putBotton == 0) {
                  putBotton = 1;
                  _getCurrentLocation();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    //print('${_dateTime.second}');
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}

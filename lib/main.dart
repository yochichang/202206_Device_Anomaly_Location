import 'package:flutter/material.dart';
import 'dart:async';
import 'Page/home.dart';
import 'Page/device_manager.dart';
import 'Page/getlocation.dart';
import 'package:proj/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:proj/Class/device.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  changePage(int idx) => createState().onClick(idx);

  @override
  _MyAppState createState() => _MyAppState();
}

class nowUser {
  static Device? devices;
  static String? userAccount = '';
  static String? userPassword = '';
  static String? userName = '';
}

class nowDevice {
  static String? deviceName = 'device2';
  static int? deviceDis;
  static double? latitude = 0.0;
  static double? longtitude = 0.0;
}

class _MyAppState extends State<MyApp> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值

  final pages = [HomePage(), deviceManagerPage(), LocgpsPage()];
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Location'),
          backgroundColor: Colors.pink,
        ),
        drawer: DefaultDrawer(this.onClick),
        body: pages[_currentIndex],
      ),
    );
  }

  void onItemClick(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => deviceManagerPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LocgpsPage(),
        ));
        break;
      default:
    }
  }

  void onClick(int index) {
    setState(() {
      _currentIndex = index;
      //Navigator.pop();
      // Navigator.of(context).pop();
      //Navigator.pop(context);
    });
  }
}

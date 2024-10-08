import 'package:flutter/material.dart';
import 'dart:async';
import 'Page/home.dart';
import 'Page/device_manager.dart';
import 'Page/gps.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
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
        drawer: Drawer(
          child: Container(
            color: Color.fromARGB(255, 216, 199, 234),
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 48),
                //設定用户名稱
                UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 110, 33, 243)),
                  accountName: new Text(
                    "裝置定位",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //設定Email
                  accountEmail: new Text(
                    "kyle@gmail.com",
                  ),
                  //設定大頭照
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage: new AssetImage("pictures/phone.png"),
                  ),
                ),
                //選單
                ListTile(
                  leading: new CircleAvatar(
                    child: Icon(Icons.home),
                    backgroundColor: Color.fromARGB(255, 216, 199, 234),
                    foregroundColor: Color.fromARGB(255, 110, 33, 243),
                  ),
                  title: Text(
                    '首頁',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 110, 33, 243)),
                  ),
                  onTap: () {
                    onClick(0);
                  },
                ),
                ListTile(
                  leading: new CircleAvatar(
                    child: Icon(Icons.code),
                    backgroundColor: Color.fromARGB(255, 216, 199, 234),
                    foregroundColor: Color.fromARGB(255, 110, 33, 243),
                  ),
                  title: Text(
                    '裝置設定',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 110, 33, 243)),
                  ),
                  onTap: () {
                    print("tap");
                    onClick(1);
                  },
                ),
                ListTile(
                  leading: new CircleAvatar(
                    child: Icon(Icons.computer),
                    backgroundColor: Color.fromARGB(255, 216, 199, 234),
                    foregroundColor: Color.fromARGB(255, 110, 33, 243),
                  ),
                  title: Text(
                    '定位設置',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 110, 33, 243)),
                  ),
                  onTap: () {
                    onClick(2);
                  },
                ),
              ],
            ),
          ),
        ),
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
      Navigator.of(context).pop();
    });
  }
}

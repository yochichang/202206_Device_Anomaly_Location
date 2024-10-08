import 'package:flutter/material.dart';
import 'package:proj/main.dart';

class DefaultDrawer extends StatelessWidget {
  final Function onClick;

  DefaultDrawer(this.onClick);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 216, 199, 234),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 48),
            //設定用户名稱
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('image/back.jpg'), fit: BoxFit.cover)),

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
                backgroundImage: new AssetImage("image/phone.png"),
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
                Navigator.pop(context);
                onClick(0);
              },
            ),
            ListTile(
              leading: new CircleAvatar(
                child: Icon(IconData(0xee37, fontFamily: 'MaterialIcons')),
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
                Navigator.pop(context);
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
                Navigator.pop(context);
                onClick(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

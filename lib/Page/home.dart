import 'package:flutter/material.dart';
import 'dart:async';
import '../login.dart';
import '../register.dart';
import '../Class/user.dart';
import 'package:proj/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        child: Column(
      children: <Widget>[
        Spacer(),
        Text("Welcome! ${nowUser.userName}", style: TextStyle(fontSize: 24)),
        Text("歡迎使用裝置定位服務", style: TextStyle(fontSize: 24)),
        SizedBox(height: 24.0),
        Image.asset('image/pinkpanther.jpg', width: 300, height: 300),
        SizedBox(height: 24.0),
        SizedBox(
          height: 35.0,
          width: 120.0,
          child: ElevatedButton(
            child: Text('進入註冊系統'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 253, 182, 243)),
            ),
            onPressed: () {
              goToRegisterPage(context);
            },
          ),
        ),
        SizedBox(height: 20.0),
        SizedBox(
          height: 35.0,
          width: 120.0,
          child: ElevatedButton(
            child: Text('直接登入'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 253, 182, 243)),
            ),
            onPressed: () {
              goToLoginPage(context);
            },
          ),
        ),
        Spacer(),
      ],
    ));
  }

  void goToRegisterPage(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  void goToLoginPage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
    setState(() {});
  }
}

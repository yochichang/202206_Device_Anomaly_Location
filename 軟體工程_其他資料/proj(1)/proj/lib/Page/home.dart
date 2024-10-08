import 'package:flutter/material.dart';
import 'dart:async';
import '../login.dart';
import '../register.dart';
import '../Class/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  var userName = ' ';
  var userPassword = ' ';
  var userAccount = ' ';
  User user = User("userName", "userPassword", "userAccount");
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Welcome $userName"),
        SizedBox(
          height: 80.0,
        ),
        ElevatedButton(
          child: Text('進入註冊系統'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 253, 182, 243)),
          ),
          onPressed: () {
            goToRegisterPage(context);
          },
        ),
        ElevatedButton(
          child: Text('直接登入'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 253, 182, 243)),
          ),
          onPressed: () {
            goToLoginPage(context);
          },
        ),
        SizedBox(
          height: 180.0,
        ),
        TextField(),
      ],
    );
  }

  void goToRegisterPage(BuildContext context) async {
    var resultValue = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );

    setState(() {
      userName = resultValue.name;
      userPassword = resultValue.password;
      userAccount = resultValue.account;
      user.set(userName, userPassword, userAccount);
    });
  }

  void goToLoginPage(BuildContext context) async {
    if (userName == ' ') {
      Text("請先注冊");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage(user: user)),
      );
    }
  }
}

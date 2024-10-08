import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Page/getlocation.dart';
import 'Page/device_manager.dart';
import 'Class/user.dart';
import 'package:proj/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final TextEditingController password = new TextEditingController();
  final TextEditingController account = new TextEditingController();

  get flase => null;
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("login system"),
        backgroundColor: Color.fromARGB(255, 106, 77, 95),
        //automaticallyImplyLeading: false,
      ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'GPS',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                  color: Color.fromARGB(255, 87, 68, 79)),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 201, 151, 182)),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration:
                  new BoxDecoration(color: Color.fromARGB(9, 208, 72, 156)),
              child: TextField(
                controller: account,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(29, 192, 150, 200),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(24, 158, 56, 176),
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 117, 51, 110),
                        width: 1.5,
                      ),
                    ),
                    labelText: "user account",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        account.clear();
                      },
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromARGB(136, 92, 93, 94))),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration:
                  new BoxDecoration(color: Color.fromARGB(9, 208, 72, 156)),
              child: TextField(
                  obscureText: _isHidden,
                  controller: password,
                  decoration: InputDecoration(
                      fillColor: Color.fromARGB(29, 192, 150, 200),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(24, 158, 56, 176),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 117, 51, 110),
                          width: 1.5,
                        ),
                      ),
                      labelText: "password",
                      suffixIcon: IconButton(
                        icon: _isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                      ),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(136, 92, 93, 94)))),
            ),
            SizedBox(
              height: 60.0,
            ),
            ElevatedButton(
              child: Text('登入'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 253, 182, 243)),
              ),
              onPressed: () {
                readUser().then((result) {
                  if (result?.userPassword == password.text) {
                    nowUser.userAccount = result?.userAccount;
                    nowUser.userPassword = result?.userPassword;
                    nowUser.userName = result?.userName;
                    Navigator.pop(context);
                  } else {
                    //wrong message
                  }
                });
              },
            )
          ]),
    );
  }

  Future<User?> readUser() async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(account.text);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    }
  }
}

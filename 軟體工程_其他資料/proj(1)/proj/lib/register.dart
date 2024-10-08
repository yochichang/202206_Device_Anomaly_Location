import 'package:flutter/material.dart';
import 'Page/gps.dart';
import 'Page/device_manager.dart';
import 'Class/user.dart';

class RegisterPage extends StatefulWidget {
  // User user;
  // LoginPage({Key? key, required this.user}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final TextEditingController name = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController account = new TextEditingController();

  get flase => null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("login system"),
        backgroundColor: Colors.pink,
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
                  fontFamily: "Pacifico"),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 177, 24, 136)),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "user name",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      name.clear();
                    },
                  ),
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 154, 206, 248))),
            ),
            TextField(
              controller: account,
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: "user account",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      account.clear();
                    },
                  ),
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 154, 206, 248))),
            ),
            TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "password",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        obscureText:
                        flase;
                      },
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 154, 206, 248)))),
            SizedBox(
              height: 60.0,
            ),
            ElevatedButton(
              child: Text('註冊'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 253, 182, 243)),
              ),
              onPressed: () {
                User user = new User(name.text, password.text, account.text);
                Navigator.pop(context, user);
              },
            )
          ]),
    );
  }
}

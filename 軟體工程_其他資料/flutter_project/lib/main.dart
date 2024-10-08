import 'package:flutter/material.dart';
import 'dart:async';
import 'nextPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Location"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController myController_name = new TextEditingController();
  final TextEditingController myController_password =
      new TextEditingController();

  get flase => null;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            controller: myController_name,
            decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: "user name",
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    myController_name.clear();
                  },
                ),
                labelStyle:
                    TextStyle(color: Color.fromARGB(255, 154, 206, 248))),
          ),
          TextField(
              obscureText: true,
              controller: myController_password,
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
          RaisedButton(
            child: Text('登入'),
            onPressed: () {
              if (myController_name.text == 'kyle' &&
                  myController_password.text == '123123')
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BPage(name: "haha")));
            },
            color: Color.fromARGB(255, 243, 166, 213),
          )
        ]);
  }
}

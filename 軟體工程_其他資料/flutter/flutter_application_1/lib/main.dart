import 'package:flutter/material.dart';
import 'dart:async';
import 'nextPage.dart';
//import 'dart:ui';

void main() {
  runApp(MyApp());
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color.fromARGB(255, 106, 77, 95)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Location"),
        ),
        body: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration:
                new BoxDecoration(color: Color.fromARGB(9, 208, 72, 156)),
            child: HomePage()),
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
  final TextEditingController myController_account =
      new TextEditingController();
  final TextEditingController myController_password =
      new TextEditingController();

  get flase => null;

  bool _isHidden = true;

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
          TextField(
            controller: myController_name,
            decoration: InputDecoration(
                fillColor: Color.fromARGB(152, 192, 150, 200),
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
                    color: Color.fromARGB(255, 181, 137, 176),
                    width: 1.5,
                  ),
                ),
                labelText: "user name",
                prefixIcon: Icon(Icons.person,
                    color: Color.fromARGB(153, 255, 255, 255)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close,
                      color: Color.fromARGB(153, 255, 255, 255)),
                  onPressed: () {
                    myController_name.clear();
                  },
                ),
                labelStyle:
                    TextStyle(color: Color.fromARGB(153, 255, 255, 255))),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: myController_account,
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
                prefixIcon: Icon(Icons.account_circle),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    myController_account.clear();
                  },
                ),
                labelStyle: TextStyle(color: Color.fromARGB(136, 92, 93, 94))),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
              obscureText: _isHidden,
              controller: myController_password,
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
                  prefixIcon: Icon(Icons.lock),
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
          SizedBox(
            height: 60.0,
          ),
          RaisedButton(
            child: Text('登入'),
            onPressed: () {
              if (myController_account.text == 'kyle' &&
                  myController_password.text == '123123')
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BPage(name: "haha")));
            },
            color: Color.fromARGB(255, 201, 151, 182),
          ),
          SizedBox(
            height: 10.0,
          ),
        ]);
  }
}

import 'package:flutter/material.dart';

class BPage extends StatelessWidget {
  String name;
  BPage({Key? key, this.name = ""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('hello $name')]),
      ),
    );
  }
}

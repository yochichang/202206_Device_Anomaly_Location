import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proj/Class/device.dart';
import 'package:proj/main.dart';

class deviceManagerPage extends StatefulWidget {
  @override
  _deviceManagerState createState() => _deviceManagerState();
}

class _deviceManagerState extends State<deviceManagerPage> {
  final TextEditingController name = new TextEditingController();
  final TextEditingController distance = new TextEditingController();

  final device = new Device(
    deviceName: '',
    deviceDis: 500,
  );

  late int int_distance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("device system"),
      //   backgroundColor: Color.fromARGB(255, 106, 77, 95),
      //   //automaticallyImplyLeading: false,
      // ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Devices of ${nowUser.userName}',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                  color: Color.fromARGB(255, 87, 68, 79)),
            ),
            SizedBox(
              height: 256,
              child: StreamBuilder<List<Device>>(
                  stream: readDevice(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong! ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final devices = snapshot.data!;

                      return ListView(
                        children: devices.map(buildDevice).toList(),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration:
                  new BoxDecoration(color: Color.fromARGB(9, 208, 72, 156)),
              child: TextField(
                controller: name,
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
                    labelText: "device name",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        name.clear();
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
                controller: distance,
                keyboardType: TextInputType.number,
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
                    labelText: "max distance between device",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        distance.clear();
                      },
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromARGB(136, 92, 93, 94))),
              ),
            ),
            ElevatedButton(
              child: Text('新增'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 253, 182, 243)),
              ),
              onPressed: () {
                device.deviceName = name.text;
                device.deviceDis = int.parse(distance.text);
                device.latitude = 0.0;
                device.longtitude = 0.0;
                createdevice(device);
                name.clear();
                distance.clear();
              },
            )
          ]),
    );
  }

  Future createdevice(Device device) async {
    print('/users/${nowUser.userAccount}');
    final docDevice = FirebaseFirestore.instance
        .collection('/users/${nowUser.userAccount}/devices')
        .doc(device.deviceName);
    final json = device.toJson();
    await docDevice.set(json);
  }

  Stream<List<Device>> readDevice() => FirebaseFirestore.instance
      .collection('/users/${nowUser.userAccount}/devices')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Device.fromJson(doc.data())).toList());

  Widget buildDevice(Device device) => ListTile(
        leading: CircleAvatar(child: Text('Test')),
        title: Text('${device.deviceName}'),
        subtitle: Text(
            'Latest: latitude = ${device.latitude}, longtitude = ${device.longtitude}.'),
      );
}

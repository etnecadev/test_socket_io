import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:socket_io/client.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TestConnect());

//STEP2: Add this function in main function in main.dart file and add incoming data to the stream

//Step3: Build widgets with streambuilder

// class BuildWithSocketStream extends StatelessWidget {
//   const BuildWithSocketStream({Key key}) : super(key: key);

    // connectAndSend() {
    //   print("connect function");
    //   IO.Socket socket = IO.io('https://10.10.0.1:56789');

    //   socket.connect();
    //   socket.onConnect((_) {
    //     print('connect to websocket');
    //     // socket.emit('msg', 'test');
    //   });
    // }
//     // var message =
//     //     '[{"report_head_id":"RF0001","date":"2021-11-10 09:47:00.000","latlngID":"d005868b-8a9e-41be-8c4c-c23861e64e5c","down":"2021-11-10 09:47:00.000","pull":"2021-11-10 10:47:00.000","duration":"1:00","depth":"100","head":"300","ground":"S1","status":"0","createAt":"2021-11-10 09:50:41.554563","idtype":"d005868b-8a9e-41be-8c4c-c23861e64e5c","ddLat":"111.04","ddLng":"222.10","ddm1Lat":null,"ddm2Lat":null,"ddm1Lng":null,"ddm2Lng":null,"dms1Lat":null,"dms2Lat":null,"dms3Lat":null,"dms1Lng":null,"dms2Lng":null,"dms3Lng":null,"latDirection":null,"lngDirection":null,"name":"DD"}]';
//     // socket.emit('Chat', message);
//     // socket.on('event', (data) => print(data));
//     // socket.onDisconnect((_) => print('disconnect'));
//     // socket.on('fromServer', (_) => print(_));
//   }
// }

// }
  }
}

class TestConnect extends StatefulWidget {
  @override
  _TestConnectState createState() => _TestConnectState();
}

class _TestConnectState extends State<TestConnect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              child: Text('Listen'),
              onPressed: () => connectAndListen(),
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text('Send'),
              onPressed: () => connectAndSend(),
            ),
          ),
        ],
      )),
    );
  }

  Future<void> connectAndListen() async {
    Socket socket = await Socket.connect('10.10.0.1', 56789);
    print('connected');
    socket.listen((List<int> event) {
      print(event);
      var decodeBytes = utf8.decode(event);
      print(decodeBytes);
    });
    socket.close();

    // var message = Uint8List(8);
    // var bytedata = ByteData.view(message.buffer);

    // bytedata.setUint8(0, 0x0f);
    // bytedata.setUint8(1, 0x00);
    // bytedata.setUint8(2, 0x00);
    // bytedata.setUint8(3, 0x0d);
    // bytedata.setUint8(4, 0x5D);
    // bytedata.setUint8(5, 0xF0);
    // bytedata.setUint8(6, 0x97);
    // bytedata.setUint8(7, 0x91);

    // socket.add(message);
    // socket.close();
  }

  connectAndSend() async {
    Socket socket = await Socket.connect('10.10.0.1', 56789);
    print('connected');

    // send
    // var message =
    // '[{"report_head_id":"RF0001","date":"2021-11-10 09:47:00.000","latlngID":"d005868b-8a9e-41be-8c4c-c23861e64e5c","down":"2021-11-10 09:47:00.000","pull":"2021-11-10 10:47:00.000","duration":"1:00","depth":"100","head":"300","ground":"S1","status":"0","createAt":"2021-11-10 09:50:41.554563","idtype":"d005868b-8a9e-41be-8c4c-c23861e64e5c","ddLat":"111.04","ddLng":"222.10","ddm1Lat":null,"ddm2Lat":null,"ddm1Lng":null,"ddm2Lng":null,"dms1Lat":null,"dms2Lat":null,"dms3Lat":null,"dms1Lng":null,"dms2Lng":null,"dms3Lng":null,"latDirection":null,"lngDirection":null,"name":"DD"}]';
    var message = Uint8List(4);
    var bytedata = ByteData.view(message.buffer);
    bytedata.setUint8(0, 0x0E);
    bytedata.setUint8(1, 0xA0);
    bytedata.setUint8(2, 0x00);
    bytedata.setUint8(3, 0x01);

    socket.add(message);

    socket.listen((List<int> event) {
      // print(event);
      var decodeBytes = utf8.decode(event);
      print(decodeBytes);
    });

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 5));

    // .. and close the socket
    socket.close();

    // print("Hello");
    // Socket socket = await Socket.connect('10.10.0.1', 56789);
    // IO.Socket socket = IO.io('10.10.0.1', 56789);
    // socket.onConnect((_) {
    //   print('connect');
    //   var message = Uint8List(4);
    //   var bytedata = ByteData.view(message.buffer);
    //   bytedata.setUint8(0, 0x0E);
    //   bytedata.setUint8(1, 0xA0);
    //   bytedata.setUint8(2, 0x00);
    //   bytedata.setUint8(3, 0x01);

    //   socket.emit('msg', bytedata);
    // });

    // List<int> bytes = utf8.encode("ELOGBOOK");
    // print(bytes);
    // var decodeBytes = utf8.decode(bytes);
    // print(decodeBytes);

//     print('connected');
//     var message =
//         '[{"report_head_id":"RF0001","date":"2021-11-10 09:47:00.000","latlngID":"d005868b-8a9e-41be-8c4c-c23861e64e5c","down":"2021-11-10 09:47:00.000","pull":"2021-11-10 10:47:00.000","duration":"1:00","depth":"100","head":"300","ground":"S1","status":"0","createAt":"2021-11-10 09:50:41.554563","idtype":"d005868b-8a9e-41be-8c4c-c23861e64e5c","ddLat":"111.04","ddLng":"222.10","ddm1Lat":null,"ddm2Lat":null,"ddm1Lng":null,"ddm2Lng":null,"dms1Lat":null,"dms2Lat":null,"dms3Lat":null,"dms1Lng":null,"dms2Lng":null,"dms3Lng":null,"latDirection":null,"lngDirection":null,"name":"DD"}]';
    // var message = Uint8List(13);
    // var bytedata = ByteData.view(message.buffer);
    // bytedata.setUint8(0, 0x0F);
    // bytedata.setUint8(1, 0x00);
    // bytedata.setUint8(2, 0x00);
    // bytedata.setUint8(3, 0x01);

    // bytedata.setUint8(4, 0x60);
    // bytedata.setUint8(5, 0x1C);
    // bytedata.setUint8(6, 0xCA);
    // bytedata.setUint8(7, 0x39);

    // bytedata.setUint8(8, 0xA0);
    // bytedata.setUint8(9, 0x00);
    // bytedata.setUint8(10, 0x01);
    // bytedata.setUint8(11, 0x08);
    // bytedata.setUint8(12, 0x32);

    // bytedata.setUint8(12, 0x39);
    // //
    // bytedata.setUint8(13, 0x00);
    // bytedata.setUint8(14, 0x45);
    // bytedata.setUint8(15, 0x00);
    // bytedata.setUint8(16, 0x4C);
    // bytedata.setUint8(17, 0x00);
    // bytedata.setUint8(18, 0x4F);
    // bytedata.setUint8(19, 0x00);
    // bytedata.setUint8(20, 0x47);
    // bytedata.setUint8(21, 0x00);
    // bytedata.setUint8(22, 0x42);
    // bytedata.setUint8(23, 0x00);
    // bytedata.setUint8(24, 0x4F);
    // bytedata.setUint8(25, 0x00);
    // bytedata.setUint8(26, 0x4F);
    // bytedata.setUint8(27, 0x00);
    // bytedata.setUint8(28, 0x4B);

    /// ยิง Send เพื่อเช็คค่าว่ามันรับได้ไหม
    //
    // var message = Uint8List(4);
    // var bytedata = ByteData.view(message.buffer);
    // bytedata.setUint8(0, 0x0E);
    // bytedata.setUint8(1, 0xA0);
    // bytedata.setUint8(2, 0x00);
    // bytedata.setUint8(3, 0x01);

    // socket.add(message);

    // socket.listen((List<int> event) {
    //   print(event);
    //   // var decodeBytes = utf8.decode(event);
    //   // print(decodeBytes);
    // });
  }
}

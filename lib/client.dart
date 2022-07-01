import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  Socket socket;
  String name;
  @override
  void initState() {
    connectAndListen();

    super.initState();
  }

  Future<void> connectAndListen() async {
    final socket = await Socket.connect('localhost', 56789);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    // send some messages to the server
    await sendMessage(socket, 'Knock, knock.');
    await sendMessage(socket, 'Banana');
    await sendMessage(socket, 'Banana');
    await sendMessage(socket, 'Banana');
    await sendMessage(socket, 'Banana');
    await sendMessage(socket, 'Banana');
    await sendMessage(socket, 'Orange');
    await sendMessage(socket, "Orange you glad I didn't say banana again?");
  }

  Future<void> sendMessage(Socket socket, String message) async {
    print('Client: $message');
    socket.write(message);
    
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

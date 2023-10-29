import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessagePage extends StatefulWidget {
  final String? username;
  const MessagePage({super.key, required this.username});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  late IO.Socket _socket;
  final TextEditingController _messageController = TextEditingController();

  _sendMessage() {
    _socket.emit('message',
        {'message': _messageController.text.trim(), 'sender': widget.username});
  }

  _connect() {
    _socket.onConnect((data) => null);
    _socket.onDisconnect((data) => print("Socket disconnceted"));
  }

  @override
  void initState() {
    _socket = IO.io(
        Uri.parse("192.168.100.123:3000"),
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setQuery({"usuario", widget.username} as Map)
            .build());
    _connect();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          children: [
            //Expanded(child: )
          ],
        ),
      ),
    );
  }
}

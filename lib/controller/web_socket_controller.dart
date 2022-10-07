import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocket {

  static List<MessageData> messages = [];

  static TextEditingController messageEditingController =
      TextEditingController();
}

class MessageData {
  String message, userid;
  bool isMe;

  MessageData(
      {required this.message, required this.userid, required this.isMe});
}

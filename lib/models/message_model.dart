import 'package:flutter/cupertino.dart';

class MessageModel {
  String message;
  String sender;
  String dp;
  bool isOnline;
  MessageModel(
      {@required this.message, @required this.sender, this.isOnline, this.dp});
}

import 'package:cloudart/models/message_model.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe, this.msg});

  final String sender;
  final String text;
  final bool isMe;
  final MessageModel msg;

  @override
  Widget build(BuildContext context) {
    return _newChatBuble();
  }

  _newChatBuble() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      color: themeController.isDark ? dBG : Colors.white,
      child: IntrinsicHeight(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          isMe ? _buildMessageBox() : _buildDpBox(),
          isMe ? _buildDpBox() : _buildMessageBox(),
        ]),
      ),
    );
  }

  _buildDpBox() {
    return Align(
      alignment: isMe ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
        child: _buildFrndChatStatus(msg),
      ),
    );
  }

  _buildMessageBox() {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(0.0),
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
            color: isMe
                ? themeController.priClr.withOpacity(0.1)
                : themeController.isDark ? dBG : Colors.white),
        width: SizeConfig.widthMultiplier * 70,
        child: Column(
          children: [
            Text(
              "this is random message for testing purpose, its demo message to check ui of our message.",
              style: TextStyle(
                  fontSize: 14.0,
                  color: themeController.isDark
                      ? Colors.white.withOpacity(0.9)
                      : Color(0xFF484848)),
            ),
            SizedBox(height: isMe ? 8.0 : 16.0),
            _buildInfoRow(),
          ],
        ));
  }

  _buildInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isMe ? _msgTimeText() : _userNameText(),
        isMe ? _userNameText() : _msgTimeText(),
      ],
    );
  }

  _userNameText() {
    return Text(
      sender,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: themeController.priClr),
    );
  }

  _msgTimeText() {
    return Text(
      "Today at 5:00 PM",
      style: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF9A9A9A)),
    );
  }

  _oldChatBuble() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.greenAccent[100] : Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.black : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildFrndChatStatus(MessageModel msg) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 22.0,
            child: Image.asset(msg.dp),
          ),
          Positioned(
              bottom: 4.0,
              right: 0.0,
              child: CircleAvatar(
                radius: 5.0,
                backgroundColor: themeController.isDark ? dBG : Colors.white,
                child: CircleAvatar(
                    radius: 4.0,
                    backgroundColor:
                        msg.isOnline ? themeController.priClr : Colors.grey),
              ))
        ],
      ),
    );
  }
}

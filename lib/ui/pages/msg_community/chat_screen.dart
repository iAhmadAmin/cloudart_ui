import 'package:cloudart/ui/constants/constants.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:cloudart/ui/widgets/message_stream.dart';

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  String messageText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: myGreenClr,
        title: Text("Chat"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MessagesStream(),
          Container(
            decoration: kMessageContainerDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageTextController,
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                FlatButton(
                  // onPressed: () {
                  //   setState(() {
                  //     messagesList.add(
                  //       MessageModel(
                  //           dp: "assets/images/dp.png",
                  //           isOnline: true,
                  //           message: messageTextController.text,
                  //           sender: "ammy"),
                  //     );
                  //     messageTextController.clear();
                  //   });
                  // },
                  child: Text(
                    'Send',
                    style: kSendButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

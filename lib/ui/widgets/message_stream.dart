import 'package:cloudart/models/data.dart';
import 'package:cloudart/ui/widgets/message_buble.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  List<MessageBubble> messageBubbles = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: messagesList.length,
          itemBuilder: (context, index) {
            final MessageBubble messageBubble = MessageBubble(
              isMe: messagesList[index].sender == "ammy" ? true : false,
              sender: messagesList[index].sender,
              text: messagesList[index].message,
              msg: messagesList[index],
            );
            return messageBubble;
          }),
    );
  }
}

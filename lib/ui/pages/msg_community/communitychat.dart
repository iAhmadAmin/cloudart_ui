import 'package:cloudart/models/community.dart';
import 'package:cloudart/models/data.dart';
import 'package:cloudart/models/frndchat.dart';
import 'package:cloudart/ui/constants/constants.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:cloudart/ui/widgets/message_stream.dart';
import 'package:flutter/material.dart';

class CommunityChatPage extends StatefulWidget {
  final Community community;
  CommunityChatPage({@required this.community});
  @override
  _CommunityChatPageState createState() => _CommunityChatPageState();
}

class _CommunityChatPageState extends State<CommunityChatPage> {
  final messageTextController = TextEditingController();
  String messageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.isDark ? dBG : Colors.white,
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        child: Column(
          children: [
            _buildHeader(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              height: 72,
              width: SizeConfig.widthMultiplier * 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: frndChats.length,
                itemBuilder: (context, index) {
                  FrndChat frndChat = frndChats[index];
                  return _buildFrndChatStatus(frndChat, 36.0);
                },
              ),
            ),
            _buildChat(),
          ],
        ),
      ),
    );
  }

  _buildChat() {
    return Expanded(
      child: Container(
        child: Column(
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
                  // FlatButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       messagesList.add(
                  //         MessageModel(message: messageText, sender: "ammy"),
                  //       );
                  //       messageTextController.clear();
                  //     });
                  //   },
                  //   child: Text(
                  //     'Send',
                  //     style: kSendButtonTextStyle,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.only(
          bottom: 10.0,
          right: SizeConfig.widthMultiplier * 5,
          left: SizeConfig.widthMultiplier * 6,
          top: SizeConfig.heightMultiplier * 5),
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
          gradient: themeController.getGrad(),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            // bottomRight: Radius.circular(50.0),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
          Text(
            "Friends",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Text(
              "+ ADD USER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(width: 12.0)
        ],
      ),
    );
  }

  _buildFrndChatStatus(FrndChat frndChat, double rad) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        children: [
          CircleAvatar(
            radius: rad,
            child: Image.asset(frndChat.imgPath),
          ),
          Positioned(
              bottom: 4.0,
              right: 4.0,
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: themeController.isDark ? dBG : Colors.white,
                child: CircleAvatar(
                    radius: 5.5,
                    backgroundColor: frndChat.isOnline
                        ? themeController.priClr
                        : Colors.grey),
              ))
        ],
      ),
    );
  }
}

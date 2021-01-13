import 'package:cloudart/models/data.dart';
import 'package:cloudart/models/frndchat.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class PrivateMessage extends StatefulWidget {
  @override
  _PrivateMessageState createState() => _PrivateMessageState();
}

class _PrivateMessageState extends State<PrivateMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeController.isDark ? dBG : Colors.white,
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 4.0),
          height: 70,
          width: SizeConfig.widthMultiplier * 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: frndChats.length,
            itemBuilder: (context, index) {
              FrndChat frndChat = frndChats[index];
              return _buildFrndChatStatus(frndChat);
            },
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.only(right: 12.0),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: frndChats.length + 2,
              itemBuilder: (context, index) {
                if (index < frndChats.length) {
                  FrndChat frndChat = frndChats[index];
                  return _buildFrndChatTile(frndChat);
                } else {
                  return Container(
                    height: 100.0,
                    width: 100.0,
                  );
                }
              }),
        )),
      ]),
    );
  }

  _buildFrndChatTile(FrndChat frndChat) {
    return Container(
        height: 80.0,
        width: SizeConfig.widthMultiplier * 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildFrndChatStatus(frndChat),
            SizedBox(width: 12.0),
            Container(
              width: SizeConfig.widthMultiplier * 45,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      frndChat.name,
                      style: TextStyle(
                          color: themeController.isDark
                              ? Colors.white.withOpacity(0.9)
                              : Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      frndChat.latestMsg,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ]),
            ),
            Spacer(),
            Text(
              frndChat.lastMsgTime,
              style: TextStyle(
                color: themeController.isDark
                    ? Colors.white.withOpacity(0.9)
                    : Colors.black,
              ),
            )
          ],
        ));
  }

  _buildFrndChatStatus(FrndChat frndChat) {
    return Container(
      margin: EdgeInsets.only(left: 12.0),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 34.0,
            child: Image.asset(frndChat.imgPath),
          ),
          Positioned(
              bottom: 4.0,
              right: 4.0,
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: themeController.isDark ? dBG : Colors.white,
                child: CircleAvatar(
                    radius: 4.8,
                    backgroundColor: frndChat.isOnline
                        ? themeController.priClr
                        : Colors.grey),
              ))
        ],
      ),
    );
  }
}

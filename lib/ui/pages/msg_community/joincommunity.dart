import 'package:cloudart/models/data.dart';
import 'package:cloudart/models/event.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class JoinCommunityPage extends StatefulWidget {
  @override
  _JoinCommunityPageState createState() => _JoinCommunityPageState();
}

class _JoinCommunityPageState extends State<JoinCommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.isDark ? dBG : Colors.white,
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: themeController.isDark ? dBG : Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("One Piece",
                            style: TextStyle(
                                color: themeController.isDark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Community",
                                style: TextStyle(
                                    color: themeController.priClr,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500)),
                            Text("1.5K Members",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                )),
                          ],
                        ),
                        _buildMemberCircles(),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text("About",
                            style: TextStyle(
                                color: themeController.isDark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                            "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text("Admins",
                            style: TextStyle(
                                color: themeController.priClr,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 4.0),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 33.0,
                              backgroundColor: myGreenClr,
                              child: Image.asset("assets/images/a.png"),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            CircleAvatar(
                              radius: 33.0,
                              backgroundColor: myGreenClr,
                              child: Image.asset("assets/images/b.png"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Events",
                                style: TextStyle(
                                    color: themeController.isDark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500)),
                            Text("10 Events",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    height: 160,
                    color: themeController.isDark ? dBG : Colors.white,
                    width: SizeConfig.widthMultiplier * 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          Event event = events[index];
                          return _buildEventTile(event: event);
                        }),
                  ),
                  SizedBox(height: 50.0),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  _buildEventTile({Event event}) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      height: 160.0,
      width: 110.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
            height: 115.0,
            width: 110.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(event.imgPath, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(event.eventName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400)),
          Text(event.location,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w300))
        ],
      ),
    );
  }

  _buildMemberCircles() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 70.0,
      width: SizeConfig.widthMultiplier * 95,
      child: Stack(
        children: [
          _buildDpCrcle(imgPath: "assets/images/a.png"),
          _buildDpCrcle(isPos: true, i: 1, imgPath: "assets/images/b.png"),
          _buildDpCrcle(isPos: true, i: 1.8, imgPath: "assets/images/c.png"),
          _buildDpCrcle(isPos: true, i: 2.6, imgPath: "assets/images/d.png"),
          _buildDpCrcle(isPos: false, i: 3.4, imgPath: "assets/images/b.png")
        ],
      ),
    );
  }

  _buildDpCrcle({bool isPos, double i, String imgPath}) {
    return Positioned(
      left: isPos != null ? (70 * i) - 10 : 0,
      child: CircleAvatar(
        radius: 35.0,
        backgroundColor: themeController.isDark ? dBG : Colors.white,
        child: CircleAvatar(
          radius: 33.0,
          backgroundColor: myGreenClr,
          child: isPos != false
              ? Image.asset(imgPath)
              : Stack(children: [
                  Image.asset(imgPath),
                  CircleAvatar(
                      radius: 33.0,
                      backgroundColor: Colors.black.withOpacity(0.4),
                      child: Text(
                        "More",
                        style: TextStyle(color: Colors.white),
                      ))
                ]),
          // isPos == false
          //     ? Text(
          //         "More",
          //         style: TextStyle(color: Colors.white),
          //       )
          //     : Image.asset(imgPath),
        ),
      ),
    );
  }

  _buildHeader() {
    return Container(
        height: SizeConfig.heightMultiplier * 32,
        width: SizeConfig.widthMultiplier * 100,
        color: themeController.isDark ? dBG : Colors.white,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 30, 12, 16),
              height: SizeConfig.heightMultiplier * 28,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                image: DecorationImage(
                  image: AssetImage('assets/images/arta.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                right: 20.0,
                bottom: 8.0,
                child: Container(
                  height: 40.0,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: themeController.priClr),
                  child: Center(
                    child: Text(
                      "Join Now",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )),
          ],
        ));
  }
}

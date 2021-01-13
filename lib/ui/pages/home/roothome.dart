import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/pages/msg_community/chat_home.dart';
import 'package:cloudart/ui/pages/home/gallery_page.dart';
import 'package:cloudart/ui/pages/home/homepage.dart';
import 'package:cloudart/ui/pages/msg_community/search_community.dart';
import 'package:cloudart/ui/pages/profile/user_profile.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class RootHomePage extends StatefulWidget {
  @override
  _RootHomePageState createState() => _RootHomePageState();
}

class _RootHomePageState extends State<RootHomePage> {
  bool isMenuOpened = false;
  bool isDT = themeController.isDark;

  int selectedTab = 1;
  getSelectedPage() {
    switch (selectedTab) {
      case 0:
        return GalleryPage();
      case 1:
        return HomePage();
      case 2:
        return ChatHome();
      case 3:
        return SearchCommunity();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDT ? dBG : Colors.white,
      floatingActionButton: selectedTab != 3
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                isMenuOpened ? addMenuDialog() : Container(),
                SizedBox(
                  height: 10.0,
                ),
                FloatingActionButton(
                  backgroundColor:
                      isMenuOpened ? Color(0xFFFF6060) : themeController.priClr,
                  child: Icon(isMenuOpened ? Icons.close : Icons.add),
                  foregroundColor: isDT ? dBG : Colors.white,
                  onPressed: () {
                    setState(() {
                      isMenuOpened = !isMenuOpened;
                    });
                  },
                ),
                SizedBox(
                  height: 60.0,
                )
              ],
            )
          : Container(),
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        child: Column(
          children: [
            _buildHomeHeader(),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        width: SizeConfig.widthMultiplier * 100,
                        height: SizeConfig.heightMultiplier * 100,
                        child: getSelectedPage(),
                      )),
                  Positioned(
                      bottom: 0, right: 0, left: 0, child: _buildBottomNavBar())
                ],
              ),
            ),
            // Expanded(
            //   child: getSelectedPage(),
            // ),
            // _buildBottomNavBar(),
          ],
        ),
      ),
    );
  }

  _buildHomeHeader() {
    return Container(
      padding: EdgeInsets.only(
          bottom: 10.0,
          right: SizeConfig.widthMultiplier * 5,
          left: SizeConfig.widthMultiplier * 10,
          top: SizeConfig.heightMultiplier * 5),
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [themeController.priClr, themeController.priClr]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            // bottomRight: Radius.circular(50.0),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            selectedTab == 1
                ? "Hello, John Smith!"
                : selectedTab == 0
                    ? "CloudArt Gallery"
                    : selectedTab == 3
                        ? "Communities"
                        : "Chat",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTab = 3;
                  });
                },
                child: Image.asset(
                  "assets/images/search.png",
                  height: 32.0,
                ),
              ),
              SizedBox(width: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UserProfilePage();
                      },
                    ),
                  );
                },
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          height: 38.0,
                          width: 38.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: themeController.priClr),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/images/c5.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: CircleAvatar(
                            radius: 5.0,
                            backgroundColor: themeController.priClr,
                            child: CircleAvatar(
                              radius: 4.0,
                              backgroundColor: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildBottomNavBar() {
    return Container(
      height: 55.0,
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
          color: isDT ? dBG : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomNavBtn(
            onTap: () {
              setState(() {
                selectedTab = 0;
              });
            },
            label: "Gallery",
            isSelected: selectedTab == 0 ? true : false,
            imgPath: selectedTab == 0
                ? "assets/images/gals.png"
                : "assets/images/gal.png",
          ),
          _buildBottomNavBtn(
            label: "Home",
            isSelected: selectedTab == 1 ? true : false,
            imgPath: selectedTab == 1
                ? "assets/images/homes.png"
                : "assets/images/home.png",
            onTap: () {
              setState(() {
                selectedTab = 1;
              });
            },
          ),
          _buildBottomNavBtn(
            label: "Chat",
            isSelected: selectedTab == 2 ? true : false,
            imgPath: selectedTab == 2
                ? "assets/images/chats.png"
                : "assets/images/chat.png",
            onTap: () {
              setState(() {
                selectedTab = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  _buildBottomNavBtn(
      {String label, String imgPath, isSelected, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isSelected
                ? Container(
                    padding: EdgeInsets.only(bottom: 6.0),
                    height: 2.0,
                    width: 30.0,
                    color: myGreenClr,
                  )
                : Container(
                    padding: EdgeInsets.only(bottom: 4.0),
                  ),
            SizedBox(height: 6.0),
            Image.asset(imgPath, height: 22.0),
            Text(
              label,
              style: TextStyle(
                  fontSize: 12.0,
                  color: isSelected ? myGreenClr : Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }

  Widget addMenuDialog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: 220.0,
          width: 55 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
              color: isDT ? dBG : Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2.0,
                  blurRadius: 2.0,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildAddMenuItem(
                  label: "Scan", imgPath: "assets/images/scan.png"),
              _buildAddMenuItem(
                  label: "Import", imgPath: "assets/images/imp.png"),
              _buildAddMenuItem(
                  label: "Create", imgPath: "assets/images/pen.png"),
              _buildAddMenuItem(
                  label: "Personal gallery", imgPath: "assets/images/per.png"),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 18.0),
          child: Triangle.isosceles(
            edge: Edge.BOTTOM,
            child: Container(
              color: isDT ? dBG : Colors.white,
              width: 20.0,
              height: 10.0,
            ),
          ),
        ),
      ],
    );
  }

  _buildAddMenuItem({String label, String imgPath}) {
    return Container(
      height: 50.0,
      child: Row(children: [
        Image.asset(
          imgPath,
          height: 20.0,
        ),
        SizedBox(width: 10.0),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
        )
      ]),
    );
  }
}

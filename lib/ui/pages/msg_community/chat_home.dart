import 'package:cloudart/controllers/theme_controller.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/msg_community/discussion.dart';
import 'package:cloudart/ui/pages/msg_community/privatemessage.dart';
import 'package:cloudart/ui/pages/msg_community/community.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:cloudart/ui/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  var themeController = Get.put(ThemeController());

  int selectedTab = 0;

  List<String> tabList = [
    "Community",
    "Private Message",
    "Discussion",
  ];

  getSelectedTab() {
    switch (selectedTab) {
      case 0:
        return CommunityPage();
      case 1:
        return PrivateMessage();
      case 2:
        return DiscussionPage();
    }
  }

  _buildTopTabItem({String label, bool isSelected, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: themeController.isDark ? dBG : Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: isSelected
                    ? getSelectedStyle(
                        themeController.isDark
                            ? Colors.white.withOpacity(0.9)
                            : Color(0xFF1D1A1A),
                      )
                    : kProfileTabStyle,
              ),
              isSelected
                  ? Container(
                      padding: EdgeInsets.only(top: 3.0),
                      height: 4.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: themeController.priClr,
                      ),
                    )
                  : SizedBox(),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 100,
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 60.0,
            width: SizeConfig.widthMultiplier * 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tabList.length,
                itemBuilder: (context, index) {
                  return _buildTopTabItem(
                      isSelected: index == selectedTab ? true : false,
                      label: tabList[index],
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      });
                }),
          ),
          Expanded(child: getSelectedTab()),
        ],
      ),
    );
  }
}

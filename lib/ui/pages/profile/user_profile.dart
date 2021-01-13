import 'package:cloudart/controllers/theme_controller.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/profile/aboutme_tab.dart';
import 'package:cloudart/ui/pages/profile/activity_tab.dart';
import 'package:cloudart/ui/pages/profile/artist_tab.dart';
import 'package:cloudart/ui/pages/profile/followers_tab.dart';
import 'package:cloudart/ui/pages/profile/mygallery_tab.dart';
import 'package:cloudart/ui/pages/profile/settings_tab.dart';
import 'package:cloudart/ui/pages/profile/shopart_tab.dart';
import 'package:cloudart/ui/pages/profile/stats_tab.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:cloudart/ui/styles/textstyles.dart';
import 'package:cloudart/ui/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class UserProfilePage extends StatefulWidget {
  final int selectedTab;
  UserProfilePage({this.selectedTab});
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  var themeController = Get.put(ThemeController());

  int selectedTab = 1;

  @override
  void initState() {
    //signOutGoogle();
    selectedTab = widget.selectedTab == null ? 1 : widget.selectedTab;
    super.initState();
  }

  getSelectedTab() {
    switch (selectedTab) {
      case 0:
        return MyGalleryTab();
      case 1:
        return AboutMeTab();
      case 2:
        return ActivitiesTab();
      case 3:
        return StatisticsTab();
      case 4:
        return SettingsTab();
      case 5:
        return ShopArtTab();
      case 6:
        return FollowersTab();
      case 7:
        return ArtistTab();
    }
  }

  List<String> tabList = [
    "My Gallery",
    "About Me",
    "Activities",
    "Statistics",
    "Settings",
    "Shop Art",
    "Followers",
    "Artists"
  ];

  _buildTopTabItem({String label, bool isSelected, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
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
    return Scaffold(
      backgroundColor: themeController.isDark ? dBG : Colors.white,
      body: GetBuilder<ThemeController>(builder: (_) {
        return Container(
          height: SizeConfig.heightMultiplier * 100,
          width: SizeConfig.widthMultiplier * 100,
          child: Column(
            children: [
              ProfileHeader(),
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
              Expanded(child: getSelectedTab())
            ],
          ),
        );
      }),
    );
  }
}

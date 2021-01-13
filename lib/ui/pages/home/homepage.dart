import 'package:cloudart/controllers/theme_controller.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/home/mostcommented.dart';
import 'package:cloudart/ui/pages/home/mostliked.dart';
import 'package:cloudart/ui/pages/home/mostviewd.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:cloudart/ui/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var themeController = Get.put(ThemeController());

  int selectedTab = 0;

  List<String> tabList = [
    "Most Viewed",
    "Most Commented",
    "Most Liked",
  ];

  getSelectedTab() {
    switch (selectedTab) {
      case 0:
        return MostViewed();
      case 1:
        return MostCommented();
      case 2:
        return MostLiked();
    }
  }

  _buildTopTabItem({String label, bool isSelected, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: themeController.isDark ? dBG : Colors.white,
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
      backgroundColor: themeController.isDark ? dBG : Colors.grey[100],
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        decoration:
            BoxDecoration(color: themeController.isDark ? dBG : Colors.white),
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
      ),
    );
  }
}

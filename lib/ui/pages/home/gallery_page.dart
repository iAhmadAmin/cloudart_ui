import 'package:cloudart/controllers/theme_controller.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:cloudart/ui/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/instance_manager.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  var themeController = Get.put(ThemeController());

  int selectedTab = 0;

  List<String> tabList = [
    "Top",
    "Most Liked",
    "Most Viewed",
    "Most Commented",
  ];

  getSelectedTab() {
    switch (selectedTab) {
      case 0:
        return TopGallery();
      case 1:
        return TopGallery();
      case 2:
        return TopGallery();
      case 3:
        return TopGallery();
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
    );
  }
}

class TopGallery extends StatefulWidget {
  @override
  _TopGalleryState createState() => _TopGalleryState();
}

class _TopGalleryState extends State<TopGallery> {
  List<String> artsPath = [
    "assets/images/art1.png",
    "assets/images/art3.png",
    "assets/images/art4.png",
    "assets/images/art5.png",
    "assets/images/art2.png",
    "assets/images/art6.png",
    "assets/images/art7.png",
    "assets/images/art8.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeController.isDark ? dBG : Colors.white,
      child: StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 4,
        itemCount: artsPath.length + 2,
        itemBuilder: (context, i) {
          if (i < artsPath.length) {
            String imgPath = artsPath[i];
            return Material(
              elevation: 0.0,
              borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(imgPath, fit: BoxFit.cover)),
            );
          } else {
            return Container(
              height: 50.0,
              width: 60.0,
            );
          }
        },
        staggeredTileBuilder: (i) =>
            new StaggeredTile.count(2, i.isEven ? 2 : 3),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}

import 'package:cloudart/models/community.dart';
import 'package:cloudart/models/data.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:cloudart/ui/widgets/community_tile.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: themeController.isDark ? dBG : Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(communities.length + 5, (index) {
            if (index < searchComm.length) {
              Community community = searchComm[index];
              return CommunityTile(
                community: community,
                isSearchComm: false,
              );
            } else {
              return Container(
                width: SizeConfig.widthMultiplier * 30,
                height: 100.0,
              );
            }
          }),
        ));
  }
}

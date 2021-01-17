import 'package:cloudart/models/data.dart';
import 'package:cloudart/models/follower.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:flutter/material.dart';

class ArtistTab extends StatefulWidget {
  @override
  _ArtistTabState createState() => _ArtistTabState();
}

class _ArtistTabState extends State<ArtistTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: Text(
                "New Artists",
                style: TextStyle(
                    color: themeController.isDark
                        ? Colors.white.withOpacity(0.9)
                        : Color(0xFF1D1A1A),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 4.0),
                height: 112,
                width: SizeConfig.widthMultiplier * 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: followers.length,
                    itemBuilder: (context, index) {
                      Follower follower = followers[index];
                      return _buildNewFollower(follower);
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Artists",
                    style: TextStyle(
                        color: themeController.isDark
                            ? Colors.white.withOpacity(0.9)
                            : Color(0xFF1D1A1A),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Manage",
                    style: TextStyle(
                        color: themeController.priClr,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Container(
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                itemCount: followers.length,
                itemBuilder: (context, index) {
                  Follower follower = followers[index];
                  return _buildFollower(follower);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildFollower(Follower follower) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: SizeConfig.heightMultiplier * 4.5,
            backgroundImage: AssetImage(follower.imgPath),
          ),
          SizedBox(
            width: 12.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                follower.name,
                style: TextStyle(
                    color: themeController.isDark
                        ? Colors.white.withOpacity(0.9)
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                follower.username,
                style: TextStyle(
                    color: Color(0xFFB1B1B1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildNewFollower(Follower follower) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: SizeConfig.heightMultiplier * 4.5,
            backgroundImage: AssetImage(follower.imgPath),
          ),
          Text(
            follower.name,
            style: TextStyle(
                color: themeController.isDark
                    ? Colors.white.withOpacity(0.9)
                    : Color(0xFF1D1A1A),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // _buildFollowerAndSubs() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 10.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         _buildNumber("Followers", "12K"),
  //         Container(
  //           height: 60.0,
  //           width: 3.0,
  //           color: Colors.grey[300],
  //         ),
  //         _buildNumber("Subscribes", "1.5K"),
  //       ],
  //     ),
  //   );
  // }

  // _buildNumber(String label, String num) {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Text(
  //           num,
  //           style: TextStyle(
  //               color: myGreenClr,
  //               fontSize: SizeConfig.heightMultiplier * 5,
  //               fontWeight: FontWeight.w600),
  //         ),
  //         Text(
  //           label,
  //           style: TextStyle(
  //               color: Colors.grey,
  //               fontSize: SizeConfig.heightMultiplier * 2.5,
  //               fontWeight: FontWeight.w400),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

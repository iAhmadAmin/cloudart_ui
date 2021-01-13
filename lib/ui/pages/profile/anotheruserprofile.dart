import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnotherUserProfilePage extends StatefulWidget {
  @override
  _AnotherUserProfilePageState createState() => _AnotherUserProfilePageState();
}

class _AnotherUserProfilePageState extends State<AnotherUserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            _buildProfileHeader(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Creations",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                      )),
                  Text("View All",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                      )),
                ],
              ),
            ),
            _buildGalleryView(),
          ],
        ),
      ),
    );
  }

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

  _buildGalleryView() {
    return Expanded(
        child: Container(
      child: StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 4,
        itemCount: artsPath.length,
        itemBuilder: (context, i) {
          String imgPath = artsPath[i];
          return Material(
            elevation: 0.0,
            borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(imgPath, fit: BoxFit.cover)),
          );
        },
        staggeredTileBuilder: (i) =>
            new StaggeredTile.count(2, i.isEven ? 2 : 3),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    ));
  }

  _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.only(
          bottom: 20.0,
          right: SizeConfig.widthMultiplier * 5,
          left: SizeConfig.widthMultiplier * 5,
          top: SizeConfig.heightMultiplier * 6),
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
          gradient: themeController.getGrad(),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            // bottomRight: Radius.circular(50.0),
          )),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: SizeConfig.heightMultiplier * 5,
                      backgroundImage: AssetImage("assets/images/dp.png"),
                    ),
                    Text(
                      "Name Here",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.heightMultiplier * 3.5,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 10,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCounter(label: "Total Likes", counts: "15M"),
              _buildCounter(label: "Followers", counts: "12K"),
              _buildCounter(label: "Subscribes", counts: "4.5K"),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSocialBtn(label: "Subscribe"),
              _buildSocialBtn(label: "Send"),
              _buildSocialBtn(label: "ShopArt"),
            ],
          )
        ],
      ),
    );
  }

  _buildSocialBtn({String label, Function onTap}) {
    return Container(
      height: 40.0,
      width: SizeConfig.widthMultiplier * 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: themeController.priClr),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  _buildCounter({String label, String counts}) {
    return Column(
      children: [
        Text(
          counts,
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        Text(
          label,
          style: TextStyle(
              color: Colors.grey[100],
              fontSize: 14.0,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

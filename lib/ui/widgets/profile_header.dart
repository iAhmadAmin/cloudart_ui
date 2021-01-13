import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/pages/home/roothome.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
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
              color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: 10.0,
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return RootHomePage();
                  }));
                },
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 6,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "John Smith",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      radius: SizeConfig.heightMultiplier * 6,
                      backgroundImage: AssetImage("assets/images/dp.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
          // SizedBox(
          //   height: 20.0,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: SizeConfig.widthMultiplier * 3,
              ),
              _buildCounter(label: "Total Likes", counts: "15M"),
              Container(
                height: 30.0,
                width: 1.0,
                color: Colors.white54,
              ),
              _buildCounter(label: "Followers", counts: "12K"),
              Container(
                height: 30.0,
                width: 1.0,
                color: Colors.white54,
              ),
              _buildCounter(label: "Subscribes", counts: "4.5K"),
            ],
          ),
        ],
      ),
    );
  }
}

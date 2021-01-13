import 'package:cloudart/controllers/theme_controller.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/styles/textstyles.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class StatisticsTab extends StatefulWidget {
  @override
  _StatisticsTabState createState() => _StatisticsTabState();
}

class _StatisticsTabState extends State<StatisticsTab> {
  var themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Revenue",
              style: getHeadingStyle(
                themeController.isDark
                    ? Colors.white.withOpacity(0.8)
                    : Color(0xFF1D1A1A),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consetet adips elitrised diam nonumy eirmod tempor invidunabore et dolore magna aliquyam",
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7D7D7D)),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
                height: 100.0,
                width: SizeConfig.widthMultiplier * 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: themeController.priClr.withOpacity(0.2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildNumber("Total View", "50M"),
                    _buildNumber("Donations", "\$1.6M"),
                    _buildNumber("Ranking", "4th"),
                  ],
                )),
            SizedBox(
              height: 20.0,
            ),
            _buildGraphPortion(),
          ],
        ),
      ),
    );
  }

  _buildGraphPortion() {
    return Container(
      height: 300.0,
      width: SizeConfig.widthMultiplier * 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Overview",
                style: TextStyle(
                    color: themeController.isDark
                        ? Colors.white.withOpacity(0.9)
                        : Colors.black,
                    fontSize: SizeConfig.heightMultiplier * 3,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Followers",
                style: TextStyle(
                    color: themeController.priClr,
                    fontSize: SizeConfig.heightMultiplier * 2.6,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          _buildGraph(),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "27 Oct 2020",
                style: TextStyle(
                    color: themeController.isDark
                        ? Colors.white.withOpacity(0.9)
                        : Colors.black,
                    fontSize: SizeConfig.heightMultiplier * 2.6,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Today",
                style: TextStyle(
                    color: themeController.priClr,
                    fontSize: SizeConfig.heightMultiplier * 2.4,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGraphBottomText(clr: Colors.pinkAccent, label: "Views"),
              _buildGraphBottomText(clr: Colors.blueAccent, label: "Ad View"),
              _buildGraphBottomText(
                  clr: Colors.greenAccent, label: "Followers"),
              _buildGraphBottomText(
                  clr: Colors.purpleAccent, label: "Comments"),
              _buildGraphBottomText(
                  clr: Colors.orangeAccent, label: "Donations"),
            ],
          ),
        ],
      ),
    );
  }

  _buildGraph() {
    return Container(
      height: 180.0,
      width: SizeConfig.widthMultiplier * 100,
      child: Column(
        children: [
          _buildGraphLine(num: "100"),
          _buildGraphLine(num: "80"),
          _buildGraphLine(num: "60"),
          _buildGraphLine(num: "40"),
          _buildGraphLine(num: "20"),
        ],
      ),
    );
  }

  _buildGraphLine({String num}) {
    return Container(
      width: SizeConfig.widthMultiplier * 100,
      height: 35.0,
      child: Row(
        children: [
          Text(
            num,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 4.0,
          ),
          DottedLine(
            direction: Axis.horizontal,
            lineLength: SizeConfig.widthMultiplier * 76,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: Colors.grey,
            dashRadius: 0.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          ),
        ],
      ),
    );
  }

  _buildGraphBottomText({String label, Color clr}) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: clr,
          radius: SizeConfig.widthMultiplier * 0.8,
        ),
        SizedBox(
          width: 1.0,
        ),
        Text(label,
            style: TextStyle(
                fontSize: SizeConfig.widthMultiplier * 3,
                fontWeight: FontWeight.w400,
                color: Colors.grey[800])),
      ],
    );
  }

  _buildNumber(String label, String num) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            num,
            style: TextStyle(
                color: themeController.priClr,
                fontSize: SizeConfig.heightMultiplier * 4,
                fontWeight: FontWeight.w600),
          ),
          Text(
            label,
            style: TextStyle(
                color: themeController.isDark
                    ? Colors.white.withOpacity(0.9)
                    : Colors.black,
                fontSize: SizeConfig.heightMultiplier * 2.2,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

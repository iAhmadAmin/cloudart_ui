import 'package:cloudart/controllers/theme_controller.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/profile/payment_detail.dart';
import 'package:cloudart/ui/pages/profile/user_profile.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:cloudart/ui/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  var themeController = Get.put(ThemeController());

  bool isNotification = true;
  bool isTheme = true;
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment Details",
                  style: getHeadingStyle(
                    themeController.isDark
                        ? Colors.white.withOpacity(0.8)
                        : Color(0xFF1D1A1A),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PaymentDetail();
                    }));
                  },
                ),
              ],
            ),
            Text(
              "Lorem ipsum dolor sit amet consetetur sadipscing elitr, sed diam",
              style: kParaStyle,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications",
                    style: getHeadingStyle(
                      themeController.isDark
                          ? Colors.white.withOpacity(0.8)
                          : Color(0xFF1D1A1A),
                    )),
                Switch(
                  value: isNotification,
                  activeColor: themeController.priClr,
                  onChanged: (val) {
                    setState(() {
                      isNotification = !isNotification;
                    });
                  },
                )
              ],
            ),
            Text(
              "Lorem ipsum dolor sit amet consetetur sadipscing elitr, sed diam",
              style: kParaStyle,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Themes",
                  style: getHeadingStyle(
                    themeController.isDark
                        ? Colors.white.withOpacity(0.8)
                        : Color(0xFF1D1A1A),
                  ),
                ),
                Switch(
                  value: themeController.switchTheme,
                  activeColor: themeController.priClr,
                  onChanged: (val) {
                    themeController.themeSwitcher();
                  },
                )
              ],
            ),
            Text(
              "Lorem ipsum dolor sit amet consetetur sadipscing elitr, sed diam",
              style: kParaStyle,
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildThemeSelection(clrNo: 0),
                _buildThemeSelection(clrNo: 1),
                _buildThemeSelection(clrNo: 2),
                _buildThemeSelection(clrNo: 3),
                _buildThemeSelection(clrNo: 4),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(children: [
              _buildThemeSelection(clrNo: 5),
              _buildThemeSelection(clrNo: 6),
            ]),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Theme",
                  style: getHeadingStyle(
                    themeController.isDark
                        ? Colors.white.withOpacity(0.8)
                        : Color(0xFF1D1A1A),
                  ),
                ),
                Switch(
                  value: themeController.isDark,
                  activeColor: themeController.priClr,
                  onChanged: (val) {
                    themeController.darkThemeSwitcher();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return UserProfilePage(
                        selectedTab: 4,
                      );
                    }));
                  },
                )
              ],
            ),
            Text(
              "Lorem ipsum dolor sit amet consetetur sadipscing elitr, sed diam",
              style: kParaStyle,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Help",
                  style: getHeadingStyle(
                    themeController.isDark
                        ? Colors.white.withOpacity(0.8)
                        : Color(0xFF1D1A1A),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Text(
              "Lorem ipsum dolor sit amet consetetur sadipscing elitr, sed diam",
              style: kParaStyle,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Authorizations",
              style: getHeadingStyle(
                themeController.isDark
                    ? Colors.white.withOpacity(0.8)
                    : Color(0xFF1D1A1A),
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet consetetur sadipscing elitr, sed diam",
              style: kParaStyle,
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  _buildThemeSelection({@required int clrNo}) {
    return GestureDetector(
      onTap: () {
        if (themeController.switchTheme) {
          themeController.changeClr(clrNo);
        } else {}
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: SizeConfig.heightMultiplier * 8,
        width: SizeConfig.widthMultiplier * 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: themeColors[clrNo].withOpacity(0.9),
                spreadRadius: 2.0,
                offset: Offset(0, 2))
          ],
          color: themeColors[clrNo],
        ),
        child: clrNo == themeController.clrNo
            ? Center(
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 35.0,
                ),
              )
            : Container(),
      ),
    );
  }
}

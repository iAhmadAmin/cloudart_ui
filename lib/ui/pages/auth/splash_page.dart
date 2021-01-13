import 'dart:async';

import 'package:cloudart/controllers/theme_controller.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/signin_page.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

final themeController = Get.put(ThemeController());

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SigninPage(),
          ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: themeController.getGrad()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("CloudArt",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.heightMultiplier * 5.5,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    width: 3.0,
                  ),
                  CircleAvatar(
                    radius: 5.0,
                    backgroundColor: themeController.priClr,
                  )
                ]),
            Text(
              "Developed by VirtualSoft\nSoftware House",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                letterSpacing: 3,
                fontWeight: FontWeight.w500,
                color: Colors.grey[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

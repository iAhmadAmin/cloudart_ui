import 'dart:async';
import 'package:cloudart/controllers/theme_controller.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/signin_page.dart';
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
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: themeController.getGrad()),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
      ),
    );
  }
}

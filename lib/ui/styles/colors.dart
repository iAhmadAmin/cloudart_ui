import 'package:flutter/material.dart';

Color dBG = Color(0xFF121212);

Color tPurple = Color(0xFF9647FF);
Color tBlue = Color(0xFF005FDC);
Color tBlueAccent = Color(0xFF1EC2FF);
Color tGreenAccent = Color(0xFF00DCCD);
Color tGreen = Color(0xFF14D98F);
Color tYellow = Color(0xFFE9A608);
Color tPink = Color(0xFFFF6868);

List<Color> themeColors = [
  Color(0xFF9647FF),
  Color(0xFF005FDC),
  Color(0xFF1EC2FF),
  Color(0xFF00DCCD),
  Color(0xFF14D98F),
  Color(0xFFE9A608),
  Color(0xFFFF6868),
];

Color myGreenClr = Color(0xFF00DCCD);
Color myPurpleClr = Color(0xFF9647FF);
Color myGreenAccent = Color(0xFF00DCCD);

List<Color> gradientBG = [
  Color(0xFF00DCCD),
  Color(0xFF9647FF),
];

LinearGradient gradientBackground = LinearGradient(
    begin: Alignment.topRight, end: Alignment.bottomLeft, colors: gradientBG);

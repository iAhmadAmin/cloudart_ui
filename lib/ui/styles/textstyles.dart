import 'package:cloudart/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

var themeController = Get.put(ThemeController());

TextStyle getHeadingStyle(Color clr) {
  return TextStyle(color: clr, fontSize: 18, fontWeight: FontWeight.w600);
}

TextStyle kParaStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  color: Color(0xFF7D7D7D),
);

TextStyle getSelectedStyle(Color clr) {
  return TextStyle(color: clr, fontSize: 22.0, fontWeight: FontWeight.w600);
}

TextStyle kProfileTabStyle = TextStyle(
    color: Color(0xFFB1B1B1), fontSize: 16.0, fontWeight: FontWeight.w400);

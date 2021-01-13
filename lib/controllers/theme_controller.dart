import 'package:cloudart/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ThemeController extends GetxController {
  int clrNo = 4;
  Color priClr = themeColors[4];
  bool switchTheme = true;
  bool isDark = false;

  void changeClr(int n) {
    clrNo = n;
    priClr = themeColors[clrNo];
    update();
  }

  void darkThemeSwitcher() {
    isDark = !isDark;
    update();
  }

  void themeSwitcher() {
    switchTheme = !switchTheme;
    update();
  }

  LinearGradient getGrad() {
    return LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          themeColors[clrNo],
          themeColors[0],
        ]);
  }
}

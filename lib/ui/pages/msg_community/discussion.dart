import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class DiscussionPage extends StatefulWidget {
  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeController.isDark ? dBG : Colors.white,
    );
  }
}

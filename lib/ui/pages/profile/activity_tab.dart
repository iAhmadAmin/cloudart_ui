import 'package:cloudart/models/data.dart';
import 'package:cloudart/models/post.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivitiesTab extends StatefulWidget {
  @override
  _ActivitiesTabState createState() => _ActivitiesTabState();
}

class _ActivitiesTabState extends State<ActivitiesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView.builder(
        itemCount: userActivities.length,
        itemBuilder: (context, index) {
          Post post = userActivities[index];
          return PostTile(post: post);
        },
      ),
    );
  }
}

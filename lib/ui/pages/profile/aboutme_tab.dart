import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/constants/string_values.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:flutter/material.dart';

class AboutMeTab extends StatefulWidget {
  @override
  _AboutMeTabState createState() => _AboutMeTabState();
}

class _AboutMeTabState extends State<AboutMeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.widthMultiplier * 100,
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.widthMultiplier * 95,
                child: Text(
                  loremParagraph,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF7D7D7D)),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              _buildInfoColumn(title: "Name", subtitle: "Mark Hemlin"),
              SizedBox(
                height: 10.0,
              ),
              _buildInfoColumn(title: "Artist Name", subtitle: "Blue Ocean"),
              SizedBox(
                height: 10.0,
              ),
              _buildInfoColumn(title: "Date of birth", subtitle: "22 Jan 1999"),
              SizedBox(
                height: 10.0,
              ),
              _buildInfoColumn(
                  title: "Email", subtitle: "markhemlin@gmail.com"),
              SizedBox(
                height: 20.0,
              ),
              _buildTagGrid(),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ));
  }

  _buildTagGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tags",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildTag(tag: "Art"),
            _buildTag(tag: "Blue Ocean"),
            _buildTag(tag: "Water Color"),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildTag(tag: "Oio Art"),
            _buildTag(tag: "Modern Art"),
          ],
        ),
      ],
    );
  }

  _buildTag({String tag}) {
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[200],
      ),
      child: Text(
        tag,
        style: TextStyle(
            color: Colors.grey[600], fontSize: SizeConfig.textMultiplier * 2.2),
      ),
    );
  }

  _buildInfoColumn({String title, String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF7D7D7D)),
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 22.0,
              color: themeController.isDark
                  ? Colors.white.withOpacity(0.9)
                  : Color(0xFF1D1A1A),
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

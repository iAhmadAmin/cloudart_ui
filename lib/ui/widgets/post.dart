import 'package:cloudart/models/post.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/pages/profile/anotheruserprofile.dart';
import 'package:flutter/material.dart';

class PostTile extends StatefulWidget {
  final Post post;
  PostTile({@required this.post});
  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  _buildSocialButton(String txt, String imgPath) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            imgPath,
            height: 16.0,
          ),
          SizedBox(
            width: 3.0,
          ),
          Text(
            txt,
            style: TextStyle(
                color: Color(0xFF929292),
                fontSize: 10,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  _text(String txt) {
    return Text(
      txt,
      style: TextStyle(
          color: Color(0xFF929292), fontSize: 10, fontWeight: FontWeight.w400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: 360.0,
      width: SizeConfig.widthMultiplier * 100,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AnotherUserProfilePage();
                  }));
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(widget.post.userProfile),
                ),
              ),
              SizedBox(
                width: 14.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.name,
                    style: TextStyle(
                        color: themeController.isDark
                            ? Colors.white.withOpacity(0.9)
                            : Color(0xFF1D1A1A),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.post.userName,
                    style: TextStyle(
                        color: Color(0xFF7D7D7D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
          Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed",
            style: TextStyle(
                color: themeController.isDark
                    ? Colors.white.withOpacity(0.8)
                    : Color(0xFF1D1A1A),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            height: 180,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                widget.post.art,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _text("${widget.post.likes} Likes"),
              _text("${widget.post.comments} Comments"),
              _text("${widget.post.shares} Shares"),
              _text("${widget.post.support} Supports"),
            ],
          ),
          Divider(
            height: 20.0,
            color: Colors.grey[300],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSocialButton("Like", "assets/images/like.png"),
              _buildSocialButton("Comment", "assets/images/com.png"),
              _buildSocialButton("Share", "assets/images/share.png"),
              _buildSocialButton("Support", "assets/images/sup.png"),
            ],
          ),
        ],
      ),
    );
  }
}

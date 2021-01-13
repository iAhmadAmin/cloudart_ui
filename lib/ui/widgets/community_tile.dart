import 'package:cloudart/models/community.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/msg_community/communitychat.dart';
import 'package:cloudart/ui/pages/msg_community/joincommunity.dart';
import 'package:cloudart/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class CommunityTile extends StatelessWidget {
  final Community community;
  final bool isSearchComm;
  CommunityTile({@required this.community, @required this.isSearchComm});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return isSearchComm == true
              ? JoinCommunityPage()
              : CommunityChatPage(
                  community: community,
                );
        }));
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          height: 240.0,
          width: SizeConfig.widthMultiplier * 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:
                  community.communityName == "new" ? myGreenClr : Colors.white),
          child: community.communityName != "new"
              ? Stack(
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(4, (index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: index == 0
                                ? Radius.circular(30.0)
                                : Radius.circular(0),
                            topRight: index == 1
                                ? Radius.circular(30.0)
                                : Radius.circular(0),
                            bottomLeft: index == 2
                                ? Radius.circular(30.0)
                                : Radius.circular(0),
                            bottomRight: index == 3
                                ? Radius.circular(30.0)
                                : Radius.circular(0),
                          ),
                          child: Image.asset(
                            community.coverImages[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                    ),
                    Container(
                      width: SizeConfig.widthMultiplier * 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black12,
                                Colors.black45,
                                Colors.black87
                              ])),
                    ),
                    Container(
                      width: SizeConfig.widthMultiplier * 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            community.communityName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${community.totalMembers}+ Members  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(
                  width: SizeConfig.widthMultiplier * 45,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40.0,
                        ),
                        Text(
                          "Create a Community",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ]),
                )),
    );
  }
}

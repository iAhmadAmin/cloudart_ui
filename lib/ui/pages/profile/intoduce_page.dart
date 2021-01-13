import 'package:cloudart/ui/constants/size_config.dart';
import 'package:flutter/material.dart';

class IntroducePage extends StatefulWidget {
  @override
  _IntroducePageState createState() => _IntroducePageState();
}

class _IntroducePageState extends State<IntroducePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        decoration: BoxDecoration(color: Colors.white),
        // child: Column(
        //   children: [
        //     Container(
        //       height: SizeConfig.heightMultiplier * 20.0,
        //       width: SizeConfig.widthMultiplier * 100,
        //       decoration: BoxDecoration(
        //           color: Colors.blue,
        //           // gradient: gradientBackground,
        //           borderRadius: BorderRadius.only(
        //             bottomLeft: Radius.circular(50.0),
        //             // bottomRight: Radius.circular(50.0),
        //           )),
        //           child: Center(child: CircleAvatar(

        //           )),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

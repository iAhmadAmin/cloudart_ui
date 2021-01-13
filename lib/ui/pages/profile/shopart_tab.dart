import 'package:cloudart/controllers/theme_controller.dart';
import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/instance_manager.dart';

class ShopArtTab extends StatefulWidget {
  @override
  _ShopArtTabState createState() => _ShopArtTabState();
}

class _ShopArtTabState extends State<ShopArtTab> {
  var themeController = Get.put(ThemeController());

  List<String> artsPath = [
    "assets/images/art1.png",
    "assets/images/art3.png",
    "assets/images/art4.png",
    "assets/images/art5.png",
    "assets/images/art2.png",
    "assets/images/art6.png",
    "assets/images/art7.png",
    "assets/images/art8.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Art (10+)",
                style: TextStyle(
                    color: themeController.isDark
                        ? Colors.white.withOpacity(0.9)
                        : Color(0xFF1D1A1A),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "\$150.0",
                style: TextStyle(
                    color: themeController.priClr,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            "Lorem ipsum dolor sit amet, consetet adips elitrised diam nonumy eirmod.",
            style: kParaStyle,
          ),
          Expanded(
              child: Container(
            child: StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: 4,
              itemCount: artsPath.length + 1,
              itemBuilder: (context, i) {
                if (i < artsPath.length) {
                  String imgPath = artsPath[i];
                  return Material(
                    elevation: 0.0,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(8.0)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(imgPath, fit: BoxFit.cover)),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.only(left: 12.0),
                    height: 60.0,
                    width: SizeConfig.widthMultiplier * 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: themeController.priClr.withOpacity(0.2)),
                    child: Center(
                      child: Text(
                        "Create New Item",
                        style: TextStyle(
                            color: themeController.priClr,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                }
              },
              staggeredTileBuilder: (i) =>
                  new StaggeredTile.count(2, i.isEven ? 2 : 3),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
          )),
        ],
      ),
    );
  }
}
